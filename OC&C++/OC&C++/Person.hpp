//
//  Person.hpp
//  OC&C++
//
//  Created by Kevin on 2020/8/4.
//  Copyright © 2020 Kevin. All rights reserved.
//

#ifndef Person_hpp
#define Person_hpp

#include <stdio.h>

namespace Lefex {
class Person {
public:
    int age;
    bool isChild();
private:
    float height;
    bool isNomalHeight();
};
}

class Man: public Lefex::Person {
    
};

class Woman: public Lefex::Person {
    
};

class Freak: public Man,public Woman {
    
};

#endif /* Person_hpp */
