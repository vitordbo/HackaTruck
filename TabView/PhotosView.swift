//
//  PhotosView.swift
//  TabView-NavigationStack
//
//  Created by Student on 11/10/23.
//

import SwiftUI

struct PhotosView: View {
    let images: [String] = ["dumbbell", "sportscourt.fill", "basketball.fill", "hockey.puck.fill", "trophy.fill", "cloud.hail.fill", "square.and.arrow.up", "homekit"]

    var body: some View {
        List {
            ForEach(images, id: \.self) {
                Image(systemName: $0).resizable().scaledToFit()
            }.listRowSeparator(.hidden, edges: .bottom).padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
