//
//  Balance2.swift
//  Practice
//
//  Created by Артем on 02.04.2023.
//

import Foundation



//
//  ContentView.swift
//  Practice
//
//  Created by Артем on 03.03.2023.
//

import SwiftUI




struct ExpenseItem2: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
   
}

struct Mail2{
    var pops = [String]()
}

class Expenses2: ObservableObject {
  
  
    var items2 = [ExpenseItem2].self
    var mix = [Int]()
    var mix2 = [Int]()
    var lopa2 = [String]()
    let data = Data()
    var service = Servise()


    
    @Published var items = [ExpenseItem2]() {
      
        didSet {
            let encoder = JSONEncoder()
        
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items2")
//                mix.removeAll()
//                for i in items {
//
//                    mix.append(i.amount)
//                }

            }

            mix.removeAll()
                            for i in items {
            
                                mix.append(i.amount)
                      
                            }
        
            print(lopa2)
//            for i in 0..<items.count {
//
//                lopa.append("\(service.dateToString(date: Date()))*\(i)")
//                print(lopa)
//            }
   
          
        }
        
      
    
    }
    
  
   
    
    init() {
    
        if let items = UserDefaults.standard.data(forKey: "Items2"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem2].self, from: items) {
                self.items = decoded
               
               
                return
               
            }
            
        }
    }
    
    

}
    struct ContentView2: View {
        
        @State var itemf = false
        
        @State private var mix = UserDefaults.standard.object(forKey: "Tap")
        
        @State private var sgowingAddExpense = false
        @ObservedObject var expenses = Expenses2()
        @ObservedObject var expenses7 = Expenses()
        var body: some View {
            
            
            
//            if itemf {
//
//                VStack{
//
//                    SwiftUIView(expenses3: Expenses())
//
//                    Button(action:{
//
//                            itemf = false
//
//                    })
//                    {
//                        Text("Back")
//                            .foregroundColor(.white)
//                            .bold()
//                    }
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(15)
//                }
//            }
            

            
            
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
                    .onDelete(perform: removeItems)
                   
                    
               
                }
           
                .navigationBarTitle(" Мои Расходы \(expenses.mix.reduce(0, +)  )")
                
                .navigationBarItems( leading: Button(action:{
                    self.sgowingAddExpense = true
                }){
                    Image(systemName: "plus")
                }, trailing: Button(action:{
                   
                    itemf = true
                }){
                    Image(systemName: "cellularbars")
                })
                .sheet(isPresented: $sgowingAddExpense){
                    AddView2(expenses: self.expenses)
                }
                .sheet(isPresented: $itemf){
                    SwiftUIView2(expenses3: Expenses2())
                }
            }
            .onAppear {
         
                guard let mnn = UserDefaults.standard.value(forKey: "text")
                else {return}
                self .expenses.lopa2 = mnn as! [String]
             
            }

        }
        func removeItems(_ offsets :IndexSet) {
            expenses.lopa2.remove(atOffsets: offsets)
            expenses.items.remove(atOffsets: offsets)
            
        
        }
        }
        
    

    
    struct ContentView_Previews2: PreviewProvider {
        static var previews: some View {
            ContentView2()
        }
    }

