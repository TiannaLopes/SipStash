//
//  ContentView.swift
//  SipStash
//
//  Created by Tianna Alina Lopes on 5/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BottleListView()
                .tabItem {
                    Label("Inventory", systemImage: "list.bullet")
                }
            
            AddBottleView()
                .tabItem {
                    Label("Add Bottle", systemImage: "plus.circle")
                }
        }
    }
}

