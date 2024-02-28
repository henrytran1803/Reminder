//
//  RegisterView.swift
//  Remider
//
//  Created by Tran Viet Anh on 27/02/2024.
//

import SwiftUI

struct RegisterView: View {
    @State var username = ""
    @State var password = ""
    @State var repeatpassword = ""
    @State private var showAlert = false
    @State private var showAlertEmpty = false
    @State private var showAlertEmptyPass = false
    @State private var isShowingAnimation = false
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "pencil.and.outline")
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
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                Text("Password")
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                Text("Repeat password")
                SecureField("Repeat password", text: $repeatpassword)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                if(repeatpassword.isEmpty != true && password != repeatpassword){
                    Text("password dont match")
                        .foregroundStyle(Color.red)
                        .font(.system(size: 6))
                }else if(repeatpassword.isEmpty != true && password == repeatpassword){
                    Text("password dont match")
                        .foregroundStyle(Color.red)
                        .font(.system(size: 10))
                }
                Spacer()
                Button("Register"){
                    if(password != repeatpassword){
                        showAlert = true
                    }
                    if(password.isEmpty || username.isEmpty || repeatpassword.isEmpty){
                        showAlertEmpty = true
                    }
                }
                    .buttonStyle(PressEffectButtonStyle(backgroundColor: Color.blue))
                    .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Error"),
                                message: Text("please repeat your password")
                            )
                        }
                    .alert(isPresented: $showAlertEmpty) {
                            Alert(
                                title: Text("Error"),
                                message: Text("Username, password, repeatpassword mustn't empty")
                            )
                        }
                HStack{
                    Text("Đã có tài khoản?")
                        .font(.system(size: 14))
                        .padding(.top, 8)

                    Button(action: {
                       //action
                    }) {
                        Text("Đăng nhập")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                            .padding(.top, 8)
                    }
                                    

                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation {
                                    isShowingAnimation = true
                       }
               }
            }
        }
    }
}
//    .padding()
//    .background(Color.gray.opacity(0.1))
//    .cornerRadius(8)
//    .padding(.horizontal)
//    .font(.system(size: 14))
//    .multilineTextAlignment(.leading)
func notify(action: UIAlertAction! = nil, message: String?, title: String) {
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "Continue", style: .default))
}
#Preview {
    RegisterView()
}
