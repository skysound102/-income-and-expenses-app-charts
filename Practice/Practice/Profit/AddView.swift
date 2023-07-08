//
//  AddView.swift
//  Practice
//
//  Created by Артем on 03.03.2023.
//

import SwiftUI
import Charts
struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    var r = SwiftUIView3( res: Final(), expenses2: Expenses())
    @StateObject var expenses: Expenses
    @StateObject var res = Final()
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
                
       
                if let actualAmount = Int(self.amount) {
                    guard actualAmount > 0
                    else{return}
                    expenses.mix.append(Int(self.amount)!)
                    UserDefaults.standard.set(expenses.mix, forKey: "Muh")
                    
                    expenses.lopa.append("\(servise.dateToString(date: Date())) #\(expenses.lopa.count)")
                    print(expenses.lopa)
                    let userDefaults = UserDefaults.standard
                    userDefaults.set( expenses.lopa, forKey: "text")
                    
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    
                    self.expenses.items.append(item)
                    
                    res.saveDataMonthProfit.append("\(servise.dateToStringMounth(date: Date())) #\(res.saveDataMonthProfit.count)")
                    res.saveDataYearProfit.append("\(servise.dateToStringYear(date: Date())) #\(res.saveDataYearProfit.count)")
                    UserDefaults.standard.set(res.saveDataMonthProfit, forKey: "List")
                    UserDefaults.standard.set(res.saveDataYearProfit, forKey: "List1")
                    print("\(res.saveDataMonthProfit)lfns")
                    self.presentationMode.wrappedValue.dismiss()
                 
                   
                }
            })
            .onAppear{
                guard let mnn7 = UserDefaults.standard.object(forKey: "List")
                else {return}
                self .res.saveDataMonthProfit = mnn7 as! [String]
                guard let mnn8 = UserDefaults.standard.object(forKey: "List1")
                else {return}
                self .res.saveDataYearProfit = mnn8 as! [String]
                
                
                
                
            }
        }.environmentObject(res)
     
       
       
    }
        
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses(), res: Final())
    }
}
