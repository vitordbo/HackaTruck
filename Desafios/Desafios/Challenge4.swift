//
//  Challenge4.swift
//  Desafios
//
//  Created by Student on 10/10/23.
//

import SwiftUI

struct Challenge4: View {
    @State private var height: Double?
    @State private var weight: Double?
    @State private var result: String = "Normal"
    @State private var color: String = "baixoPeso"
    @State private var imc: Double = 0

    
    func calculateIMC(height: Double, weight: Double) -> Double {
        imc = Double(weight) / (Double(height * height) / 10000)
        
        if(imc < 18.5){ // menor que 18.5
            result = "Baixo Peso"
            color = "baixoPeso"
        } else if (imc > 18.5 && imc < 24.99){
            result = "Normal"
            color = "normal"
        } else if (imc > 25.0 && imc < 29.99){
            result = "Sobrepeso"
            color = "sobrepeso"
        }else if (imc > 30.0){
            result = "Obesidade"
            color = "obesidade"
        }
        return imc
    }

    var body: some View {
        ZStack{
            Color(color).ignoresSafeArea()
            VStack{
                // text
                Text("Calculadora de IMC").font(.largeTitle).bold().foregroundColor(.black).frame(alignment: .top)
                // age
                TextField("Digite sua altura", value: $height, format: .number).multilineTextAlignment(.center).scaledToFit().font(.title2).background(Rectangle().fill(Color.white)).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                // weight
                TextField("Digite seu peso", value: $weight, format: .number).multilineTextAlignment(.center).scaledToFit().font(.title2).background(Rectangle().fill(Color.white)).padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                // calculate
                Button("Calcular") {
                    _ = calculateIMC(height: height!, weight: weight!)
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)).buttonStyle(.borderedProminent).tint(.blue)
                Spacer()
                // center text
                Text(result).font(.largeTitle).bold().foregroundColor(.white).frame(alignment: .center)
                Spacer()
                // image
                VStack{
                    Image("tabela-IMC").resizable().scaledToFit().frame(alignment: .bottom)}
            }
        }
    }
}


struct Challenge4_Previews: PreviewProvider {
    static var previews: some View {
        Challenge4()
    }
}
