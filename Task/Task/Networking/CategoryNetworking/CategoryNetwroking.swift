//
//  CategoryNetwroking.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation
import Alamofire

enum CategoryNetwroking {
    case getCategories
}

extension CategoryNetwroking : TargetType {
    var baseUrl: String {
        switch self {
        default :
                return "http://178.128.171.40/task/response.json"

        }
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return ""
       

        }
    }
    
    var method: HTTPMethod {
        switch self  {
        case .getCategories :
            return .get
            
     
        }
    }
    
    var task: Task {
        switch self {
        case .getCategories:
            return .requestPlain
       
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}


