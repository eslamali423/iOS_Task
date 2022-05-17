//
//  CategoryAPI.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation
class BaseDataAPI  : BaseAPI <BaseDataNetwroking> {
    
    static let shared  =  BaseDataAPI()
    
    func getData(completion: @escaping (Result<APIResponse?, NSError>)->Void) {
        self.fetchData(target: .getData, responseClass: APIResponse.self) { (result) in
            completion(result)
        }
    }
    
    
}
