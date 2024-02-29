//
//  ItemView.swift
//  Reminder
//
//  Created by Tran Viet Anh on 28/02/2024.
//

import SwiftUI

struct ItemView: View {
    @State var title:String
    @State var subTitle:String
    @State var isOn:Bool
    @State var isDetailViewPresented = false
    @State var item:Item
    var body: some View {
        Button(action: {self.isDetailViewPresented = true}, label: {
            HStack{
                VStack{
                    Text(title)
                        .font(.system(size: 20))
                        .bold()
                        
                    Text(subTitle)
                }.padding()
                Spacer()
                Image(systemName: item.status ? "checkmark.square.fill" : "square")
                    .foregroundColor(item.status ? Color(UIColor.systemBlue) : Color.white)
                    .onTapGesture {
                        item.status.toggle()
                    }.padding()
                
            }.background(item.status ? Color.green.opacity(0.5) : Color.blue.opacity(0.5))
                .foregroundColor(.white)
            .cornerRadius(10)
        }).sheet(isPresented: $isDetailViewPresented) {
            DetailView(item: item)
        }.transition(.moveOrFade(edge: .trailing))

    }
}

#Preview {
    ItemView(title: "hello", subTitle: "hello", isOn: true, item: Item(title: "hello", bodyTile: "hii", status: true))
    
}
