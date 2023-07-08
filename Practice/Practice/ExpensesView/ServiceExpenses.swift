import SwiftUI


//СЕРВИС

class Expenses7: ObservableObject {
 @Published var items = [String]()
    @Published var text = ""
    
}


class Expenses8: ObservableObject {
 @Published var items = [String]()
    @Published var items2 = [String]()
    @Published var text = ""
    @Published var dateString = [String]()
  
}


let expenses = Expenses()
var ni = Expenses7()
var service = Servise()




struct Dog: Identifiable {
    var id = UUID()
    var name : String
}

struct IncomeItem:  Identifiable , Codable {
    var id = UUID()
    

    let name: String

    var type: String

    var amount :Int
  
    var date : String
  
    init(name: String, type: String, amount: Int, date: String) {        //изменение
        self.name = name
        self.type = type
        self.amount = amount
        self.date = date
    }
 
}








class Final : ObservableObject
{
    @Published var saveDate = [String]()
    @Published var saveDateMonth = [String]()
    @Published var saveDateYear = [String]()
    @Published var ijj = [Int]()
    @Published var mix = [String]()
    @Published var saveDataMonthProfit = [String]()
     @Published var saveDataYearProfit = [String]()
    
    @Published var result2 = [IncomeItem](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(result2) {
                UserDefaults.standard.set(encoded, forKey: "Items4")
                
            }
            
            ijj.removeAll()
            for i in result2 {
          
                ijj.append(i.amount)
          
            }
        }
        
    }

 
    
    @Published var result = [IncomeItem](){    // кодирование и раскодирование  JSON
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(result) {
                UserDefaults.standard.set(encoded, forKey: "Items3")

            }

        }
        
    }

    init() {
    
        if let items = UserDefaults.standard.data(forKey: "Items3"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([IncomeItem].self, from: items) {
                self.result = decoded
                if let items = UserDefaults.standard.data(forKey: "Items4"){
                    let decoder = JSONDecoder()
                    if let decoded = try? decoder.decode([IncomeItem].self, from: items) {
                        self.result2 = decoded
                        return
                    }
                }
               
                return
               
            }
           
        }
    }
}

