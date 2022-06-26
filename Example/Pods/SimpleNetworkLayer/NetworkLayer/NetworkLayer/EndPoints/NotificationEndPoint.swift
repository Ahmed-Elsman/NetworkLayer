//
//  NotificationEndPoint.swift
//  NetworkLayerBootCamp
//
//  Created by Ahmed Elsman on 22/06/2022.
//

import Foundation

struct GetNotifications: Endpoint {

    var url: String = "ar/ads"
    var baseUrl: EndpointBaseUrl = .apiURL
    var method: EndpointHTTPMethod = .get
    var parameters: [String: Any] =  [:]
    var extraHeaders: [String: String] = [:]
    var headersType: EndpointHeaders = .mainAppHeaders
    var encoding: EndpointEncoding = .query
}

struct SendOTP: Endpoint {

    var url: String = "en/auth/send-otp"
    var baseUrl: EndpointBaseUrl = .apiURL
    var method: EndpointHTTPMethod = .post
    var parameters: [String: Any] =  [:]
    var extraHeaders: [String: String] = [:]
    var headersType: EndpointHeaders = .mainAppHeaders
    var encoding: EndpointEncoding = .query
    
    
    
    init() {
        parameters = ["mobile": "54949190",
                      "device_model": "123",
                      "device_id": "123",
                      "platform": "android",
                      "firebase_token": "clqG49TEBLw:APA91bHKMclpGWslqe50ESA8WkIt7PUrOPXeG_7khIfIxnOeFktvZO8EWiFtzBBMK32ZfC01gMPc8354Mjtabq9iGraKxxfRtvLZS7AsQ-Sn6AJ5vsebJDNcqH1nNGH4hPchxaBtXZRD"]
    }
}
