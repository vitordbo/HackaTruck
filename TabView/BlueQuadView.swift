//
//  BlueQuadView.swift
//  TabView-NavigationStack
//
//  Created by Student on 11/10/23.
//

import SwiftUI

struct BlueQuadView: View {
    var body: some View {
        ZStack{
            Rectangle().fill(Color.blue).frame(width: 300, height: 300)
            Text("Hello, HackaTruck!")
        }
       
    }
}

struct BlueQuadView_Previews: PreviewProvider {
    static var previews: some View {
        BlueQuadView()
    }
}
