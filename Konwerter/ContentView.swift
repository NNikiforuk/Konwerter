//
//  ContentView.swift
//  Konwerter
//
//  Created by Natalia Nikiforuk on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0
    @State private var result = 0
    @State private var selectedFrom = "h"
    @State private var selectedTo = "h"
    
    let choices = ["h", "min"]
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Value", value: $value, format: .number)
                        .onChange(of: value) {
                                    conversion()
                                }
                }
                Section {
                            Picker("From", selection: $selectedFrom) {
                                ForEach(choices, id: \.self) {
                                    Text($0)
                                }
                            }
                            .onChange(of: selectedFrom) {
                                        conversion()
                                    }
                            Picker("To", selection: $selectedTo) {
                                ForEach(choices, id: \.self) {
                                    Text($0)
                                }
                            }
                            .onChange(of: selectedTo) {
                                        conversion()
                                    }
                }
                Section {
                    Text("The result is: \(result)")
                        .bold()
                }
            }
        }
    }
    
    func conversion() {
        if selectedFrom == "h" {
            if selectedTo == "min" {
                result = value * 60
            } else {
                result = value
            }
        }
        if selectedFrom == "min" {
            if selectedTo == "h" {
                result = value / 60
            } else {
                result = value
            }
        }
    }
}

#Preview {
    ContentView()
}
