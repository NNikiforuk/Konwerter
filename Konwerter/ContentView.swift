//
//  ContentView.swift
//  Konwerter
//
//  Created by Natalia Nikiforuk on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0.0
    @State private var result = 0.0
    @State private var alertTitle = ""
    @State private var showAlert = false
    
    enum Choices: String {
        case h, min
    }
    
    @State private var selectedFrom: Choices = .h
    @State private var selectedTo: Choices = .min
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Value", value: $value, format: .number.precision(.fractionLength(2)))
                        .onChange(of: value) {
                                    conversion()
                                }
                }
                Section {
                            Picker("From", selection: $selectedFrom) {
                                Text("h").tag(Choices.h)
                                Text("min").tag(Choices.min)
                            }
                            .onChange(of: selectedFrom) {
                                        conversion()
                                    }
                            Picker("To", selection: $selectedTo) {
                                Text("h").tag(Choices.h)
                                Text("min").tag(Choices.min)
                            }
                            .onChange(of: selectedTo) {
                                        conversion()
                                    }
                }
                Section {
                    Text("The result is: \(result, specifier: "%.2f")")
                        .bold()
                }
            }
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Dismiss", role: .cancel) {}
        }
    }
    
    func displayAlert(title: String) {
        alertTitle = title
        showAlert = true
    }
    
    func conversion() {
        if value < 0 {
            displayAlert(title: "Incorrect value: negative number")
            return
        }
        
        if selectedFrom == selectedTo {
            displayAlert(title: "FYI: it's the same unit")
            return
        }
        
        if selectedFrom == .h  && selectedTo == .min {
            result = value * 60
        } else {
            result = value / 60
        }
    }
}


#Preview {
    ContentView()
}
