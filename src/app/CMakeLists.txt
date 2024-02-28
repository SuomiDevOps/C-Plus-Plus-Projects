# src/app/CMakeLists.txt

# Add the executable
add_executable(MyApp main.cpp)

# Link with mylib and gtest
target_link_libraries(MyApp PRIVATE mylib gtest_main)

# Include directories for Google Test headers
target_include_directories(MyApp PRIVATE ${CMAKE_BINARY_DIR}/googletest/include)

# Add the test to CTest
add_test(NAME MyTest COMMAND MyApp)
