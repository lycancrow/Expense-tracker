//
//  ButtonDisplay.swift
//  ExpenseTracker
//
//  Created by Luis Felipe on 2024-01-02.
//

import SwiftUI

struct ButtonDisplay: View {
    @Binding var isButtonClicked : Bool

    var icon = "pencil"
    var color : Color = .blue
    var offsetX = 0
    var offsetY = 0
    var delay = 0.0
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }){
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .bold))
        }
        .padding()
        .background(color)
        .mask(Circle())
        .offset(x: isButtonClicked ? CGFloat(offsetX) : 0, y: isButtonClicked ? CGFloat(offsetY) : 0)
        .scaleEffect(isButtonClicked ? 1:0)
        .animation(Animation.spring(response: 0.4, dampingFraction: 0.9, blendDuration: 0).delay(Double(delay)))
    }
}

