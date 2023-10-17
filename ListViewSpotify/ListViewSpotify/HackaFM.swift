//
//  HackaFM.swift
//  ListViewSpotify
//
//  Created by Student on 16/10/23.
//

import SwiftUI

struct HackaFM: View {
    
    private var songs = [
        Song(id: 0, name: "Yellow", artist: "ColdPlay", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Song(id: 1, name: "Yellow", artist: "ColdPlay", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Song(id: 2, name: "Yellow", artist: "ColdPlay", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Song(id: 3, name: "Yellow", artist: "ColdPlay", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Song(id: 4, name: "Yellow", artist: "ColdPlay", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Song(id: 5, name: "Yellow", artist: "ColdPlay", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Song(id: 6, name: "Yellow", artist: "ColdPlay", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Song(id: 7, name: "Final", artist: "samba 89", cover: "https://lastfm.freetls.fastly.net/i/u/500x500/1263a8ca13047d963e3fd1f87230948d.jpg"),
    ]
    
    private var sugesteds = [
        Sugested(id: 0, name: "Yellow", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Sugested(id: 1, name: "Yellow", cover: "https://f.i.uol.com.br/fotografia/2023/08/16/169221617364dd2b6d52c11_1692216173_3x2_md.jpg"),
        Sugested(id: 2, name: "Yellow", cover: "https://lastfm.freetls.fastly.net/i/u/500x500/1263a8ca13047d963e3fd1f87230948d.jpg"),
        ]

    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.blue, .black.opacity(0.95)],
                               startPoint: .top,
                               endPoint: .center).ignoresSafeArea()
                VStack{
                    Image("caminhao") .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200).clipped()
                        .aspectRatio(1, contentMode: .fit)
                    Text("HackaFM").font(.title).bold().foregroundColor(.white).frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading).padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 100))
                    HStack{
                        Image("caminhao").resizable().frame(width: 30, height: 30, alignment: .leading)
                        Text("HackaSong").foregroundColor(.white)
                    }.frame(alignment: .leading).padding(EdgeInsets(top: 10, leading: -174, bottom: 0, trailing: 0))
                }.frame(maxWidth: .infinity, maxHeight: 500, alignment: .topLeading).padding(EdgeInsets(top: -250, leading: 0, bottom: 0, trailing: 0))
                
                ScrollView{
                    VStack{
                        ForEach(songs) { song in
                            NavigationLink(destination: PlayView(song: song)){
                                HStack{
                                    Spacer()
                                    AsyncImage(url: URL(string: song.cover)) { image in image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }.frame(width: 50, height: 50)
                                    VStack{
                                        Text(song.name).foregroundColor(.white)
                                        Text(song.artist).foregroundColor(.white)
                                    }
                                    Label("", systemImage:  "ellipsis").foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 200, bottom: 0, trailing: 0))
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    Text("Sugeridos").foregroundColor(.white).bold().font(.title)
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(sugesteds) { sugested in
                                AsyncImage(url: URL(string: sugested.cover)) { image in image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }.frame(width: 170, height: 170)
                            }
                        }
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                }.padding(EdgeInsets(top:320, leading: 0, bottom: 0, trailing: 0))
                
            }
        }
    }
}

struct HackaFM_Previews: PreviewProvider {
    static var previews: some View {
        HackaFM()
    }
}
