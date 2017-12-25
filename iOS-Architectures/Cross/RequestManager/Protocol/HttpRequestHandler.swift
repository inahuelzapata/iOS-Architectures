//
//  HttpRequestHandler.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import BoltsSwift
import Alamofire

protocol HttpRequestHandler: ResponseHandler {

}

extension HttpRequestHandler {
    func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> Task<Any> {
            let task = TaskCompletionSource<Any>()
            Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
                .validate()
                .responseJSON { response in
                    self.handle(task, with: response)
            }
            return task.task
    }
}
