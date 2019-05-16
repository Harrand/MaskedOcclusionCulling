////////////////////////////////////////////////////////////////////////////////
// Copyright 2017 Intel Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License.  You may obtain a copy
// of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
// License for the specific language governing permissions and limitations
// under the License.
////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Common shared include file to hide compiler/os specific functions from the rest of the code. 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#if defined(_MSC_VER) && !defined(__INTEL_COMPILER) && !defined(__clang__)
	#define __MICROSOFT_COMPILER
#endif

#if defined(_WIN32)	&& (defined(_MSC_VER) || defined(__INTEL_COMPILER) || defined(__clang__)) // Windows: MSVC / Intel compiler / clang
	#include <intrin.h>
	#include <new.h>

	#define FORCE_INLINE __forceinline

	FORCE_INLINE unsigned long find_clear_lsb(unsigned int *mask)
	{
		unsigned long idx;
		_BitScanForward(&idx, *mask);
		*mask &= *mask - 1;
		return idx;
	}

	FORCE_INLINE void *aligned_alloc(size_t alignment, size_t size)
	{
		return _aligned_malloc(size, alignment);
	}

	FORCE_INLINE void aligned_free(void *ptr)
	{
		_aligned_free(ptr);
	}

#elif defined(__GNUG__)	|| defined(__clang__) // G++ or clang
	#include <cpuid.h>
#if defined(__ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__)
	#include <malloc/malloc.h> // memalign
#else
	//#include <malloc.h> // memalign
	// memalign isnt in MinGW64. implement myself. -Harrand
	inline void *memalign(size_t alignment, size_t bytes)
	{
		// we need to allocate enough storage for the requested bytes, some
		// book-keeping (to store the location returned by malloc) and some extra
		// padding to allow us to find an aligned byte.  im not entirely sure if
		// 2 * alignment is enough here, its just a guess.
		const size_t total_size = bytes + (2 * alignment) + sizeof(size_t);

		// use malloc to allocate the memory.
		char *data = reinterpret_cast<char*>(malloc(sizeof(char) * total_size));

		if (data)
		{
			// store the original start of the malloc'd data.
			const void * const data_start = data;

			// dedicate enough space to the book-keeping.
			data += sizeof(size_t);

			// find a memory location with correct alignment.  the alignment minus
			// the remainder of this mod operation is how many bytes forward we need
			// to move to find an aligned byte.
			const size_t offset = alignment - (((size_t)data) % alignment);

			// set data to the aligned memory.
			data += offset;

			// write the book-keeping.
			size_t *book_keeping = (size_t*)(data - sizeof(size_t));
			*book_keeping = (size_t)data_start;
		}

		return data;
	}
#endif
	#include <mm_malloc.h>
	#include <immintrin.h>
	#include <new>

	#define FORCE_INLINE inline

	FORCE_INLINE unsigned long find_clear_lsb(unsigned int *mask)
	{
		unsigned long idx;
		idx = __builtin_ctzl(*mask);
		*mask &= *mask - 1;
		return idx;
	}

	FORCE_INLINE void *aligned_alloc(size_t alignment, size_t size)
	{
		return memalign(alignment, size);
	}


inline void aligned_free(void *raw_data)
{
    if (raw_data)
    {
        char *data = reinterpret_cast<char*>(raw_data);

        // we have to assume this memory was allocated with malloc_aligned.
        // this means the sizeof(size_t) bytes before data are the book-keeping
        // which points to the location we need to pass to free.
        data -= sizeof(size_t);

        // set data to the location stored in book-keeping.
        data = (char*)(*((size_t*)data));

        // free the memory.
        free(data);
    }
}
    /*
	FORCE_INLINE void aligned_free(void *ptr)
	{
		free(ptr);
	}
     */

	FORCE_INLINE void __cpuidex(int* cpuinfo, int function, int subfunction)
	{
		__cpuid_count(function, subfunction, cpuinfo[0], cpuinfo[1], cpuinfo[2], cpuinfo[3]);
	}

	FORCE_INLINE unsigned long long _xgetbv(unsigned int index)
	{
		unsigned int eax, edx;
		__asm__ __volatile__(
			"xgetbv;"
			: "=a" (eax), "=d"(edx)
			: "c" (index)
		);
		return ((unsigned long long)edx << 32) | eax;
	}

#else
	#error Unsupported compiler
#endif
