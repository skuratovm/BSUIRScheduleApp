////
////  UserDefaultsManager.swift
////  bsuir Json parse
////
////  Created by Mikhail Skuratov on 26.11.21.
////
//
//import Foundation
//
//class DataBase{
//    static let shared = DataBase()
//    enum settingsKeys: String{
//        case card
//    }
//    let cardKey = settingsKeys.card.rawValue
//
//    let defaults = UserDefaults.standard
//
//    var cards:[UserCardData] {
//        get {
//            if let data = defaults.value(forKey: cardKey) as? Data{
//                return try! PropertyListDecoder().decode([UserCardData].self, from: data)
//            } else {
//                return [UserCardData]()
//            }
//        }
//        set {
//            if let data = try? PropertyListEncoder().encode(newValue){
//                defaults.set(data,forKey: cardKey)
//            }
//        }
//    }
//    func saveCard(userName: String,cardNumber: String, cardExperationDate: String){
//       let card = UserCardData(userName: userName, cardNumber: cardNumber, cardExperationDate: cardExperationDate)
//        cards.insert(card, at: 0)
//    }
//}
//
