//
//  Chart2.swift
//  Practice
//
//  Created by Артем on 02.04.2023.
//

import Foundation
import SwiftUI
import Charts
struct SwiftUIView2: View {
    
   
    
    var mio = AddView2( expenses: Expenses2())
    @ObservedObject var expenses3: Expenses2
    let petyh = Expenses2()
    let weekdays = Calendar.current.shortWeekdaySymbols
    

 
    
    
 
   
       


    
    var body: some View {
      
        let userDefaultsGet = UserDefaults.standard
        let newText = userDefaultsGet.object(forKey: "text") as! [String]
      
        Chart {
            ForEach(petyh.mix.indices, id: \.self){
                index in
                
                
                
                if petyh.mix.count > 7 {
                  
                    LineMark(x: .value("day", petyh.lopa2[index]), y: .value("value", expenses3.mix[index]) )
                            .foregroundStyle(.yellow)
                            .interpolationMethod(.catmullRom)
                                           .symbol(Circle())
                    
                } else {
                   
                   
                    LineMark(x: .value("day", newText[index]), y: .value("value", expenses3.mix[index]) )
                            .foregroundStyle(.yellow)
                            .interpolationMethod(.catmullRom)
                            .symbol(Circle())
                    
                }
          
            }
   
        }
       
        
      
   
        
        .frame(width: 300, height: 500 , alignment: .center)
    
    }
    
}

struct SwiftUIView_Previews2: PreviewProvider {
    static var previews: some View {
        SwiftUIView2(expenses3: Expenses2())
    
    }
}
