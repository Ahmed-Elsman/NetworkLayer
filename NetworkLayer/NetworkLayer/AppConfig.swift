//
//  AppConfig.swift
//  NetworkLayerBootCamp
//
//  Created by Ahmed Elsman on 22/06/2022.
//

import UIKit

enum Config: String {
    case API_URL
    case timeout

    static let config = Bundle.main.object(forInfoDictionaryKey: "config") as? [String: String]
    var value: String {
        return Config.config?[rawValue] ?? ""
    }
}
