//
//  LoginView.swift
//  Remider
//
//  Created by Tran Viet Anh on 27/02/2024.
//

import SwiftUI

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    @State var isShowingHome = false
    @State var isShowingRegistration = false
    @State private var showAlertEmpty = false
    var body: some View {
        NavigationView {
            VStack{
                Image(systemName: "command.circle")
                    .font(.system(size: 50))
                Spacer()
                Text("User name")
                TextField("User Name",text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                Text("Password")
                SecureField("Password",text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                Button("Đăng nhập") {
                    isShowingHome = true
                    if(password.isEmpty || username.isEmpty ){
                        showAlertEmpty = true
                    }
                }
                .alert(isPresented: $showAlertEmpty) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Username, password mustn't empty")
                        )
                    }
                .buttonStyle(PressEffectButtonStyle(backgroundColor: Color.blue))
                HStack {
                    Text("Chưa có tài khoản?")
                        .font(.system(size: 14))
                        .padding(.top, 8)
                    
                    Button(action: {
                        isShowingRegistration = true
                    }) {
                        Text("Tạo tài khoản")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                            .padding(.top, 8)
                    }
                }
                
            }
        }.background(Color.blue)
    }
}
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

#Preview {
    LoginView()
}
