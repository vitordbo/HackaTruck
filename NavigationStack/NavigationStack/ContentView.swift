//
//  ContentView.swift
//  NavigationStack
//
//  Created by Student on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet = false

    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: Mode1()) {
                    Text("Mode 1")
                }
                NavigationLink(destination: Mode2()) {
                    Text("Mode 2")
                }
               Button(action: {
                   showSheet.toggle()
               }){
                   Text("Mode 3")
               }.sheet(isPresented: $showSheet){
                   Mode3()
               }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
