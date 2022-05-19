//
//  ModelsManager.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation


struct APIResponse : Codable {
    let status : Status
    let data : Results
}

struct Status : Codable {
    let success : Bool
    let code : Int
}

struct Results : Codable {
    let banners : [Banner]
}




struct Banner : Codable {
    let type : String
    let content : Content
}

struct Content : Codable {
    let backgroundImage : String?
    let heading : String?
    let blocks : [Block]?
    let products : [Product]?
    let brands : [Brand]?
}

struct Block : Codable {
    let type : String?
    let id : Int
    let title : String?
    let blockImage : String?
   
}

struct Brand : Codable {
    let image : String
}


struct Product : Codable {
    let id : Int
    let title : String
    let image : String?
    let brand : String
    let variants : [Variant]

}

struct Variant : Codable {
    let id : Int
    let price : Double
    let salePrice : Double
    let saleAmount : Double
}






