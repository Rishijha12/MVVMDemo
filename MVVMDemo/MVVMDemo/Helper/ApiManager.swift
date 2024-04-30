//
//  ApiManager.swift
//  MVVMDemo
//
//  Created by Rishi Jha on 01/05/24.
//

import UIKit
enum DataError:Error {
    case invalidResponse
    case invalidUrl
    case invalidData
    case network(_ error: Error?)
}
final class ApiManager{
    static let Shared = ApiManager()
    private init(){}
    typealias Handler = (Result<[Product],DataError>) -> Void
    func fetchProducts(completion: @escaping Handler){
        guard let url = URL(string: Constant.Api.productUrl) else{return}
        
        URLSession.shared.dataTask(with: url) { data, respnse, error in
            guard let data,error == nil else{
                completion(.failure(.invalidData))
                return
            }
            
            guard let respnse = respnse as? HTTPURLResponse, 200 ... 299 ~= respnse.statusCode else{
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            }catch{
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
}
