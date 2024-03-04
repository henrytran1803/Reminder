//
//  Button.swift
//  Reminder
//
//  Created by Tran Viet Anh on 04/03/2024.
//

import Foundation
import SwiftUI
struct PressEffectButtonStyle: ButtonStyle {
    var backgroundColor: Color // Thêm thuộc tính màu đây
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor) // Sử dụng màu từ thuộc tính backgroundColor
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}
