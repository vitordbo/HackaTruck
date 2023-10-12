//
//  ContentView.swift
//  TabView-NavigationStack
//
//  Created by Student on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ItemListView().badge(2).tabItem
            {
                (Label("Home", systemImage: "person.line.dotted.person.fill"))
            }
            BlueQuadView().tabItem{
                (Label("", systemImage: "magnifyingglass"))
            }
            PhotosView().tabItem{
                (Label("", systemImage: "photo"))
            }
            ItemListView().badge("!").tabItem
            {
                (Label("Messages", systemImage: ""))
            }
            PhotosView().tabItem
            {
                (Label("Profile", systemImage: "person.crop.circle.fill"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
