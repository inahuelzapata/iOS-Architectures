//
//  User.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation

class User: Codable {

    var id: Int!
    var name: String!
    var username: String!
    var email: String!
    var address: Address!
    var phone: String!
    var website: String!
    var company: Company!
}

class Address: Codable {
    var street: String!
    var suite: String!
    var city: String!
    var zipCode: String!
    var geo: Location!
}

class Location: Codable {
    var latitude: Double!
    var longitude: Double!
}

class Company: Codable {
    var name: String!
    var catchPhrase: String!
    var bs: String!
}
