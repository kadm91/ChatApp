//
//  ContentView.swift
//  ChatApp
//
//  Created by Kevin Martinez on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var messageManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messageManager.messages, id: \.id) { message in
                            
                            MessageBubble(message: message)
                            
                            
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: messageManager.lastMessageID) { _ , id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
                
                
                
            }
            .background(Color.peach)
            
            MessageField()
                .environmentObject(messageManager)
        }
    }
}

#Preview {
    ContentView()
}
