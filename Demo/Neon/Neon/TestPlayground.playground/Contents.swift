//: Playground - noun: a place where people can play

import Cocoa

enum MyEnum {
    case A
    case B
    case C
    case D
}

let x : MyEnum = .B

switch x {
case .A, .B:
    print("A")

case .C:
    print("C")

case .D:
    print("D")
}
