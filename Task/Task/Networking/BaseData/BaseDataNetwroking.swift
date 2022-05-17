//
//  CategoryNetwroking.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation
import Alamofire

enum BaseDataNetwroking {
    case getData
}

extension BaseDataNetwroking : TargetType {
    var baseUrl: String {
        switch self {
        default :
                return "http://178.128.171.40/task/response.json"

        }
    }
    
    var path: String {
        switch self {
        case .getData:
            return ""
       

        }
    }
    
    var method: HTTPMethod {
        switch self  {
        case .getData :
            return .get
            
     
        }
    }
    
    var task: Task {
        switch self {
        case .getData:
            return .requestPlain
       
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}


