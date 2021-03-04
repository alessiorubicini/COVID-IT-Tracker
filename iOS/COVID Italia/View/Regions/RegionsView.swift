//
//  RegionsView.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import SwiftUI

struct RegionsView: View {
    
    let regionsData: [RegionData]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(regionsData) { region in
                        NavigationLink(destination: RegionView(data: region).navigationTitle(region.nomeRegione)) {
                            //Text(region.nomeRegione)
                            RegionCard(data: region)
                        }
                    }
                }
            }
            //.listStyle(InsetGroupedListStyle())
            .navigationTitle("Regioni")
        }
    }
}

struct RegionsView_Previews: PreviewProvider {
    static var previews: some View {
        RegionsView(regionsData: [])
    }
}
