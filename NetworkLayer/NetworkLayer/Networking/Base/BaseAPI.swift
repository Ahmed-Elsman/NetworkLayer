//
//  BaseAPI.swift
//  NetworkLayer
//
//  Created by Ahmed Elsman
//  Copyright © 2020 Ahmed Elsman. All rights reserved.
//

import Foundation
import Alamofire

public class BaseAPI<T: Endpoint> {
    
    public init() {}
    
    public func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion:@escaping (Result<M?, MainAppError>) -> Void) {
        
        // FIXME: Remove Print
        let fullUrl = target.baseUrl.url + target.url
        print(fullUrl)
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue.uppercased())
        let headers = Alamofire.HTTPHeaders(target.headersType.headers.merging(target.extraHeaders) { (_, new) in new })
        let params = target.parameters
        AF.request(fullUrl , method: method, parameters: params, encoding: target.encoding.alamofireEncoding, headers: headers).responseDecodable(of: M.self) { (response) in
            
            if MainAppReachability.shared.isConnected {
                guard let statusCode = response.response?.statusCode else {
                    completion(.failure(MainAppError.noResult))
                    return
                }
                if (200...299).contains(statusCode) { // reflect success response
                    // Successful request
                    guard let jsonResponse = try? response.result.get() else {
                        completion(.failure(MainAppError.failToMapResponseError))
                        return
                    }
                    completion(.success(jsonResponse))
                } else {
                    guard let response = try? JSONDecoder().decode(BaseResponse<String>.self, from: response.data ?? Data()) else {
                        completion(.failure(MainAppError.failToMapResponseError))
                        return
                    }
                    guard let message = response.message, let code = HTTPStatusCode(rawValue: statusCode) else {
                        completion(.failure(MainAppError.noResult))
                        return
                    }
                    completion(.failure(MainAppError.errorMessage(message, code, statusCode)))
                }
            } else {
                completion(.failure(MainAppError.noInternetConnection))
                return
            }
            
        }
    }
}
