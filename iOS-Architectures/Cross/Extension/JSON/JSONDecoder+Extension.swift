//
//  JSONDecoder+Extension.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 30/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type,
                              withJSONObject object: Any,
                              options opt: JSONSerialization.WritingOptions = []) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)
        return try decode(T.self, from: data)
    }
}
