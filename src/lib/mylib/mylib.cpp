#include "mylib.h"
#include <iostream>

namespace Myclass
{
    Greetings::Greetings(){}

    Greetings::~Greetings(){}

    void Greetings::say_greeting(){
        std::cout<<"Hello World"<<std::endl;        
    };
    
} // namespace Myclass