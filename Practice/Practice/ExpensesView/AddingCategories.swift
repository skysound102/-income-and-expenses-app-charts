//
//  AddingCategories.swift
//  Practice
//
//  Created by Артем on 09.04.2023.
//

import Foundation
import SwiftUI


struct AddViewOO: View {                           // ВЬЮ ФОРМЫ ДОБАВЛЕНИЯ ПОДКАТЕГОРИЙ
    @Environment(\.presentationMode) var presentationMode
    let ff : AddingList
    @EnvironmentObject var res : Final
    @State var name = ""
    @State var nameExp = ""
    @EnvironmentObject var expenses7 : Expenses8
    var mu =  Expenses8()
    @State var pups = [String]()
    var les = AddView4( )
    let service = Servise()
            
            var body: some View {
                
                NavigationView {
                    Form {
                        
                        TextField("Количество", text: $name)
                        TextField("Наименование расхода", text: $nameExp)
                        
                        
                    }
                    .navigationBarTitle("Добавить")
                    .navigationBarItems( trailing: Button("Сохранить"){

                        
                        if let actualAmount2 = Int(self.name){
                            guard actualAmount2 > 0
                            else{return}
                            res.ijj.append(Int(self.name)!)
                            UserDefaults.standard.set(res.ijj, forKey: "Muh2")
                            let item = IncomeItem(name: nameExp, type: ff.type
                                                  , amount : actualAmount2, date: service.dateToString2(date: Date()))
                          
                            res.result2.append(item)
                           
                            res.saveDate.append("\(service.dateToString(date: Date())) #\(res.saveDate.count)")
                            res.saveDateMonth.append("\(service.dateToStringMounth(date: Date())) #\(res.saveDateMonth.count)")
                            
                            res.saveDateYear.append("\(service.dateToStringYear(date: Date())) #\(res.saveDateYear.count)")
                            UserDefaults.standard.set(res.saveDate, forKey: "ijj")
                            UserDefaults.standard.set(res.saveDateYear, forKey: "ijj1")
                            UserDefaults.standard.set(res.saveDateMonth, forKey: "ijj2")
//                            print(res.result)
                            print("int - \(res.ijj)")
//                            print(res.saveDate)
                            print("date\(res.saveDate)")
                            pups.append(name)
                            self.presentationMode.wrappedValue.dismiss()
                   
                        }
                    })
   
                }.environmentObject(res)
              
                
                    }
                
            }

