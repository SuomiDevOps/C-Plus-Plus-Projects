# CMake version
cmake_minimum_required(VERSION 3.15)
#
set(CMAKE_CXX_STANDARD 14)
# Project name
project(VarianPractice)

# Set build type
set(CMAKE_BUILD_TYPE Debug)

# Export compile commands
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# Set C compiler
set(CMAKE_C_COMPILER "C:/msys64/mingw64/bin/gcc.exe")

# Set C++ compiler
set(CMAKE_CXX_COMPILER "C:/msys64/mingw64/bin/g++.exe")

# Include Google Test using FetchContent
include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.11.0
)
FetchContent_MakeAvailable(googletest)

# Add subdirectories
add_subdirectory(src/lib/mylib)
add_subdirectory(src/app)
add_subdirectory(src/test)
