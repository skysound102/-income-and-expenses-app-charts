//
//  ChartCategories.swift
//  Practice
//
//  Created by Артем on 11.04.2023.
//


import SwiftUI
import Charts

struct ChartsCategories: View {
    
   
    var type: String
    var mio = AddView( expenses: Expenses(), res: Final())
    @ObservedObject var expenses3: Expenses
    let petyh = Expenses()
    let weekdays = Calendar.current.shortWeekdaySymbols
    @ObservedObject var res: Final
    @ObservedObject var expenses2: Expenses

 
    
    
 
   
       


    
    var body: some View {
      
//        let userDefaultsGet = UserDefaults.standard
//        let newText = userDefaultsGet.object(forKey: "text") as! [String]
        
        Chart {
            ForEach(res.result2){ i in
    
                if type == i.type{
                    
                    LineMark(x: .value("day", i.date), y: .value("value", i.amount) )
                        .foregroundStyle(.yellow)
                        .interpolationMethod(.catmullRom)
                        .symbol(Circle())
                }
                             
          
            }
                             
   
        }.onAppear {
            
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
           
            guard let mnn5 = UserDefaults.standard.object(forKey: "Muh2")
            else {return}
            self .res.ijj = mnn5 as! [Int]
            print(res.saveDate)
       
        }

        
      
   
        
        .frame(width: 300, height: 500 , alignment: .center)
    
    }
    
}
