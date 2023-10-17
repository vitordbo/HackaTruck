//
//  PlayView.swift
//  ListViewSpotify
//
//  Created by Student on 16/10/23.
//

import SwiftUI

struct PlayView: View {
    var song: Song
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black.opacity(0.95)],
                           startPoint: .top,
                           endPoint: .center).ignoresSafeArea()
            VStack{
                AsyncImage(url: URL(string: song.cover))
                    .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200).clipped().padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Text(song.name).foregroundColor(.white)
                Text(song.artist).foregroundColor(.white)
                HStack{
                    Label("", systemImage:  "shuffle").foregroundColor(.white).font(.title3)
                    Label("", systemImage:"backward.end.fill").foregroundColor(.white).font(.title3)
                    Label("", systemImage:"play.fill").foregroundColor(.white).font(.title)
                    Label("", systemImage:"forward.end.fill").foregroundColor(.white).font(.title3)
                    Label("", systemImage:"repeat").foregroundColor(.white).font(.title3)
                }.padding(.top)
            }
            
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(song: Song(id: 0, name: "Yellow", artist: "ColdPlay", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"))
    }
}
