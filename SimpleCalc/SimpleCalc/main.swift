//
//  main.swift
//  SimpleCalc
//
//  Created by David Yuan on 4/4/16.
//  Copyright © 2016 David Yuan. All rights reserved.
//

import Foundation

// create array
var intlist =  [Double]()
let whitespace = NSCharacterSet.whitespaceCharacterSet()

print("Enter an expression separated by returns:")

// Take in First Expression
let response = readLine(stripNewline: true)!
// check to see if there are white spaces
let ws = response.rangeOfCharacterFromSet(whitespace)

//takes input and does a simple calculation
func simpCalc(num: Double) {
    // Takes in Operand
    let operand = readLine(stripNewline: true)!
    let symbol : String = String(UTF8String: operand)!
    
    // Takes in Second Number
    let input2 = readLine(stripNewline: true)!
    let response2 : String = String(UTF8String: input2)!
    let num2 = Double(response2)
    
    if symbol == "+" {
        print(num + num2!)
    } else if symbol == "-" {
        print (num - num2!)
    } else if symbol == "*" {
        print (num * num2!)
    } else if symbol == "%" {
        print (num % num2!)
    } else if symbol == "/" {
        print (num / num2!)
    } else {
        print ("Invalid operator")
    }
}

// Prints numbers of "numbers" inputted
func count() {
    print(intlist.count)
}

// Prints average of inputted numbers
func average() {
    var sum = 0.0
    for number in intlist{
        sum += number
    }
    let ave = sum / Double(intlist.count)
    print(ave)
}

// Prints factorial of inputted number
func fact() {
    if(intlist.count > 1) {
        print("Sorry, you have too many numbers")
    } else {
        var factorial = 1
        for int in 1...(Int(intlist[0])) {
            factorial *= int
        }
        print(factorial)
    }
}

//takes input and does complex calculations
func complexCalc() {
    let string : String = String(UTF8String: response)!
    let numList = string.characters.split{$0 == " "}.map(String.init)
    for index in 0...(numList.count - 2) {
        intlist.append(Double(numList[index])!)
    }
    let multioperator = numList[numList.count-1]
    if multioperator == "count" {
        count()
    } else if multioperator == "average" {
        average()
    } else if multioperator == "fact" {
        fact()
    } else {
        print ("Invalid operator")
    }
}

// range will be nil if no whitespace is found
if let test = ws {
    complexCalc()
} else { // normal calculator
    let string : String = String(UTF8String: response)!
    let num = Double(string)
    simpCalc(num!)
}
