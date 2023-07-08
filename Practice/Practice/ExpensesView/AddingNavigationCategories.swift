//
//  AddingNavigationCategories.swift
//  Practice
//
//  Created by Артем on 09.04.2023.
//

import Foundation
import SwiftUI

struct AddView4: View {                                     //ВЬЮ ФОРМЫ ДОБАВЛЕНИЯ КАТЕГОРИЙ НАВИГАЦИИ
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    @EnvironmentObject var expenses7 : Expenses7
    @EnvironmentObject var res : Final

    var body: some View {
        
        NavigationView {
            Form {
                TextField("Введите категорию расхода", text: $name)
            }
            .navigationBarTitle("Добавить")
            .navigationBarItems( trailing: Button("Сохранить"){

                
                (print("podkat"))
                
                self.presentationMode.wrappedValue.dismiss()
                
                let item = IncomeItem(name: String(), type: name, amount: 0, date: "")

                res.result.append(item)
                res.mix.append(name)
                
              

                
                
            }
            )
            
        }
        .environmentObject(res)
        
        
    }
    
}

