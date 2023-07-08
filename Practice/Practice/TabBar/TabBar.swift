//
//  SwiftUIView2.swift
//  Practice
//
//  Created by Артем on 31.03.2023.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Profit", systemImage: "list.dash")
                }

//            ContentView2()
            ContentView6()
                .tabItem {
                    Label("Expenses", systemImage: "square.and.pencil")
                }
            SwiftUIView3(  res: Final(), expenses2: Expenses())
                .tabItem {
                    Label("Schedule", systemImage: "square.and.pencil")
                }
        }
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
