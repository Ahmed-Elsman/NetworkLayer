//
//  BaseWorker.swift
//  NetworkLayerBootCamp
//
//  Created by Ahmed Elsman on 22/06/2022.
//

import Foundation

public protocol BaseWorker {
    func convertToMainAppError(error: Error) -> MainAppError
}

public extension BaseWorker {
    func convertToMainAppError(error: Error) -> MainAppError {
        if let errorValue = error as? MainAppError {
            return errorValue
        } else {
            return .noResult
        }
    }
}
