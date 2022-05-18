//
//  BestOffersViewModel.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import Foundation
import RxCocoa
import RxSwift

class ProductsViewModel {
    
    
   

    var numberOfBanners = 0
    var content : [Content] = []
    var contents = BehaviorSubject(value: [Content]())

 //MARK:- Get All Products
 
    func getData (completion : @escaping (Bool)->Void)  {
        BaseDataAPI.shared.getData {  [weak self](restlt) in
            switch restlt {
            case .success(let response):
                for i in response?.data.banners ?? [] {
             
                    self?.content.append(i.content)
                 
                    self?.numberOfBanners += 1
                    
                }
                self?.contents.on(.next(self?.content ?? []))
            
               
                completion(true)
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    
}
