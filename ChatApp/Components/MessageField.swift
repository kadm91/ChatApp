//
//  MessageField.swift
//  ChatApp
//
//  Created by Kevin Martinez on 3/28/24.
//

import SwiftUI

struct MessageField: View {
    
    @EnvironmentObject var messageManager: MessagesManager
    
    
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustumTextField(placeholder: Text("Enter your message here"), text: $message)
            
            Button {
                messageManager.sendMessage(text: message)
                message = ""
            } label: {
                    Image(systemName: "paperplane.fill")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(Color.peach)
                    .cornerRadius(50)
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.custumGray)
        .cornerRadius(50)
        .padding()
        
    }
}

#Preview {
    MessageField()
}

struct CustumTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
