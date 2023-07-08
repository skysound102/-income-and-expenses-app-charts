//
//  ContentView.swift
//  Practice
//
//  Created by Артем on 03.03.2023.
//

import SwiftUI




struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
   
}

struct Mail{
    var pops = [String]()
}

class Expenses: ObservableObject {
  
  
    var items2 = [ExpenseItem].self
    @Published var mix = [Int]()
    var mix2 = [Int]()
    var lopa = [String]()
    let data = Data()
    var service = Servise()
    @Published var saveDataMonthProfit = [String]()
     @Published var saveDataYearProfit = [String]()

    
    @Published var items = [ExpenseItem]() {
      
        didSet {
            let encoder = JSONEncoder()
        
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
                mix.removeAll()
//                for i in items {
//
//                    mix.append(i.amount)
//                }

            }
            
           
                            for i in items {
            
                                mix.append(i.amount)
                                UserDefaults.standard.object(forKey: "Muh")
                            }
    
           print(lopa)
//            for i in 0..<items.count {
//
//                lopa.append("\(service.dateToString(date: Date()))*\(i)")
//                print(lopa)
//            }
   
          
        }
        
      
    
    }
    
  
   
    
    init() {
    
        if let items = UserDefaults.standard.data(forKey: "Items"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
               
               
                return
               
            }
            
        }
    }
    
    

}
    struct ContentView: View {
        
        @State var itemf = false

        @State private var sgowingAddExpense = false
        @ObservedObject var expenses = Expenses()
        @ObservedObject var res = Final()
        var body: some View {

            NavigationView {
                
                
                List {
                   
                    ForEach(expenses.items) { item in
                        HStack{
                      
                         
                            VStack(alignment:.leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text("$\(item.amount)")
                   
                          
                        }
                    }
//                    .onDelete(perform: removeItems)
                   
                    
               
                }
           
                .navigationBarTitle(" Мои Доходы  \(expenses.mix.reduce(0, +)  )")
                
                .navigationBarItems( leading: Button(action:{
                    self.sgowingAddExpense = true
                }){
                    Image(systemName: "plus")
                }, trailing: Button(action:{
//                    UserDefaults.standard.removeObject(forKey: "text")
                    itemf = true
                }){
                    Image(systemName: "cellularbars")
                })
                .sheet(isPresented: $sgowingAddExpense){
                    AddView(expenses: self.expenses, res: Final())
                }
                .sheet(isPresented: $itemf){
                    SwiftUIView(expenses3: Expenses())
                    
                }.onAppear {
                    
                    guard let mnn = UserDefaults.standard.value(forKey: "text")
                    else {return}
                    self .expenses.lopa = mnn as! [String]
                    guard let mnn7 = UserDefaults.standard.object(forKey: "List")
                    else {return}
                    self .res.saveDataMonthProfit = mnn7 as! [String]
                    guard let mnn8 = UserDefaults.standard.object(forKey: "List1")
                    else {return}
                    self .res.saveDataYearProfit = mnn8 as! [String]
                }
            }  
           

        }
//        func removeItems(_ offsets :IndexSet) {
//
//            expenses.items.remove(atOffsets: offsets)
//            expenses.lopa.remove(atOffsets: offsets)
//
//            expenses.mix.remove(atOffsets: offsets)
//
//        }
        }
        
    

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView( )
        }
    }

