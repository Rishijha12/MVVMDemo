//
//  ProductViewModel.swift
//  MVVMDemo
//
//  Created by Rishi Jha on 01/05/24.
//

import Foundation
final class ProductViewModel{
    var products: [Product] = []
    var eventHandler: ((_ event: Events)->Void)?
    func productFetch(){
        self.eventHandler?(.loading)
        ApiManager.Shared.fetchProducts { rsponse in
            self.eventHandler?(.stopLoding)
            switch rsponse{
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLodaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
}
extension ProductViewModel{
    enum Events{
        case loading
        case stopLoding
        case dataLodaded
        case error(Error?)
    }
}
