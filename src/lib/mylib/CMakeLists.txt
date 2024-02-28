# src/lib/mylib/CMakeLists.txt
# mylib CMake configuration
add_library(mylib STATIC mylib.cpp)
target_include_directories(mylib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
