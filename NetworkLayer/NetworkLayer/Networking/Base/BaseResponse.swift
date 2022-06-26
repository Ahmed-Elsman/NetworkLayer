//
//  BaseResponse.swift
//  NetworkLayer
//
//  Created by Ahmed masoud on 6/29/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation

public class BaseResponse<T: Codable>: Codable {
    public var status: String?
    public var data: T?
    public var message: String?
}
