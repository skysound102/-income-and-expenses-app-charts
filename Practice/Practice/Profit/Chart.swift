//
//  SwiftUIView.swift
//  Practice
//
//  Created by Артем on 31.03.2023.
//

import SwiftUI
import Charts

struct SwiftUIView: View {
    
   
    
    var mio = AddView( expenses: Expenses(), res: Final())
    @ObservedObject var expenses3: Expenses
    let petyh = Expenses()
    let weekdays = Calendar.current.shortWeekdaySymbols
    

 
    
    
 
   
       


    
    var body: some View {
      
      
       
        Chart {
            
            if petyh.mix != [] {
                let userDefaultsGet = UserDefaults.standard
                let newText = userDefaultsGet.object(forKey: "text") as! [String]
                ForEach(petyh.mix.indices, id: \.self){
                    index in
                    
                    
                    
                    //                if petyh.mix.count > 7 {
                    //
                    //                    LineMark(x: .value("day", petyh.lopa[index]), y: .value("value", expenses3.mix[index]) )
                    //                            .foregroundStyle(.yellow)
                    //                            .interpolationMethod(.catmullRom)
                    //                                           .symbol(Circle())
                    //
                    //                } else {
                    
                    
                    LineMark(x: .value("day", newText[index]), y: .value("value", expenses3.mix[index]) )
                        .foregroundStyle(.yellow)
                        .interpolationMethod(.catmullRom)
                        .symbol(Circle())
                    //
                    //                }
                    
                }
            } else {
                ForEach([0].indices, id: \.self){
                    index in
                    
                    
                    
                    //                if petyh.mix.count > 7 {
                    //
                    //                    LineMark(x: .value("day", petyh.lopa[index]), y: .value("value", expenses3.mix[index]) )
                    //                            .foregroundStyle(.yellow)
                    //                            .interpolationMethod(.catmullRom)
                    //                                           .symbol(Circle())
                    //
                    //                } else {
                    
                    
                    LineMark(x: .value("day",[0][index]), y: .value("value", [0][index]) )
                        .foregroundStyle(.yellow)
                        .interpolationMethod(.catmullRom)
                        .symbol(Circle())
                    //
                    //                }
                    
                }
                
            }
        }
      
   
        
        .frame(width: 300, height: 500 , alignment: .center)
    
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(expenses3: Expenses())
    
    }
}
