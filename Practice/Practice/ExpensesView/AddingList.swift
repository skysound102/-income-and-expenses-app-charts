//
//  AddingList.swift
//  Practice
//
//  Created by Артем on 09.04.2023.
//

import Foundation
import UIKit
import SwiftUI
struct AddingList : View {                          // ВЬЮ-СПИСОК ПОДКАТЕГОРИЙ
    let type : String
    @ObservedObject var res = Final()
    @ObservedObject var expenses2 = Expenses()
    @ObservedObject var expenses10 = Expenses8()
    @State var itemf = false
    @State var item2 = false
    //лист подкатегории
    var body: some View{
  
        return  NavigationView{    //LIST
            
            List{
               
                ForEach(res.result2) { first in
                    
                    
                    
                    if type == first.type{

                        ZStack{
                            Text("\(first.amount)")
                                .padding(.trailing , 200)
                            Text(first.name)
                                .padding(.leading , 50)

                            Text(first.date)
                                .padding(.leading , 240)
                            
                        }
                    }
                }

                        
                }.navigationTitle("Подкатегории")
                .onAppear{
                    guard let mnn5 = UserDefaults.standard.object(forKey: "Muh2")
                                       else {return}
                                       self .res.ijj = mnn5 as! [Int]
                    guard let mnn = UserDefaults.standard.value(forKey: "ijj")
                    else {return}
                    self .res.saveDate = mnn as! [String]
                    guard let mnn6 = UserDefaults.standard.value(forKey: "ijj1")
                    else {return}
                    self .res.saveDateYear = mnn6 as! [String]
                    guard let mnn2 = UserDefaults.standard.value(forKey: "ijj2")
                    else {return}
                    self .res.saveDateMonth = mnn2 as! [String]
                    guard let mnn7 = UserDefaults.standard.object(forKey: "List")
                    else {return}
                    self .res.saveDataMonthProfit = mnn7 as! [String]
                    guard let mnn8 = UserDefaults.standard.object(forKey: "List1")
                    else {return}
                    self .res.saveDataYearProfit = mnn8 as! [String]
                    guard let mnn = UserDefaults.standard.value(forKey: "text")
                    else {return}
                    self .expenses2.lopa = mnn as! [String]
                    guard let mnn2 = UserDefaults.standard.object(forKey: "Muh")
                    else {return}
                    self .expenses2.mix = mnn2 as! [Int]
                    guard let mnn3 = UserDefaults.standard.object(forKey: "ijj")
                    else {return}
                    self .res.saveDate = mnn3 as! [String]
                    guard let mnn4 = UserDefaults.standard.object(forKey: "ijj2")
                    else {return}
                    self .res.saveDateMonth = mnn4 as! [String]
                    
//                    guard let mnn5 = UserDefaults.standard.object(forKey: "Muh2")
//                    else {return}
//                    self .res.ijj = mnn5 as! [Int]
                    guard let mnn6 = UserDefaults.standard.object(forKey: "ijj1")
                    else {return}
                    self .res.saveDateYear = mnn6 as! [String]
                }
            

                    .navigationBarItems(leading: Button(action:{
                        itemf = true
                    }){
                        Image(systemName: "plus")
                    }, trailing:  Button(action:{
                    
                      item2 = true
                    }){
                        Image(systemName: "cellularbars")
                    })
                    .sheet(isPresented: $itemf){
                        AddViewOO(
                            ff: AddingList(type: type))
                    }
                    .sheet(isPresented: $item2){
                        ChartsCategories(type: type, expenses3: Expenses(), res: Final(), expenses2: Expenses())
                    }
            
           
           
        }.environmentObject(res)
           
    }
}
