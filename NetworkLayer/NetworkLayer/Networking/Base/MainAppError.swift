//
//  MainAppError.swift
//  NetworkLayerBootCamp
//
//  Created by Ahmed Elsman on 22/06/2022.
//

import Foundation

public enum MainAppError: Error {
    case noResult
    case noInternetConnection
    case errorMessage(String, HTTPStatusCode, Int)
    case message(String)
    case failToMapResponseError
}
