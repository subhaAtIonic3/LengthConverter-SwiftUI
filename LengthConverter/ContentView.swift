//
//  ContentView.swift
//  LengthConverter
//
//  Created by Subhrajyoti Chakraborty on 14/05/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let units = ["Meters", "Kilometres", "Feet", "Yards", "Miles"]
    @State private var userInput = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    var convertedOutput: Double {
        let inputLength = Measurement(value: Double(userInput) ?? 0, unit: getUnit(selector: inputUnit))
        let outputLength = inputLength.converted(to: getUnit(selector: outputUnit))
        return outputLength.value
    }
    
    func getUnit(selector: Int) -> UnitLength {
        switch selector {
        case 0:
            return .meters
        case 1:
            return .kilometers
        case 2:
            return .feet
        case 3:
            return.yards
        case 4:
            return .miles
        default:
            return .meters
        }
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your length", text: $userInput)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Selected input unit")) {
                    Picker("Selected input unit", selection: $inputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("Converted length is  \(convertedOutput, specifier: "%.2f")")
                    
                }
                Section(header: Text("Selected output unit")) {
                    Picker("Selected output unit", selection: $outputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
