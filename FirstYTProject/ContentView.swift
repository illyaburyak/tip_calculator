//
//  ContentView.swift
//  FirstYTProject
//
//  Created by Illya  on 9/17/21.
//


import SwiftUI

struct ContentView: View {
   @State private var  checkAmount = ""
   @State private var  numberOfPeople = 2
   @State private var tipPrecentage = 0
   
   let tipPrecentages = [0, 5, 10, 15, 20]
   
   var totalPerPerson: Double {
      let peopleCount = Double(numberOfPeople + 2)
      let tipSelection = Double(tipPrecentages[tipPrecentage])
      let orderAmount = Double(checkAmount) ?? 0
      
      let tipValue = orderAmount / 100 * tipSelection
      
      let grandTotal = orderAmount + tipValue
      
      let amountPerPerson = grandTotal / peopleCount
      
      return amountPerPerson
   }
   
   var body: some View {
      NavigationView{
         Form {
            Section {
               TextField("Amount",text: $checkAmount)
               Picker("Number of people", selection: $numberOfPeople) {
                  ForEach(2..<100) {
                     Text("\($0) people")
                  }
               }
            }
            Section(header: Text("How many tips do you want to leave?")) {
               Picker("Tip precentage", selection: $tipPrecentage) {
                  ForEach(0..<tipPrecentages.count) {
                     Text("\(self.tipPrecentages[$0])")
                  }
               }
               .pickerStyle(SegmentedPickerStyle())
            }
            Section{
               Text("\(totalPerPerson, specifier: "%.2f")")
            }
         }
         .navigationBarTitle("Tip Calculator", displayMode: .inline)
      }
   }
   
   
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
