//
//  Endpoint.swift
//  Elsman
//
//  Created by Ahmed Elsman.
//  Copyright © 2019 Elsman. All rights reserved.
//

import Foundation
import Alamofire

public protocol Endpoint {
    var url: String {get set}
    var baseUrl: EndpointBaseUrl {get set}
    var method: EndpointHTTPMethod {get set}
    var parameters: [String: Any] {get set}
    var encoding: EndpointEncoding {get set}
    var headersType: EndpointHeaders {get set}
    var extraHeaders: [String: String] {get set}
}

public enum EndpointHeaders {
    case mainAppHeaders
    case noAuthHeader

    var headers: [String: String] {
        switch self {
        case .noAuthHeader:
            return [String: String]()
        case .mainAppHeaders :
            var header = [String: String]()
            header["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3dhamFoYS5hcHAvYXBpL3YxL2FyL2F1dGgvdmVyaWZpY2F0aW9uIiwiaWF0IjoxNjU1NzA5NTMyLCJleHAiOjE2NjM0ODU1MzIsIm5iZiI6MTY1NTcwOTUzMiwianRpIjoibG1rb3ZxT1F4amtGYXlzUCIsInN1YiI6IjM1IiwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.dHmCBNER31VUAbvRGPEs0E-iuGIuAv-n8bklbTnCjC4"
            print(header["Authorization"] ?? "no auth")
            return header
        }
    }
}

public enum EndpointEncoding {
    case json
    case query
    case body
}

public enum EndpointHTTPMethod: String {
    case get
    case post
    case put
    case delete
    case head
}

public enum EndpointBaseUrl {
    case apiURL
    case none

    var url: String {
        switch self {
        case .apiURL:
            return Config.API_URL.value
        case .none:
            return ""
        }
    }

}

public extension EndpointEncoding {
    var alamofireEncoding: ParameterEncoding {
        switch self {
        case .json: return JSONEncoding.default
        case .query: return URLEncoding.queryString
        case .body: return URLEncoding.httpBody
        }
    }
}
