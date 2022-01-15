//
//  NetworkRequest.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 23.11.21.
//

import Foundation
import UIKit

class  NetworkRequest {
    static let shared = NetworkRequest()
    
    private init() {}

    func requestData(urlString: String, completion: @escaping(Result<Data, Error>) -> Void){
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error{
                    completion(.failure(error))
                    return
                    }
                guard let data = data else {return}
                completion(.success(data))
            }
           
        }.resume()
     }
}
