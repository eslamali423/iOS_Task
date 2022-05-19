////
////  CategoryViewModel.swift
////  Task
////
////  Created by Eslam Ali  on 16/05/2022.
////
//
//import Foundation
//class CategoryViewModel {
//    
//    
//    var catgory : [Block] = []
//    var imageUrl = ""
//
// //MARK:- Get All Categories
//    func getCat(completion : @escaping (Bool)->Void){
//        BaseDataAPI.shared.getData { (result) in
//            switch result {
//            case .success(let response):
//                self.imageUrl = response?.data.banners[0].content.backgroundImage ?? ""
//                for category in response?.data.banners[0].content.blocks ?? [] {
//                    self.catgory.append(category)
//                }
//                completion(true)
//              
//            case .failure(let error):
//                print(error.localizedDescription)
//                completion(false)
//            }
//        }
//    }
//    
//    
//}
//
