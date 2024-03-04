//
//  ItemView.swift
//  Reminder
//
//  Created by Tran Viet Anh on 28/02/2024.
//

import SwiftUI
import Foundation
struct ItemView: View {
    @State var title:String
    @State var subTitle:String
    @State var date:Date
    @State var isOn:Bool
    @State var isDetailViewPresented = false
    @State var item:Item

    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        return Button(action: {self.isDetailViewPresented = true}, label: {
            HStack{
                VStack{
                    Text(title)
                        .font(.system(size: 20))
                        .bold()
                        
                    Text(subTitle)
                }.padding()
                
                
                Text(dateFormatter.string(from: date))
                
               
                Image(systemName: item.status ? "checkmark.square.fill" : "square")
                    .foregroundColor(item.status ? Color(UIColor.systemBlue) : Color.white)
                    .onTapGesture {
                        item.status.toggle()
                    }.padding()
                
            }.background(item.status ? Color.green.opacity(0.5) : Color.blue.opacity(0.5))
                .foregroundColor(item.status ? .red : .white)
            .cornerRadius(10)
        }).sheet(isPresented: $isDetailViewPresented) {
            DetailView(item: $item, isDetailViewPresented: $isDetailViewPresented)
        }.transition(.moveOrFade(edge: .trailing))

    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(title: "hello", subTitle: "hello", date: Date(), isOn: true, item: Item(title: "hello", bodyTile: "hii", status: true, date: Date()))
    }
}
