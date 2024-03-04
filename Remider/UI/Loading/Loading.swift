//
//  Loading.swift
//  Reminder
//
//  Created by Tran Viet Anh on 28/02/2024.
//

import SwiftUI

struct Loading: View {
    let view: any View
     @State private var isShowingRegistration = false
    @State private var isView = false

     var body: some View {
     
             HStack {
                 Button {
                     isShowingRegistration.toggle()
                
                 } label: {
                     Label("", systemImage: "chevron.right.circle")
                         .font(.system(size: 60))
                         .imageScale(.large)
                         .rotationEffect(.degrees(isShowingRegistration ? 90 : 0))
                         .foregroundColor(isShowingRegistration ?  .green: .red)
                         .padding()
                         .animation(.easeInOut, value: isShowingRegistration)
                 }
             }
             
            
             .background(Color.purple.opacity(0.7))
         .fullScreenCover(isPresented: $isView) {
             LoginView()
         }
         
         .onAppear{
             DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                             withAnimation {
                                 isShowingRegistration = true
                            
                    }
                 DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                     isView = true
                    }
            }
            
         }
     }
}

#Preview {
    Loading(view: LoginView())
}
