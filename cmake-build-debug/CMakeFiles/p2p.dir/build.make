# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/clion-2018.1.2/bin/cmake/bin/cmake

# The command to remove a file.
RM = /opt/clion-2018.1.2/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/marian/p2p

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/marian/p2p/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/p2p.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/p2p.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/p2p.dir/flags.make

CMakeFiles/p2p.dir/p2p.c.o: CMakeFiles/p2p.dir/flags.make
CMakeFiles/p2p.dir/p2p.c.o: ../p2p.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marian/p2p/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/p2p.dir/p2p.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/p2p.dir/p2p.c.o   -c /home/marian/p2p/p2p.c

CMakeFiles/p2p.dir/p2p.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/p2p.dir/p2p.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/marian/p2p/p2p.c > CMakeFiles/p2p.dir/p2p.c.i

CMakeFiles/p2p.dir/p2p.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/p2p.dir/p2p.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/marian/p2p/p2p.c -o CMakeFiles/p2p.dir/p2p.c.s

CMakeFiles/p2p.dir/p2p.c.o.requires:

.PHONY : CMakeFiles/p2p.dir/p2p.c.o.requires

CMakeFiles/p2p.dir/p2p.c.o.provides: CMakeFiles/p2p.dir/p2p.c.o.requires
	$(MAKE) -f CMakeFiles/p2p.dir/build.make CMakeFiles/p2p.dir/p2p.c.o.provides.build
.PHONY : CMakeFiles/p2p.dir/p2p.c.o.provides

CMakeFiles/p2p.dir/p2p.c.o.provides.build: CMakeFiles/p2p.dir/p2p.c.o


# Object files for target p2p
p2p_OBJECTS = \
"CMakeFiles/p2p.dir/p2p.c.o"

# External object files for target p2p
p2p_EXTERNAL_OBJECTS =

p2p: CMakeFiles/p2p.dir/p2p.c.o
p2p: CMakeFiles/p2p.dir/build.make
p2p: CMakeFiles/p2p.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/marian/p2p/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable p2p"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/p2p.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/p2p.dir/build: p2p

.PHONY : CMakeFiles/p2p.dir/build

CMakeFiles/p2p.dir/requires: CMakeFiles/p2p.dir/p2p.c.o.requires

.PHONY : CMakeFiles/p2p.dir/requires

CMakeFiles/p2p.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/p2p.dir/cmake_clean.cmake
.PHONY : CMakeFiles/p2p.dir/clean

CMakeFiles/p2p.dir/depend:
	cd /home/marian/p2p/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marian/p2p /home/marian/p2p /home/marian/p2p/cmake-build-debug /home/marian/p2p/cmake-build-debug /home/marian/p2p/cmake-build-debug/CMakeFiles/p2p.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/p2p.dir/depend

