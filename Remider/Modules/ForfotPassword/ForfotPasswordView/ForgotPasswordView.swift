//
//  ForgotPasswordView.swift
//  Reminder
//
//  Created by Tran Viet Anh on 02/03/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email = ""
    var body: some View {
        VStack{
            Image("cloud")
                .resizable()
                .frame(width: 175, height: 150)
                .offset(x:-110,y:-60)
            Text("Forgot password")
                .bold()
                .font(.system(size: 30))
                .foregroundStyle(Color("Color"))
                
            Image("login")
                .resizable()
                .frame(width: 175, height: 200)
                .padding(.bottom,50)
            Spacer()
            TextField("Email",text: $email)
                .padding()
                .background(Color("Color").opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)
            Spacer()
            Button("Sent email") {
                
            }

         
            .buttonStyle(PressEffectButtonStyle(backgroundColor: Color("Color")))
        }
    }
}

#Preview {
    ForgotPasswordView()
}
