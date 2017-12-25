//
//  Requestable.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation

protocol Requestable {
    associatedtype Dictionary
    associatedtype ReturnTask
    associatedtype Endpoint
    associatedtype Headers

    func get(endpoint: Endpoint, params: Dictionary, headers: Headers) -> ReturnTask

    func post(endpoint: Endpoint, params: Dictionary, headers: Headers) -> ReturnTask

    func put(endpoint: Endpoint, params: Dictionary, headers: Headers) -> ReturnTask

    func delete(endpoint: Endpoint, params: Dictionary, headers: Headers) -> ReturnTask
}
