//
//  ConverterType.swift
//  Conversion Calculator
//
//  Created by Christopher Harling on 5/9/19.
//  Copyright © 2019 Christopher Harling. All rights reserved.
//

import Foundation

class TypeConverter {
    var conversionType = 0
    var decimal = false

    let convertArray: Array<Conversions> = [
        Conversions(label: "Farenheit to Celsius", inputUnit: " °F", outputUnit: " °C"),
        Conversions(label: "Celsius to Farenheit", inputUnit: " °C", outputUnit: " °F"),
        Conversions(label: "Miles to Kilometers", inputUnit: " mi", outputUnit: " km"),
        Conversions(label: "Kilometers to Miles", inputUnit: " km", outputUnit: " mi")]
    
    func convert(_ inputNumber: Double) -> Double{
        switch conversionType {
        case 0:
            let x = Double((inputNumber - 32)/(9/5))
            let y = Double(round(1000*x)/1000)
            return y
        case 1:
            let x = Double((inputNumber * 9/5) + (32))
            let y = Double(round(1000*x)/1000)
            return y
        case 2:
            let x = Double(inputNumber * 1.609344)
            let y = Double(round(1000*x)/1000)
            return y
        case 3:
            let x = Double(inputNumber/1.609344)
            let y = Double(round(1000*x)/1000)
            return y
        default:
            return 0
        }
    }
}
