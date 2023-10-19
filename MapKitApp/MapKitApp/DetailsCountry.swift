//
//  DetailsCountry.swift
//  MapKitApp
//
//  Created by Student on 18/10/23.
//

import SwiftUI

struct DetailsCountry: View {
    var flag: String
    var description: String
    var name: String

    
    var body: some View {
        VStack{
            Text(name).bold().font(.title)
            Text(flag).font(.title)
            Text(description).font(.caption).padding(EdgeInsets(top: 2, leading: 5, bottom: 5, trailing: 5))
            Spacer()
        }
    }
}

struct DetailsCountry_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCountry(flag: "oi", description: "ola", name: "Brasil")
    }
}
