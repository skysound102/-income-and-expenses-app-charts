//
//  GeneralChart.swift
//  Practice
//
//  Created by Артем on 02.04.2023.
//

import Foundation

import SwiftUI
import Charts

struct SwiftUIView3: View {
    
    @State var click = true
    @State var clickMonth = false
    @State var clickYear = false
    @State var clickProfit = true
    @State var clickMonthProfit = false
    @State var clickYearProfit = false
    @ObservedObject var res = Final()
    @ObservedObject var expenses2: Expenses
    let petyh = Expenses2()
    let petyh2 = Expenses()
 let muh = Final()
 
    
    var body: some View {
        
        

        NavigationView{
            List{
                HStack{
                    Text("График Расходов")
                        .fontWeight(.semibold)
                    Button("Недели"){
                        click = true
                        clickYear = false
                        clickMonth = false
                    }
                    //                            .pickerStyle(.segmented)
                }
                HStack{
                    Text("График Расходов")
                        .fontWeight(.semibold)
                    Button("Месяца"){
                        click = false
                        clickYear = false
                        clickMonth = true
                    }
                    //                            .pickerStyle(.segmented)
                }

                HStack{
                    Text("График Расходов")
                        .fontWeight(.semibold)
                    Button("Года"){
                        click = false
                        clickMonth = false
                        clickYear = true

                    }
                    //                            .pickerStyle(.segmented)
                }


           


                Chart {

                    if click {

                        ForEach(res.saveDate.indices, id: \.self){
                            index in

                            LineMark(x: .value("day1",res.saveDate[index]), y: .value("value1", res.ijj[index]))

                                .foregroundStyle(.red)
                                .interpolationMethod(.catmullRom)
                                .symbol(Circle())

                        }

                    }



                    if clickMonth {



                        ForEach(res.ijj.indices, id: \.self){
                            index in

                            LineMark(x: .value("day1",res.saveDateMonth[index]), y: .value("value1", res.ijj[index]))

                                .foregroundStyle(.red)
                                .interpolationMethod(.catmullRom)
                                .symbol(Circle())

                        }
                    }
                    //
                    //
                    //
                    //                }
                    if clickYear {




                        ForEach(0..<res.saveDateYear.count , id: \.self ){ i in


                            LineMark(x: .value("day1",res.saveDateYear[i]), y: .value("value1", res.ijj[i]))

                                .foregroundStyle(.red)
                                .interpolationMethod(.catmullRom)
                                .symbol(Circle())

                        }
                    }
                    //                   }
                }
                HStack{
                    Text("График Доходов")
                        .fontWeight(.semibold)
                    Button("Недели"){
                        clickProfit = true
                        clickYearProfit = false
                        clickMonthProfit = false
                    }
                    //                            .pickerStyle(.segmented)
                }
                HStack{
                    Text("График Доходов")
                        .fontWeight(.semibold)
                    Button("Месяца"){
                        
                        
                        
                        
                        clickYearProfit = false
                        clickMonthProfit = true
                        clickProfit = false
                    }
                    //                            .pickerStyle(.segmented)
                }
                
                HStack{
                    Text("График Доходов")
                        .fontWeight(.semibold)
                    Button("Года"){
                        
                        clickYearProfit = true
                        clickMonthProfit = false
                        clickProfit = false
                    }
                    //                            .pickerStyle(.segmented)
                }
                
                
                Chart {
                    
                    if clickProfit{
                        ForEach(expenses2.mix.indices, id: \.self){
                            index in
                            
                            LineMark(x: .value("day1",expenses2.lopa[index]), y: .value("value1", expenses2.mix[index]))
                            
                                .foregroundStyle(.green)
                                .interpolationMethod(.catmullRom)
                                .symbol(Circle())
                            
                            
                        }
                    }
                    if clickYearProfit{
                        ForEach(expenses2.mix.indices, id: \.self){
                            index in
                            
                            LineMark(x: .value("day1",res.saveDataYearProfit[index]), y: .value("value1", expenses2.mix[index]))
                            
                                .foregroundStyle(.green)
                                .interpolationMethod(.catmullRom)
                                .symbol(Circle())
                            
                            
                        }
                    }
                    if clickMonthProfit{
                        ForEach(expenses2.mix.indices, id: \.self){
                            index in
                            
                            LineMark(x: .value("day1",res.saveDataMonthProfit[index]), y: .value("value1", expenses2.mix[index]))
                            
                                .foregroundStyle(.green)
                                .interpolationMethod(.catmullRom)
                                .symbol(Circle())
                            
                            
                        }
                    }
                    
                }
                
                
                
                
                
                
                
                HStack{
                    HStack{
                        Text("---")
                            .foregroundColor(.green)
                        Text("Доход")
                    }
                    HStack{
                        Text("---")
                            .foregroundColor(.red)
                        Text(" Расход")
                    }
                }
                
                
            }.onAppear {
                print(res.saveDate)
                print("year\(res.saveDateYear)")
                print("mouse\(res.saveDataMonthProfit)")
                print("muh\(res.saveDateMonth)")
                //                clickMonth = false
                //                clickMonth = true
                //                clickMonth = false
                UserDefaults.standard.object(forKey: "Items")
                UserDefaults.standard.object(forKey: "Items3")
                UserDefaults.standard.object(forKey: "Items4")
                guard let mnn7 = UserDefaults.standard.object(forKey: "ijj2")
                else {return}
                self .res.saveDateMonth = mnn7 as! [String]
                guard let mnn5 = UserDefaults.standard.object(forKey: "Muh2")
                else {return}
                self .res.ijj = mnn5 as! [Int]
                    let mnn3 = UserDefaults.standard.object(forKey: "ijj")
                                 self .res.saveDate = mnn3 as! [String]

 
                guard let mnn8 = UserDefaults.standard.object(forKey: "ijj1")
                else {return}

                self .res.saveDateYear = mnn8 as! [String]
                


//                                guard let mnn = UserDefaults.standard.value(forKey: "text")
//                                else {return}
//                                self .expenses2.lopa = mnn as! [String]
//                                guard let mnn2 = UserDefaults.standard.object(forKey: "Muh")
//                                else {return}
//                                self .expenses2.mix = mnn2 as! [Int]
//                                guard let mnn3 = UserDefaults.standard.object(forKey: "ijj")
//                                else {return}
//                                self .res.saveDate = mnn3 as! [String]
//                                guard let mnn4 = UserDefaults.standard.object(forKey: "ijj2")
//                                else {return}
//                                self .res.saveDateMonth = mnn4 as! [String]
//
//
//                                guard let mnn6 = UserDefaults.standard.object(forKey: "ijj1")
//                                else {return}
//                                self .res.saveDateYear = mnn6 as! [String]
//

            }
            .onAppear{
                guard let mnn7 = UserDefaults.standard.object(forKey: "List")
                else {return}
                self .res.saveDataMonthProfit = mnn7 as! [String]
   
                guard let mnn2 = UserDefaults.standard.object(forKey: "Muh")
                                                else {return}
                                                self .expenses2.mix = mnn2 as! [Int]
                
                guard let mnn = UserDefaults.standard.value(forKey: "text")
                                             else {return}
                                             self .expenses2.lopa = mnn as! [String]
                guard let mnn8 = UserDefaults.standard.object(forKey: "List1")
                else {return}
                self .res.saveDataYearProfit = mnn8 as! [String]

            }

        }
    }
        
}

    
    



