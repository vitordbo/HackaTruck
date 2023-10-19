//
//  MapView.swift
//  MapKitApp
//
//  Created by Student on 18/10/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let locations = [
        Location(name: "Inglaterra", coordinate: CLLocationCoordinate2D(latitude: 52.3555, longitude: 1.1743), flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿", description: "A Inglaterra, local de nascimento de Shakespeare e dos Beatles, é um país nas ilhas britânicas que faz fronteira com a Escócia e o País de Gales. A capital, Londres, situada às margens do rio Tâmisa, abriga o Parlamento, o Big Ben e a Torre de Londres, do século XI. A cidade é também um moderno centro multicultural de artes e negócios. Outras grandes cidades são Manchester, Birmingham, Liverpool, Bristol e os centros universitários de Oxford e Cambridge."),
        Location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -15.7801, longitude: -47.9292),flag: "🇧🇷", description: "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul. O Rio de Janeiro, simbolizado pela sua estátua de 38 metros de altura do Cristo Redentor, situada no topo do Corcovado, é famoso pelas movimentadas praias de Copacabana e Ipanema, bem como pelo imenso e animado Carnaval, com desfiles de carros alegóricos, fantasias extravagantes e samba."),
        Location(name: "Japao", coordinate: CLLocationCoordinate2D(latitude:  35.0000, longitude: 136.0000),flag: "🇯🇵", description: "O  Japão, país insular no Oceano Pacífico, tem cidades densas, palácios imperiais, parques nacionais montanhosos e milhares de santuários e templos. Os trens-bala Shinkansen conectam as principais ilhas: Kyushu (com as praias subtropicais de Okinawa), Honshu (onde ficam Tóquio e a sede do memorial da bomba atômica de Hiroshima) e Hokkaido (famosa como destino para a prática de esqui). Tóquio, a capital, é conhecida por seus arranha-céus e lojas e pela cultura pop"),
        Location(name: "Estados Unidos", coordinate: CLLocationCoordinate2D(latitude:  39.937196, longitude: -98.621100),flag: "🇺🇸", description: "Os EUA são um país com 50 estados que cobrem uma vasta faixa da América do Norte, com o Alasca ao noroeste e o Havaí no Oceano Pacífico, estendendo a presença do país. As principais cidades da costa atlântica são Nova York, um centro financeiro e cultural global, e a capital, Washington, DC. Chicago, uma metrópole do centro-oeste, é conhecida por sua importante arquitetura, enquanto Los Angeles, na costa oeste, é famosa pelas produções cinematográficas de Hollywood"),
        Location(name: "Africa do Sul", coordinate: CLLocationCoordinate2D(latitude:  -28.592559, longitude:  24.985739),flag: "🇿🇦", description: "A África do Sul é um país situado na extremidade sul do continente africano e marcado por vários ecossistemas diferentes. O Parque Nacional Kruger, um destino para safári no interior do país, é repleto de animais de grande porte. A província de Cabo Ocidental tem praias, vinícolas exuberantes perto de Stellenbosch e Paarl, colinas escarpadas no Cabo da Boa Esperança, florestas e lagoas ao longo da Tuinroete (rota dos jardins) e a Cidade do Cabo, que fica ao pé da montanha da Mesa, de topo achatado"),
    ]
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -11.030219, longitude: -51.818922), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    @State private var lastPlace = ""
    @State var showSheet = false
    @State var selectedLocation : Location

    var body: some View {
        VStack{
            Text("World map").font(.title).bold()
            Text(selectedLocation.name)
            NavigationView {
                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        NavigationLink{
                            Text(location.name)
                        } label: {
                            Circle()
                                .stroke(.black, lineWidth: 12)
                                .frame(width: 12, height: 12)
                                .onTapGesture {
                                    showSheet.toggle()
                                    selectedLocation = location
                                }
                        }
                    }
                }
            }.frame(width: .infinity, height: 650)
            NavigationStack{

            ScrollView(.horizontal) {
                    HStack {
                        ForEach(locations) { location in
                            Button(location.name){
                                selectedLocation = location
                                mapRegion.center = CLLocationCoordinate2D(
                                latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                            }.buttonStyle(.borderedProminent)
                                .tint(.blue)
                        }
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)).tint(.black)
                }
            }
           
        }.sheet(isPresented: $showSheet){
            DetailsCountry(flag: selectedLocation.flag, description: selectedLocation.description, name: selectedLocation.name)
        }
        
    }
    
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView(selectedLocation: Location(name: "", coordinate: CLLocationCoordinate2D(latitude: 52.3555, longitude: 1.1743), flag: "", description: ""))
        }
    }
}
