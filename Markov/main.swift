//
//  main.swift
//  Markov
//
//  Created by Benjamin on 05/10/2018.
//  Copyright © 2018 BenRx. All rights reserved.
//

import Foundation

print("Welcome to the machine that forecasts rain and sunshine")
print("Today the weather is sunny")
print("In how many days do you want to know the weather ?")
print(">>>>>>>")
var input = readLine(strippingNewline: true)!
while !input.isNumber {
    print("Your entry is not correct. Please enter en number")
    print(">>>>>>>")
    input = readLine(strippingNewline: true)!
}
print("You have chosen +\(input) days from today")
var weatherMachine = WeatherMachine(numberOfDays: Int(input)!)
