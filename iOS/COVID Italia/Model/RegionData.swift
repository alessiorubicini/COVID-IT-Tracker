//
//  NationalData.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import Foundation
import SwiftUI

struct RegionData: Identifiable {
    
    var id: Int
    var update: String
    var nomeRegione: String
    
    var totale_positivi: Int
    var nuovi_positivi: Int
    var variazione_positivi: Int
    var dimessi_guariti: Int
    var deceduti: Int
    var terapia_intensiva: Int
    var ospedalizzati: Int
    var tamponi: Int
    var isolamento: Int
    var ricoverati_sintomi: Int
    var casi_totali: Int
    
    init(dict: [String:Any]) {
        id = dict["codice_regione"] as! Int
        
        update = (dict["data"] as! String).replacingOccurrences(of: "T", with: "  ")
        nomeRegione = dict["denominazione_regione"] as! String
        
        totale_positivi = dict["totale_positivi"]! as! Int
        nuovi_positivi = dict["nuovi_positivi"]! as! Int
        variazione_positivi = dict["variazione_totale_positivi"]! as! Int
        dimessi_guariti = dict["dimessi_guariti"]! as! Int
        deceduti = dict["deceduti"]! as! Int
        terapia_intensiva = dict["terapia_intensiva"]! as! Int
        ospedalizzati = dict["totale_ospedalizzati"]! as! Int
        tamponi = dict["tamponi"]! as! Int
        isolamento = dict["isolamento_domiciliare"]! as! Int
        ricoverati_sintomi = dict["ricoverati_con_sintomi"]! as! Int
        casi_totali = dict["totale_casi"]! as! Int
    }
    
    
}

