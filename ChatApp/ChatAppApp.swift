//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Kevin Martinez on 3/16/24.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
