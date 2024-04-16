//
//  MessagerManager.swift
//  ChatApp
//
//  Created by Kevin Martinez on 4/15/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageID = ""
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener{ querySnapshot, error in
            guard let document = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = document.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding docuemnt into Message: \(error)")
                    return nil
                }
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp}
            
            if let id =  self.messages.last?.id {
                self.lastMessageID = id
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: UUID().uuidString, text: text, received: false, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
}
