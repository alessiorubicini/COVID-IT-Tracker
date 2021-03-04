//
//  VaccinesDataCard.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 16/01/21.
//

import SwiftUI
import VisualEffects

struct VaccinesDataCard: View {
    
    let data: VaccinesData
    
    var body: some View {
        VisualEffectBlur(blurStyle: .regular, vibrancyStyle: .fill) {
            VStack {
                
                // Card header
                HStack {
                    Text(data.fasciaAnagrafica).font(.largeTitle).fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image("primula").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                        
                    
                }.padding()
                
                // Data
                
                Group {
                    InfoRow(title: "Operatori socio-sanitari", string: nil, number: data.operatoriSocioSanitari, color: .blue)
                    InfoRow(title: "Personale non sanitario", string: nil, number: data.personaleNonSanitario, color: .blue)
                    InfoRow(title: "Personale RSA", string: nil, number: data.personaleRSA, color: .blue)
                    InfoRow(title: "Totale vaccinati", string: nil, number: data.totale, color: .blue)
                }.padding(.vertical, 5).padding(.horizontal, 10)
                
            }
        }
        .frame(height: 300)
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding()
    }
}

struct VaccinesDataCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Image("vaccines-bg").resizable().edgesIgnoringSafeArea(.all)
            
            VaccinesDataCard(data: VaccinesData.mock)
        }
    }
}
