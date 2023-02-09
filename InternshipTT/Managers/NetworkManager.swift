//
//  NetworkManager.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 02.02.2023.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func getData(urlString: String, completion: @escaping (Response?, Error?) -> ()) {

        AF.request(urlString).responseDecodable(of: Response.self, completionHandler: { response in
            switch response.result {
            case .success(let data):
                completion(data, response.error)
            case .failure(let error):
                print(error)
            }
        })
    }

    func getImage(urlString: String, completion: @escaping (Data?, Error?) -> ()) {
        
        AF.request(urlString).response { response in
            switch response.result {
            case .success(let data):
                completion(data, response.error)
            case .failure(let error):
                print(error)
            }
        }
    }
}
