//
//  AddView2.swift
//  Practice
//
//  Created by Артем on 02.04.2023.
//

import Foundation

import SwiftUI

struct AddView2: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses2
   
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
var petuh =  Expenses()
@State var prr = Mail()
var servise = Servise()
  
   

    let types = ["Buissines", "Personal"]
    
    var button = [String]()
    var body: some View {
     
        NavigationView {
            Form {
                
                TextField("Источник дохода", text: $name)
                Picker("Тип", selection: $type){
                    ForEach(self.types, id:  \.self){
                    Text($0)
                }
                }
                TextField("Количество", text:  $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Добавить")
            .navigationBarItems( trailing: Button("Сохранить"){
          
                prr.pops.append(servise.dateToString(date: Date()))
                expenses.lopa2.append(servise.dateToString(date: Date()))
                
                                let userDefaults = UserDefaults.standard
                userDefaults.set( expenses.lopa2, forKey: "text")
//                expenses.lopa.append(servise.dateToString(date: Date()))
                print(expenses.lopa2)
//                let userDefaults = UserDefaults.standard
//                userDefaults.set(expenses.lopa, forKey: "text")
//
   
                if let actualAmount = Int(self.amount){
                    expenses.mix.append(Int(self.amount)!)
                    UserDefaults.standard.set(expenses.mix, forKey: "Muh")
                   

                    let item = ExpenseItem2(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                
                   
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
            })
        }
        
       
    }
        
}


struct AddView_Previews2: PreviewProvider {
    static var previews: some View {
        AddView2(expenses: Expenses2())
    }
}
