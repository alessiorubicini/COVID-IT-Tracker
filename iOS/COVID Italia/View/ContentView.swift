//
//  ContentView.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var dataModel = DataModel()
    
    var body: some View {
        TabView {
            Overview(data: $dataModel.nationalData)
                .tabItem {
                    Text("Ultimi dati")
                    Image(systemName: "list.bullet.below.rectangle")
                }
            
            RegionsView(regionsData: dataModel.regionsData)
                .tabItem {
                    Text("Regioni")
                    Image(systemName: "map.fill")
                }
            
            VaccinesView(vaccinesData: dataModel.vaccines)
                .tabItem {
                    Text("Vaccini")
                    Image(systemName: "eyedropper")
                }
            
            
        }.onAppear {
            //dataModel.loadNationalData()
            //dataModel.loadRegionsData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
