//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Aljwhra Alnasser on 15/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var itemSelected1 = 0
    @State private var itemSelected2 = 1
    @State private var amount : String = ""
    
    private let currencies = ["SAR", "EUR" , "USD"]
    
    func convert(_ convert: String)-> String{
        
        var conversion: Double = 1.0
        let amount = Double(convert) ?? 0.0
        let selectedCurrency = currencies[itemSelected1]
        let to = currencies[itemSelected2]
        
        let rialRates = ["SAR": 1.0, "EUR": 0.25, "USD": 0.27]
        let euroRates = ["SAR": 4.08, "EUR": 1.0, "USD": 1.09]
        let dollarRates = ["SAR": 3.75, "EUR": 0.92, "USD": 1.0]
        
        
        switch (selectedCurrency){
            
        case "SAR" :
            conversion = amount * (rialRates[to] ?? 0.0)
            
        case "EUR":
            conversion = amount * (euroRates[to] ?? 0.0)
            
        case "USD":
            conversion = amount * (dollarRates[to] ?? 0.0)
            
        default:
            print("Something went wrong!")
        }
        return String(format: "%.2f", conversion)
        
        
        
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Convert a Currency")
                    .font(.title)
                
                TextField("Enter an amount", text: $amount)
                    .keyboardType(.decimalPad)
                
                HStack{
                    Text("From")
                    Picker(selection: $itemSelected1, label: Text("From")){
                        ForEach(0..<currencies.count){ index in
                            
                            Text(self.currencies[index]).tag(index)
                        }
                    }
                }
                HStack{
                    Text("To")
                    
                    Picker(selection: $itemSelected2, label: Text("To")){
                        ForEach(0..<currencies.count){ index in
                            Text(self.currencies[index]).tag(index)
                        }
                    }
                }
                
                Text("Conversion")
                    .font(.title2)
                Text("\(convert(amount)) \(currencies[itemSelected2])")
                
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
