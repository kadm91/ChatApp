//
//  TitleRow.swift
//  ChatApp
//
//  Created by Kevin Martinez on 3/16/24.
//

import SwiftUI

struct TitleRow: View {
    
    var imageURL = URL(string: Constants.profileImage)
    var name = "Sarah Smith"
    
    var body: some View {
        HStack(spacing: 20) {
            
            profileImage
            
            VStack(alignment: .leading, spacing: 5) {
                
                userName
                userStatus
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            phoneImage
            
        }
        .padding()
    }
}


//MARK: - TitleRow extention

extension TitleRow {
    
    // profileImage
    
    var profileImage: some View {
        AsyncImage(url: imageURL) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
        } placeholder: {
            ProgressView()
        }
    }
    
    // name
    
    var userName: some View {
        Text(name)
            .font(.title).bold()
    }
    
    //userStatus
    
    var userStatus: some View {
        HStack(spacing: 4){
            Circle()
                .foregroundColor(.green)
                .frame(width: 8, height: 8)
            
            Text("Online")
                .foregroundStyle(.green)
                .font(.caption).bold()
        }
    }
    
    // phoneIamge
    
    var phoneImage: some View {
        Image(systemName: "phone.fill")
            .foregroundStyle(.gray)
            .padding(10)
            .background(.white)
            .clipShape(Circle())
    }
    
    
}

//MARK: - Preview

#Preview {
    TitleRow()
        .background(Color.peach)
}



//MARK: - Constants

private struct Constants{
    static let profileImage = "https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
}
