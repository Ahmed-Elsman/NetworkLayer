//
//  BaseResponse.swift
//  NetworkLayer
//
//  Created by Ahmed Elsman
//  Copyright © 2020 Ahmed Elsman. All rights reserved.
//

import Foundation

public class BaseResponse<T: Codable>: Codable {
    public var status: String?
    public var data: T?
    public var message: String?
}
