//
//  VaccinesView.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 06/01/21.
//

import SwiftUI

struct VaccinesView: View {
    
    let vaccinesData: [VaccinesData]
    
    var body: some View {
        NavigationView {
            
            List {
                
                HStack {
                    Text("Vaccinati totali")
                    Spacer()
                    
                }
                
                ForEach(vaccinesData) { data in
                    
                    Section(header: Text(data.fasciaAnagrafica + " anni").font(.title3).fontWeight(.semibold).textCase(.lowercase)) {
                        InfoRow(title: "Operatori socio-sanitari", string: nil, number: data.operatoriSocioSanitari, color: .blue)
                        InfoRow(title: "Personale non sanitario", string: nil, number: data.personaleNonSanitario, color: .blue)
                        InfoRow(title: "Personale RSA", string: nil, number: data.personaleRSA, color: .blue)
                        InfoRow(title: "Totale vaccinati", string: nil, number: data.totale, color: .blue)
                    }
                    
                    /*
                    DisclosureGroup("Fascia anagrafica \(data.fasciaAnagrafica)") {
                            InfoRow(title: "Operatori socio-sanitari", string: nil, number: data.operatoriSocioSanitari, color: .blue)
                            InfoRow(title: "Personale non sanitario", string: nil, number: data.personaleNonSanitario, color: .blue)
                            InfoRow(title: "Personale RSA", string: nil, number: data.personaleRSA, color: .blue)
                            InfoRow(title: "Totale vaccinati", string: nil, number: data.totale, color: .blue)
                        
                    }*/
                }
                
            }.listStyle(InsetGroupedListStyle())
            
            .navigationTitle("Vaccini")
        }
    }
}

struct VaccinesView_Previews: PreviewProvider {
    static var previews: some View {
        VaccinesView(vaccinesData: [VaccinesData.mock])
    }
}
