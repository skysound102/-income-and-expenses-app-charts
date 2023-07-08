//
//  GeneralView.swift
//  Practice
//
//  Created by Артем on 09.04.2023.
//

import Foundation
import SwiftUI

struct ContentView6 : View {       // ВЬЮ КАТЕГОРИЙ РАСХОДОВ
 
    var items = [String]()
    @ObservedObject var expenses7 = Expenses7()
    @ObservedObject var expenses10 = Expenses8()
    @State var itemf = false
    @ObservedObject var res = Final()
    @EnvironmentObject var res2 : Final
    
    
    @State private var sgowingAddExpense = false
    var body: some View {
 
        
        return NavigationView {
            List{
                ForEach(res.result, id: \.id) { first in
              
                    NavigationLink(destination: AddingList(type: first.type)){
                      
                        Text(first.type)
                        
                    }
                }
                
                
            }.navigationTitle("Категории Расходов")
                .navigationBarItems( leading: Button(action:{
                    self.sgowingAddExpense = true
                }){
                    Image(systemName: "plus")
                }
                    
)
                .sheet(isPresented: $sgowingAddExpense){
                    AddView4()
                }
                .sheet(isPresented: $itemf){
                    SwiftUIView(expenses3: Expenses())
                }
        }.environmentObject(res)
        
        
    }
}
    
