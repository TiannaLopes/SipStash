//
//  Bottle.swift
//  SipStash
//
//  Created by Tianna Alina Lopes on 5/24/24.
//

import Foundation

struct Bottle: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var type: String
    var volume: Int
    var price: Double?
}

