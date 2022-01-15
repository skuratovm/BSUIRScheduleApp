//
//  NetworkDataFetch.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 23.11.21.
//

import Foundation
import UIKit

class NetworkDataFetch{
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func FetchSchedule(urlString: String, responce: @escaping(ScheduleModel?,Error?) -> Void){
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result{
            case .success(let data):
               let image = UIImage(data: data)
                do{
                    let schedule = try JSONDecoder().decode(ScheduleModel.self, from: data)
                    responce(schedule,nil)
                }catch let jsonError{
                    print("Failed to decode json",jsonError)
                }
            case .failure(let error):
                print("Error recieved requesting data: \(error.localizedDescription)")
                responce(nil,error)
            }
        }
    }
}
