//
//  NetwrokManager.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation

class NetwrokManager {
    
    static let shared = NetwrokManager()
    
    struct Constants {
       static let baseURL = "http://178.128.171.40/task/response.json"
    }
    
    func getCategories(completion : @escaping (Result<APIResponse, Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)") else {
            print("Cant get URL")
            return
        }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else  {return}
            
            do {
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(result))
              
            }catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
        task.resume()
        
        
    }
    
    
    
    
}
