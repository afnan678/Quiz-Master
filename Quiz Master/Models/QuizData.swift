//
//  QuizData.swift
//  Quiz Master
//
//  Created by Afnan Ahmed on 24/12/2023.
//

import Foundation


struct QuizData {
    var name: String
    var iosCode: String
    var currency: String
    var prefix: String
    var contient: String
    var capital: String
    var language: String
    var flag: String
    
    init(name: String, iosCode: String, currency: String, prefix: String, contient: String, capital: String, language: String, flag: String) {
        self.name = name
        self.iosCode = iosCode
        self.currency = currency
        self.prefix = prefix
        self.contient = contient
        self.capital = capital
        self.language = language
        self.flag = flag
    }
    
}

var  data: [QuizData] = [
    
    QuizData(name: "Pakistan", iosCode: "PK", currency: "PKR", prefix: "+92", contient: "Asia", capital: "Islamabad", language: "Urdu", flag: "Pakistan"),
    QuizData(name: "India", iosCode: "IN", currency: "INR", prefix: "+91", contient: "Asia", capital: "New Delhi", language: "Hindi", flag: "India"),
    QuizData(name: "Kenya", iosCode: "KE", currency: "KES", prefix: "+254", contient: "Africa", capital: "Nairobi", language: "Swahili", flag: "Kenya"),
    QuizData(name: "South Africa", iosCode: "ZAF", currency: "ZAR", prefix: "+27", contient: "Africa", capital: "Cape Town", language: "Afrikaan", flag: "South Africa"),
    QuizData(name: "Greece", iosCode: "GRC", currency: "Euro", prefix: "+30", contient: "Europe", capital: "Athens", language: "Greek", flag: "Greece"),
    QuizData(name: "Monaco", iosCode: "MCO", currency: "Euro", prefix: "+377", contient: "Europe", capital: "No", language: "French", flag: "Monaco"),
    QuizData(name: "Australia", iosCode: "AUS", currency: "AUD", prefix: "+61", contient: "Australia", capital: "Canberra", language: "English", flag: "Australia"),
    QuizData(name: "Brazil", iosCode: "BR", currency: "BRL", prefix: "+55", contient: "South America", capital: "Brasília", language: "Portuguese", flag: "Brazil"),
    QuizData(name: "Chile", iosCode: "CHL", currency: "CLP", prefix: "+56", contient: "South America", capital: "Santiago", language: "Spanish", flag: "Chile"),
]

