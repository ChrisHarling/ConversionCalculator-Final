//
//  Conversions.swift
//  Conversion Calculator
//
//  Created by Christopher Harling on 5/9/19.
//  Copyright © 2019 Christopher Harling. All rights reserved.
//

import Foundation

struct Conversions {
    var label: String
    var inputUnit: String
    var outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String) {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
