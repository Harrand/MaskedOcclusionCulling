# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2017.3.3\bin\cmake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2017.3.3\bin\cmake\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Example.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Example.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Example.dir/flags.make

CMakeFiles/Example.dir/ExampleMain.cpp.obj: CMakeFiles/Example.dir/flags.make
CMakeFiles/Example.dir/ExampleMain.cpp.obj: CMakeFiles/Example.dir/includes_CXX.rsp
CMakeFiles/Example.dir/ExampleMain.cpp.obj: ../ExampleMain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Example.dir/ExampleMain.cpp.obj"
	C:\mingw64\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\Example.dir\ExampleMain.cpp.obj -c C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\ExampleMain.cpp

CMakeFiles/Example.dir/ExampleMain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Example.dir/ExampleMain.cpp.i"
	C:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\ExampleMain.cpp > CMakeFiles\Example.dir\ExampleMain.cpp.i

CMakeFiles/Example.dir/ExampleMain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Example.dir/ExampleMain.cpp.s"
	C:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\ExampleMain.cpp -o CMakeFiles\Example.dir\ExampleMain.cpp.s

CMakeFiles/Example.dir/ExampleMain.cpp.obj.requires:

.PHONY : CMakeFiles/Example.dir/ExampleMain.cpp.obj.requires

CMakeFiles/Example.dir/ExampleMain.cpp.obj.provides: CMakeFiles/Example.dir/ExampleMain.cpp.obj.requires
	$(MAKE) -f CMakeFiles\Example.dir\build.make CMakeFiles/Example.dir/ExampleMain.cpp.obj.provides.build
.PHONY : CMakeFiles/Example.dir/ExampleMain.cpp.obj.provides

CMakeFiles/Example.dir/ExampleMain.cpp.obj.provides.build: CMakeFiles/Example.dir/ExampleMain.cpp.obj


# Object files for target Example
Example_OBJECTS = \
"CMakeFiles/Example.dir/ExampleMain.cpp.obj"

# External object files for target Example
Example_EXTERNAL_OBJECTS =

Example.exe: CMakeFiles/Example.dir/ExampleMain.cpp.obj
Example.exe: CMakeFiles/Example.dir/build.make
Example.exe: MaskedOcclusionCulling/libMaskedOcclusionCulling.a
Example.exe: CMakeFiles/Example.dir/linklibs.rsp
Example.exe: CMakeFiles/Example.dir/objects1.rsp
Example.exe: CMakeFiles/Example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Example.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\Example.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Example.dir/build: Example.exe

.PHONY : CMakeFiles/Example.dir/build

CMakeFiles/Example.dir/requires: CMakeFiles/Example.dir/ExampleMain.cpp.obj.requires

.PHONY : CMakeFiles/Example.dir/requires

CMakeFiles/Example.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\Example.dir\cmake_clean.cmake
.PHONY : CMakeFiles/Example.dir/clean

CMakeFiles/Example.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\cmake-build-debug C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\cmake-build-debug C:\Users\Harrand\Programming\Projects\MaskedOcclusionCulling\Example\cmake-build-debug\CMakeFiles\Example.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Example.dir/depend

