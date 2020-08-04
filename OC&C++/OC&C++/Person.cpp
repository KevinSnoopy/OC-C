//
//  Person.cpp
//  OC&C++
//
//  Created by Kevin on 2020/8/4.
//  Copyright © 2020 Kevin. All rights reserved.
//

#include "Person.hpp"

namespace Lefex {
bool Person::isChild() {
    return age >= 18;
}

bool Person::isNomalHeight() {
    return height >= 170;
}
}


void test() {
    Lefex:: Person aPerson;
    aPerson.age = 18;
    
    Lefex:: Person *bPerson = new Lefex:: Person();
    bPerson->age = 18;
    
    delete bPerson;
}
