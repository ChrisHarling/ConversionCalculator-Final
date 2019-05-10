//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Christopher Harling on 5/9/19.
//  Copyright © 2019 Christopher Harling. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    let conversion = TypeConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputDisplay.text = conversion.convertArray[0].outputUnit
        inputDisplay.text = conversion.convertArray[0].inputUnit
    }
    
    @IBAction func conversionAction(_ sender: Any) {
        let actionSheetConversion = UIAlertController(title: "Conversions", message: "Select a conversion type", preferredStyle: UIAlertController.Style.actionSheet)
        
        let fahrToCel = UIAlertAction(title: conversion.convertArray[0].label, style: .default) { action in
            self.conversion.conversionType = 0
            self.conversionButton()
        }
        
        let celToFahr = UIAlertAction(title: conversion.convertArray[1].label, style: .default) { action in
            self.conversion.conversionType = 1
            self.conversionButton()
        }
        
        let milToKilo = UIAlertAction(title: conversion.convertArray[2].label, style: .default) { action in
            self.conversion.conversionType = 2
            self.conversionButton()
        }
        
        let kiloToMil = UIAlertAction(title: conversion.convertArray[3].label, style: .default) { action in
            self.conversion.conversionType = 3
            self.conversionButton()
        }
        
        actionSheetConversion.addAction(fahrToCel)
        actionSheetConversion.addAction(celToFahr)
        actionSheetConversion.addAction(milToKilo)
        actionSheetConversion.addAction(kiloToMil)
        
        present(actionSheetConversion, animated: true, completion: nil)
    }
    
    @IBAction func changeSign(_ sender: UIButton) {
        var inputString = inputDisplay.text
        if inputString!.hasPrefix(" ") {
            return
        } else {
            if inputString!.hasPrefix("-") {
                inputString!.remove(at: inputString!.startIndex)
                inputDisplay.text = inputString!
                inputString = self.removeLabelFromInput()
                
                if inputString != "." {
                    let conversionInput = Double(inputString!)
                    outputDisplay.text = String(conversion.convert(conversionInput!)) + conversion.convertArray[conversion.conversionType].outputUnit
                } else {
                    outputDisplay.text = inputString! + conversion.convertArray[conversion.conversionType].outputUnit
                }
            } else {
                inputString!.insert("-", at: inputString!.startIndex)
                inputDisplay.text = inputString!
                inputString = self.removeLabelFromInput()
                if inputString != "-." {
                    let conversionInput = Double(inputString!)
                    outputDisplay.text = String(conversion.convert(conversionInput!)) + conversion.convertArray[conversion.conversionType].outputUnit
                } else {
                    outputDisplay.text = inputString! + conversion.convertArray[conversion.conversionType].outputUnit
                }
            }
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        inputDisplay.text = conversion.convertArray[conversion.conversionType].inputUnit
        outputDisplay.text = conversion.convertArray[conversion.conversionType].outputUnit
        conversion.decimal = false
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        numberUpdate(sender.titleLabel!.text!)
    }
    
    func numberUpdate(_ inputNumber: String) {
        if inputNumber == "." && conversion.decimal == true {
            return
        } else if inputNumber == "." && conversion.decimal == false {
            conversion.decimal = true
        }
        
        var inputString = removeLabelFromInput()
        inputString += inputNumber
        
        let conversionInput = Double(inputString)
        
        inputString += conversion.convertArray[conversion.conversionType].inputUnit
        
        if inputString.hasPrefix(".") {
            inputDisplay.text = inputString
            outputDisplay.text = inputNumber + conversion.convertArray[conversion.conversionType].outputUnit
        } else {
            inputDisplay.text = inputString
            outputDisplay.text = String(conversion.convert(conversionInput!)) + conversion.convertArray[conversion.conversionType].outputUnit
        }
    }
    
    func conversionButton() {
        let inputString = removeLabelFromInput()
        let conversionInput = Double(inputString)
        
        inputDisplay.text = inputString + conversion.convertArray[conversion.conversionType].inputUnit
        
        if inputString != "" {
            if inputString == "." && inputString == "-." {
                outputDisplay.text = inputString + conversion.convertArray[conversion.conversionType].outputUnit
            } else {
                outputDisplay.text =  String(conversion.convert(conversionInput!)) + conversion.convertArray[conversion.conversionType].outputUnit
            }
        } else {
            outputDisplay.text = conversion.convertArray[conversion.conversionType].outputUnit
        }
    }
    
    func removeLabelFromInput() -> String {
        var inputString = inputDisplay.text
        let inputLabel = (inputString!.index(inputString!.endIndex, offsetBy: -3))..<inputString!.endIndex
        inputString!.removeSubrange(inputLabel)
        return inputString!
    }
}
