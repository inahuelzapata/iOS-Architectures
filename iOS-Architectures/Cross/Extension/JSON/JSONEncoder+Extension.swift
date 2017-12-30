//
//  JSONEncoder+Extension.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 30/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation

extension JSONEncoder {
    func encodeJSONObject<T: Encodable>(_ value: T, options opt: JSONSerialization.ReadingOptions = []) throws -> Any {
        let data = try encode(value)
        return try JSONSerialization.jsonObject(with: data, options: opt)
    }
}
