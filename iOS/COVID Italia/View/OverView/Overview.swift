//
//  Overview.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import SwiftUI

struct Overview: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var data: NationalData?
    
    var body: some View {
        NavigationView {
            if data == nil {
                ProgressView()
            } else {
                List {
                    Section {
                        InfoRow(title: "Data", string: data!.update, number: nil, color: colorScheme == .light ? .black : .white)
                        HStack {
                            Text("Fonte")
                            Spacer()
                            Link("pcm-dpc/COVID19", destination: URL(string: "https://github.com/pcm-dpc/COVID-19")!)
                        }
                    }
                    
                    Section {
                        Group {
                            InfoRow(title: "Totale positivi", string: nil, number: data!.totale_positivi, color: .blue)
                            InfoRow(title: "Nuovi positivi", string: nil, number: data!.nuovi_positivi, color: .blue)
                            InfoRow(title: "Variazione positivi", string: nil, number: data!.variazione_positivi, color: .purple)
                            InfoRow(title: "Dimessi/Guariti", string: nil, number: data!.dimessi_guariti, color: .green)
                            InfoRow(title: "Deceduti", string: nil, number: data!.deceduti, color: .red)
                        }
                        Group {
                            InfoRow(title: "Terapia intensiva", string: nil, number: data!.nuovi_positivi, color: .orange)
                            InfoRow(title: "Ospedalizzati", string: nil, number: data!.ospedalizzati, color: .red)
                            InfoRow(title: "In isolamento domiciliare", string: nil, number: data!.isolamento, color: .gray)
                            InfoRow(title: "Ricoverati con sintomi", string: nil, number: data!.ricoverati_sintomi, color: .gray)
                            InfoRow(title: "Tamponi", string: nil, number: data!.tamponi, color: .blue)
                            InfoRow(title: "Casi totali", string: nil, number: data!.casi_totali, color: .blue)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Ultimi dati")
            }
        }
    }
    
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview(data: .constant(NationalData(dict: [:])))
    }
}
