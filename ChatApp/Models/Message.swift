//
//  Message.swift
//  ChatApp
//
//  Created by Kevin Martinez on 3/16/24.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}


struct MessagePreview {
    static var reciverMessagePreview = Message(id: "7474744", text: "Hello!", received: true, timestamp: Date.now)
    static var senderMessagePreview = Message(id: "7474745", text: "How is Going!", received: false, timestamp: Date.now)
}
