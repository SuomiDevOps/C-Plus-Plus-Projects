#include <gtest/gtest.h>
#include "../lib/mylib/mylib.h"

namespace Myclass
{
    
TEST(MyTestSuite, TestMyLibFunction) {
    // Your test logic here
    
    // Redirect cout to a stringstream
    std::stringstream buffer;
    std::streambuf* oldCout = std::cout.rdbuf(buffer.rdbuf());

    // Call the function that prints to cout
    std::unique_ptr<Greetings> ptr;
    ptr->say_greeting();

    // Restore the original cout
    std::cout.rdbuf(oldCout);

    // Compare the printed output with the expected string
    ASSERT_EQ(buffer.str(), "helloworld\n");
}

} // namespace Myclass
