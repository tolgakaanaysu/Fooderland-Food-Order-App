//
//  NetworkService.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 10.01.2023.
//

import Foundation
import Alamofire

protocol AlamofireClientProtocol {
    func request<ResponseModel: Decodable>(responseType: ResponseModel.Type, url: URL, method: HTTPMethod, parameters: Parameters? ,completion: @escaping(Result<ResponseModel,Error>) -> Void)
    func request(url: URL, method: HTTPMethod, parameters: Parameters? ,completion: @escaping(Result<String,Error>) -> Void)

}

extension AlamofireClientProtocol {
    // Decode JSON
    func request<ResponseModel: Decodable>(responseType: ResponseModel.Type, url: URL, method: Alamofire.HTTPMethod, parameters: Alamofire.Parameters?, completion: @escaping (Result<ResponseModel, Error>) -> Void) {
        AF.request(url,method: method,parameters: parameters).response { response in
            if let error = response.error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            guard let data = response.data else { return }
            
            do {
                let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseModel))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // Serialization JSON
    func request(url: URL, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Result<String, Error>) -> Void) {
        AF.request(url,method: method,parameters: parameters).response { response in
            if let error = response.error {
                print(error.localizedDescription)
            }
            guard let data = response.data else { return }
            
            do {
                let result = try JSONSerialization.jsonObject(with: data)
                print(result)
                completion(.success("result"))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
