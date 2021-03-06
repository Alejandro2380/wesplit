//
//  ContentView.swift
//  wesplit
//
//  Created by Alejandro McGarvie on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double{
        let tipSelection = Double(tipPercentage)
        let peopleCount = Double(numberOfPeople + 2)
        let tipValue = checkAmount * (tipSelection/100);
        let grandTotal = checkAmount + tipValue;
        let amountPerPerson = grandTotal / peopleCount;
        return amountPerPerson;
    }
    var body: some View {
        NavigationView {
        Form {
            Section {
                Text("Check Total")
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                Picker("Tip Percentage", selection: $tipPercentage){
                    ForEach(tipPercentages, id: \.self){
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
            } header : {
                Text("How much tip do you wnat to leave?")
            }
            Section
            {   Text("Total per person")
                Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
        }
            .navigationTitle("WeSplit")
        }
        
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
