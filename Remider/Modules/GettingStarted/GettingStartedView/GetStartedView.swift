//
//  GetStartedView.swift
//  Reminder
//
//  Created by Tran Viet Anh on 02/03/2024.
//

import SwiftUI

struct GetStartedView: View {
    @State var isShowingLogin = false
    var body: some View {
        VStack{
            Image("cloud")
                .resizable()
                .frame(width: 175, height: 150)
                .offset(x:-110,y:-60)

            Image("getstarted")
                .resizable()
                .frame(width: 175, height: 250)
            Text("Unlock a world of possibilities")
                .bold()
                .font(.system(size: 25))
                .foregroundStyle(Color("Color"))
            Text("Here’s your digital personal assistant, making sure your day is well panned and organized, giving you real time reminders of Day to Day task and keeping you ahead. Get started to get reminded.")
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.6))
                .padding()
            Spacer()
            Button("Get started") {
                isShowingLogin=true
            }.buttonStyle(PressEffectButtonStyle(backgroundColor: Color("Color")))
                .padding(.bottom)
        }
        .fullScreenCover(isPresented: $isShowingLogin) {
            LoginView()
        }
    }
}

#Preview {
    GetStartedView()
}
