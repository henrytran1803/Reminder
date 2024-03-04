//
//  HomeView.swift
//  Reminder
//
//  Created by Tran Viet Anh on 28/02/2024.
//

import SwiftUI

struct HomeView: View {
    @State var tabSelected: Tab = .house
    var body: some View {
            ZStack {
                VStack {
                    switch tabSelected {
                    case .house:
                        ContentView()
                    case .person:
                        ProfileView()
                    case .gearshape:
                        ProfileView()
                    }

                    Spacer()
                }
                .padding(.bottom, 60) // Adjust bottom padding to make space for the custom tab bar
                
                VStack {
                    Spacer()
                    ToolBarView(selectedTab: $tabSelected)
                }
            }
            .overlay(
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        Text(tab.rawValue.capitalized)
                            .tag(tab)
                    }
                }
                .hidden()
            )
        }
    }
#Preview {
    HomeView()
}
