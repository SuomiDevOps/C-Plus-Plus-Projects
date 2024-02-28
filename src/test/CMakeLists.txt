# src/test/CMakeLists.txt

# Add the test executable
add_executable(TestMain test_main.cpp)

# Link with mylib and gtest
target_link_libraries(TestMain PRIVATE mylib gtest_main)

# Include directories for Google Test headers
target_include_directories(TestMain PRIVATE ${CMAKE_BINARY_DIR}/googletest/include)

# Specify that this is a console application: set_target_properties(TestMain PROPERTIES WIN32_EXECUTABLE FALSE) 
# sets the WIN32_EXECUTABLE property for the TestMain target to FALSE, indicating that it is not a Windows GUI application 
#(i.e., it's a console application). If WIN32_EXECUTABLE is set to TRUE, it would be treated as a GUI application
set_target_properties(TestMain PROPERTIES WIN32_EXECUTABLE FALSE)
