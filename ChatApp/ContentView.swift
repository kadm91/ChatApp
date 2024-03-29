//
//  ContentView.swift
//  ChatApp
//
//  Created by Kevin Martinez on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    
    var messageArray = ["Hello you", "How are you doing?", "I've been building SwiftUI applications from scratch and it's so much fun!"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                        
                        MessageBubble(message: Message(id: "1234", text: text, recived: true, timestamp: Date()))
                        
                        
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                
                
                
            }
            .background(Color.peach)
            
            MessageField()
        }
    }
}

#Preview {
    ContentView()
}
