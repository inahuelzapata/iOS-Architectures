//
//  RequestManager.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import BoltsSwift
import Alamofire

class RequestManager: Requestable, HttpRequestHandler {

    static let shared = RequestManager()

    typealias Dictionary = [String: Any]
    typealias ReturnTask = Task<Any>
    typealias Endpoint = String
    typealias Headers = [String: String]
    typealias Encoding = JSONEncoding

    private var urlPath: String!
    private var defaultEncoding: Encoding!

    private init() {
        urlPath = "https://jsonplaceholder.typicode.com"
        defaultEncoding = Encoding.default
    }

    func get(endpoint: String, params: [String: Any], headers: [String: String]) -> Task<Any> {
        return self.request(urlPath + endpoint,
                            parameters: params,
                            headers: headers)
    }

    func post(endpoint: String, params: [String: Any], headers: [String: String]) -> Task<Any> {
        return self.request(urlPath + endpoint,
                            method: .post,
                            parameters: params,
                            encoding: defaultEncoding,
                            headers: headers)
    }

    func put(endpoint: String, params: [String: Any], headers: [String: String]) -> Task<Any> {
        return self.request(urlPath + endpoint,
                            method: .put,
                            parameters: params,
                            encoding: defaultEncoding,
                            headers: headers)
    }

    func delete(endpoint: String, params: [String: Any], headers: [String: String]) -> Task<Any> {
        return self.request(urlPath + endpoint,
                            method: .delete,
                            parameters: params,
                            encoding: defaultEncoding,
                            headers: headers)
    }
}
