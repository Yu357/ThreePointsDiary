//
//  ContentView.swift
//  ThreePointsDiary
//
//  Created by Yu on 2021/09/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("日記")
                }
            SecondView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("検索")
                }
            ThirdView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("カレンダー")
                }
        }
    }
}
