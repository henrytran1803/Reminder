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
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack{
                VStack{
                    Text(title)
                    Text(subTitle)
                }
                
                Image(systemName: isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(isOn ? Color(UIColor.systemBlue) : Color.secondary)
                    .onTapGesture {
                        self.isOn.toggle()
                    }
                
            }
        })
        
    }
}
struct CheckboxStyle: ToggleStyle {

    func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .font(.system(size: 20, weight: .regular, design: .default))
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }

    }
}
#Preview {
    ItemView(title: "hello", subTitle: "hello", isOn: true)
    
}
