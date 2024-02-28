#include "../lib/mylib/mylib.h"
#include <gtest/gtest.h>

namespace Myclass
{
    
// Function to run tests
int runTests(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

// Main application logic
int main(int argc, char **argv) {
    // Run tests if a command-line argument is provided
    if (argc > 1 && strcmp(argv[1], "--run-tests") == 0) {
        return runTests(argc, argv);
    }

    // Your main application logic here
    std::unique_ptr<Greetings> ptr = std::make_unique<Greetings>();
    ptr.get()->say_greeting();
    return 0;
}
} // namespace name

