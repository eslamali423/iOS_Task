//
//  CategoryAPI.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation
class CategoryAPI  : BaseAPI <CategoryNetwroking> {
    
    static let shared  =  CategoryAPI()
    
    func getCategories(completion: @escaping (Result<APIResponse?, NSError>)->Void) {
        self.fetchData(target: .getCategories, responseClass: APIResponse.self) { (result) in
            completion(result)
        }
    }
    
    
}
