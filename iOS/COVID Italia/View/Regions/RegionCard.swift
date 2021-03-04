//
//  RegionCard.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 28/12/20.
//

import SwiftUI

struct RegionCard: View {
    
    let data: RegionData
    
    var body: some View {
        GroupBox(label: Text(data.nomeRegione).fontWeight(.bold)) {
            HStack {
                
                VStack {
                    Image(systemName: "person.3.fill").foregroundColor(.blue)
                    Text(formatter.string(for: data.totale_positivi)!).fixedSize(horizontal: true, vertical: true)
                }.padding(.horizontal)
                
                Divider()
                
                VStack {
                    Image(systemName: "heart.fill").foregroundColor(.green)
                    Text(formatter.string(for: data.dimessi_guariti)!).fixedSize(horizontal: true, vertical: true)
                }.padding(.horizontal)
                
                Divider()
                
                VStack {
                    Image(systemName: "xmark.square.fill").foregroundColor(.red)
                    Text(formatter.string(for: data.deceduti)!).fixedSize(horizontal: true, vertical: true)
                }.padding(.horizontal)
                
            }
            .padding(.vertical, 3)
        }.cornerRadius(10)
        .padding(.horizontal, 15)
    }
}

struct RegionCard_Previews: PreviewProvider {
    static var previews: some View {
        RegionCard(data: RegionData(dict: [:]))
    }
}
