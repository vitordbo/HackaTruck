//
//  EnderecoView.swift
//  MelhorQuitanda
//
//  Created by Student on 24/10/23.
//

import SwiftUI
import MapKit

struct Endereco: Identifiable {
    let id = UUID()
    var nome: String
    let coordinate: CLLocationCoordinate2D
    let description: String
}

struct EnderecoView: View {
    let location = [
        Endereco(nome: "Quitanda Vitor", coordinate: CLLocationCoordinate2D(latitude: -5.206802, longitude: -37.324050),
            description: "Melhor quitadna de todas")
    ]

    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -5.204455, longitude: -37.323206), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.005))
    
    @State private var lastPlace = ""
    @State var showSheet = false
    @State var selectedLocation : Endereco

    var body: some View {
        VStack{
            Text("Nossa localização").font(.title).bold()
            Text("Venha nos visitar!").font(.title3).bold()
            NavigationView {
                Map(coordinateRegion: $mapRegion, annotationItems: location) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        NavigationLink{
                            Text(location.nome)
                        } label: {
                            Circle()
                                .stroke(.red, lineWidth: 12)
                                .frame(width: 12, height: 12)
                                .onTapGesture {
                                    showSheet.toggle()
                                    selectedLocation = location
                                }
                        }
                    }
                }
            }
        }.sheet(isPresented: $showSheet){
          
        }
}

struct EnderecoView_Previews: PreviewProvider {
    static var previews: some View {
        EnderecoView(selectedLocation: Endereco(nome: "", coordinate: CLLocationCoordinate2D(latitude: 52.3555, longitude: 1.1743), description: ""))
        }
    }
}
