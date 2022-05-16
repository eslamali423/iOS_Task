//
//  ModelsManager.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation


struct APIResponse : Codable {
    let status : Status
    let data : [DataContent]
}

struct Status : Codable {
    let success : Bool
    let code : Int
}

struct DataContent : Codable {
    let banners : [Banner]
}




struct Banner : Codable {
    let type : String
    let content : Content
}

struct Content : Codable {
    let backgroundImage : String?
    let heading : String
    let blocks : [Block]?
    let products : [Product]?
}

struct Block : Codable {
    let type : String
    let id : Int
    let title : String
    let blockImage : String
}


struct Product : Codable {
    let id : Int
    let title : String
    let image : String
    let brand : String
    let rating : Int
    let variants : [Variant]

}

struct Variant : Codable {
    let id : Int
    let price : Int
    let salePrice : Int
    let saleAmount : Double
}



/*
 
 "id":109599,
                      "title":"Ø¨Ø§Ù‚Ø© Ø§Ù„ØµØ§Ø±ÙˆØ® 2 Ù„Ù„Ø³Ø¹Ø§Ø¯Ø© Ø§Ù„Ø­Ù‚ÙŠÙ‚ÙŠØ©",
                      "image":"https://s3.ap-southeast-1.amazonaws.com/elmarasi/proimgs/Rocket-Set-2.jpg",
                      "brand":"Marasi",
                      "rating":0,
                      "variants
 
 */



