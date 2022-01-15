//
//  UserDefaultsManager.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 26.11.21.
//

import Foundation

class DataBase{
    static let shared = DataBase()
    let defaults = UserDefaults.standard

    var schedules:[ScheduleModel]? {
        get {
            if let data = defaults.value(forKey: "data") as? Data{
                return try! PropertyListDecoder().decode([ScheduleModel].self, from: data)
            } else {
                return [ScheduleModel]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data,forKey: "data")
            }
        }
    }
    func saveSchedule(result: ScheduleModel?){
        
        schedules?.insert(result!, at: 0)
    }
}

