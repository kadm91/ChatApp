//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Kevin Martinez on 3/16/24.
//

import SwiftUI

struct MessageBubble: View {
    
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.recived ? .leading : .trailing ) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.recived ? Color.custumGray : Color.peach)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .frame(maxWidth: 300, alignment: message.recived ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundStyle(Color.gray)
                    .padding(message.recived ? .leading : .trailing)
            }
            
            
            
        }
        .frame(maxWidth: .infinity, alignment: message.recived ? .leading : .trailing)
        .padding(message.recived ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

//MARK: - Preview

#Preview("Sender") {
    MessageBubble(message: MessagePreview.senderMessagePreview )
}

#Preview("Reciver") {
    MessageBubble(message: MessagePreview.reciverMessagePreview)
}
