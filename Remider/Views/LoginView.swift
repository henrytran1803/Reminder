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
    @State var isShowingAnimation = false
    @State private var showAlertEmpty = false
    var body: some View {
        NavigationView {
            VStack{
                
                Image(systemName: "person.circle")
                    .symbolRenderingMode(.palette)
                    .renderingMode(.template)
                    .font(.system(size: 60))
                    .imageScale(.large)
                    .rotationEffect(.degrees(isShowingAnimation ? 360 : 0))
                    .foregroundColor(isShowingAnimation ?  .green: .red)
                    .padding()
                    .animation(.easeInOut, value: isShowingAnimation)
                Spacer()
                Text("User name")
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.trailing)
                TextField("User Name",text: $username)
                    .padding()
                    .background(Color("Color").opacity(0.3))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                Text("Password")
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.trailing)
                SecureField("Password",text: $password)
                    .padding()
                    .background(Color("Color").opacity(0.3))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                let skyBlue = Color("Color")
                Spacer()
                Button("Đăng nhập") {
                    isShowingHome = true
                    if password.isEmpty || username.isEmpty {
                        showAlertEmpty = true
                    } else {
                        Task {
                            do {
                                let token = try await performLoginAPICall(username: username, password: password)
                                Alert(
                                    title: Text(token)
                                )
                            } catch {
                                print("Error: \(error)")
                            }
                        }
                    }
                }
                .alert(isPresented: $showAlertEmpty) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Username, password mustn't empty")
                        )
                    }
                .buttonStyle(PressEffectButtonStyle(backgroundColor: skyBlue))
                HStack {
                    Text("Chưa có tài khoản?")
                        .font(.system(size: 14))
                        .padding(.top, 8)
                    
                    Button(action: {
                        isShowingRegistration = true
                    }) {
                        Text("Tạo tài khoản")
                            .font(.system(size: 14))
                            .foregroundColor(Color("Color"))
                            .padding(.top, 8)
                    }
                }
                
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                isShowingAnimation = true
                   }
           }
        }.fullScreenCover(isPresented: $isShowingRegistration) {
            RegisterView()
        }

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
