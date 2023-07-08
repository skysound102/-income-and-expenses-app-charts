//
//  DateFormatterService.swift
//  Practice
//
//  Created by Артем on 02.04.2023.
//

import Foundation
import UIKit
let petyh = Expenses()

class Servise {
    func dateToString (date: Date) -> String {
        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yy.ss"
        formatter.dateFormat = "dd.MM.yy"
        let str = formatter.string(from: date)
        return str
    }
    func dateToString2 (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy.ss"
//        formatter.dateFormat = "dd.MM.yy"
        let str = formatter.string(from: date)
        return str
    }
    
    func dateToStringMounth (date: Date) -> String {
        let formatter = DateFormatter()
//        formatter.dateFormat = "MM.ss"
        formatter.dateFormat = "MM"
        let str = formatter.string(from: date)
        return str
    }
    
    func dateToStringYear (date: Date) -> String {
        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy.ss"
                formatter.dateFormat = "yyyy"
        let str = formatter.string(from: date)
        return str
    }
    
    
  
    
//    struct IncomeItem:  Identifiable , Codable {
//        var id = UUID()
//
//
//        let name: String
//
//        var type: String
//
//        var amount :Int
//
//
//        init(name: String, type: String, amount: Int) {
//            self.name = name
//            self.type = type
//            self.amount = amount
//        }
//
//    }





    
    
    
}

