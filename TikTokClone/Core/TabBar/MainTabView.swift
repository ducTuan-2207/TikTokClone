//
//  MainTabView.swift
//  TikTokClone
//
//  Created by macOS on 28/03/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
                Text("Home")
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none )
                        //symbolVariants : là môi trường để thiết lập biến thể cho biêu tượng hệ thống
                        Text("Home")
                    }
                }
                .onAppear{selectedTab = 0} // khi màn hình được mở thì tab đầu tiên sẽ xuất hiện
                .tag(0)
            
            Text("Shop")
            .tabItem {
                VStack {
                    Image(systemName: selectedTab == 0 ? "bag.fill" : "bag")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none )
                    Text("Shop")
                }
            }
            .onAppear{selectedTab = 1}
            .tag(1)
            Text("Upload")
            .tabItem {
                VStack {
                    Image(systemName: "plus")
                    Text("Uploaf post")
                }
            }
            
            Text("Notification")
            .tabItem {
                VStack {
                    Image(systemName:selectedTab == 3 ? "message.fill" : "message")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none )
                    Text("Hộp thu")
                }
            }
            .onAppear{selectedTab = 3}
            .tag(3)
            Text("Profile")
            .tabItem {
                VStack {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none )
                    Text("Hồ sơ")
                }
            }
            .onAppear{selectedTab = 4}
            .tag(4)
        }
        .tint(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
