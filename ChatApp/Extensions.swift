//
//  Extensions.swift
//  ChatApp
//
//  Created by Kevin Martinez on 3/16/24.
//

import SwiftUI

// Extension for adding rounded corners to specific corners

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(raidus: radius, corners: corners))
    }
}


// Custom RoundedCorner shape used for cornerRadius extension above

struct RoundedCorner: Shape {
    var raidus: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: raidus, height: raidus))
        return Path(path.cgPath)
    }
}
