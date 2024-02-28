//
//  ReminderView.swift
//  Reminder
//
//  Created by Tran Viet Anh on 28/02/2024.
//

import SwiftUI

struct ReminderView: View {
        @State private var isButtonVisible = true
        @State var show = false

        var body: some View {
            VStack {
                Button(action: {
                    withAnimation {
                        self.isButtonVisible.toggle()
                    }
                }) {
                    Text("Press me")
                }

                if isButtonVisible {
                    Button(action: {}) {
                        Text("Hidden Button")
                    }.transition(.moveAndScale(edge: .trailing, scale: 2.5))
                }
            }
            VStack {
                        Toggle(isOn: $isButtonVisible.animation()) {
                            Text("Show/Hide button")
                        }

                        if isButtonVisible {
                            Button(action: {}) {
                                Text("Hidden Button")
                            }.transition(.move(edge: .trailing))
                        }
                    }
            VStack {
                        Toggle(isOn: $isButtonVisible.animation()) {
                            Text("Show/Hide button")
                        }

                        if isButtonVisible {
                            Button(action: {}) {
                                Text("Hidden Button")
                            }.transition(.moveOrFade(edge: .trailing))
                        }
                    }
            RoundedRectangle(cornerRadius: 30)
                    .frame(width: 300, height: 200)
                    .offset(y: isButtonVisible ? -200 : 0)
                    .scaleEffect(isButtonVisible ? 1.2 : 1)
                    .rotation3DEffect(
                        Angle(degrees: isButtonVisible ? 30 : 0),
                        axis: (x: 1, y: 0, z: 0),
                        anchor: .center,
                        anchorZ: 0.0,
                        perspective: 1
                    )
                    .onTapGesture {
                            withAnimation(.spring()) {
                                isButtonVisible.toggle()
                        }
                    }

                 ZStack {
                     RoundedRectangle(cornerRadius: 30)
                         .frame(width: 260, height: 200)
                         .offset(y: 20)
                     RoundedRectangle(cornerRadius: 30)
                         .frame(width: 300, height: 200)
                         .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                         .offset(y: show ? -200 : 0)
                         .scaleEffect(show ? 1.2 : 1)
                         .rotationEffect(Angle(degrees: show ? 30 : 0))
                         .rotation3DEffect(
                             Angle(degrees: show ? 30 : 0),
                             axis: (x: 1, y: 0, z: 0),
                             anchor: .center,
                             anchorZ: 0.0,
                             perspective: 1
                         )
                         .onTapGesture {
                             withAnimation(.spring()) {
                                 show.toggle()
                             }
                         }
                 }
             
        }
}
extension AnyTransition {
    static func moveAndScale(edge: Edge, scale: Double) -> AnyTransition {
        AnyTransition.move(edge: edge).combined(with: .scale(scale: scale))
    }
    static func moveOrFade(edge: Edge) -> AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: edge),
            removal: .opacity
        )
    }
}
#Preview {
    ReminderView()
}
