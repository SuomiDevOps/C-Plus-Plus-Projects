#!/bin/bash

# Default values
BUILD_TYPE="Debug"
EXPORT_COMPILE_COMMANDS="TRUE"
C_COMPILER="C:/msys64/mingw64/bin/gcc.exe"
CXX_COMPILER="C:/msys64/mingw64/bin/g++.exe"
SOURCE_DIR="$(pwd)"
BUILD_DIR="./build"
GENERATOR="MinGW Makefiles"

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  --build-type <type>        Build type (default: Debug)"
            echo "  --export-compile-commands  Export compile commands (default: TRUE)"
            echo "  --c-compiler <path>        Path to C compiler (default: $C_COMPILER)"
            echo "  --cxx-compiler <path>      Path to C++ compiler (default: $CXX_COMPILER)"
            echo "  --build-dir <path>         Path to build directory (default: $BUILD_DIR)"
            echo "  --generator <name>         CMake generator (default: $GENERATOR)"
            exit 0
            ;;
        --build-type)
            BUILD_TYPE="$2"
            shift 2
            ;;
        --export-compile-commands)
            EXPORT_COMPILE_COMMANDS="$2"
            shift 2
            ;;
        --c-compiler)
            C_COMPILER="$2"
            shift 2
            ;;
        --cxx-compiler)
            CXX_COMPILER="$2"
            shift 2
            ;;
        --build-dir)
            BUILD_DIR="$2"
            shift 2
            ;;
        --generator)
            GENERATOR="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Remove existing CMake files and cache
rm -rf "$(dirname "$0")/$BUILD_DIR/CMakeFiles" "$(dirname "$0")/$BUILD_DIR/CMakeCache.txt"

# Create the build directory if it does not exist
mkdir -p "$(dirname "$0")/$BUILD_DIR"

# Navigate to the build directory
cd "$(dirname "$0")/$BUILD_DIR"

# Run CMake configuration
"C:/Program Files/CMake/bin/cmake.EXE" --no-warn-unused-cli \
    -G "$GENERATOR" \
    -DCMAKE_BUILD_TYPE:STRING="$BUILD_TYPE" \
    -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL="$EXPORT_COMPILE_COMMANDS" \
    -DCMAKE_C_COMPILER:FILEPATH="$C_COMPILER" \
    -DCMAKE_CXX_COMPILER:FILEPATH="$CXX_COMPILER" \
    -S "$SOURCE_DIR" -B .

# Run the build process
mingw32-make
