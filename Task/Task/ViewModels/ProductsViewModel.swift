//
//  BestOffersViewModel.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation
class ProductsViewModel {
    
    
   
//    var products = [[Any]]()
    var numberOfBanners = 0
    var sectionBanner : [String] = []
    var content : [Content] = []
    

 //MARK:- Get All Products
 
    func getData (completion : @escaping (Bool)->Void)  {
        BaseDataAPI.shared.getData {  [weak self](restlt) in
            switch restlt {
            case .success(let response):
                for i in response?.data.banners ?? [] {
        
                    self?.content.append(i.content)
                    
                    
//
//                    for j in i.content.products ?? [] {
//                        self?.products.append([i,j])
//                    }
                    self?.numberOfBanners += 1
                }
            
              //  print(self?.products[0][1])
              //  print("SEEDCCTIOOONSSS")
            //    print(self?.sectionBanner.count)
                completion(true)
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    
}
