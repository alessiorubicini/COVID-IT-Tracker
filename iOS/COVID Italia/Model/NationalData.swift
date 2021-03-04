//
//  NationalData.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import Foundation

struct NationalData: Identifiable {
    var id: UUID
    
    var update: String
    
    var totale_positivi: Int
    var nuovi_positivi: Int
    var variazione_positivi: Int
    var dimessi_guariti: Int
    var deceduti: Int
    var terapia_intensiva: Int
    var tamponi: Int
    var ospedalizzati: Int
    var isolamento: Int
    var ricoverati_sintomi: Int
    var casi_totali: Int
    
    init(dict: [String: Any]) {
        id = UUID()
        update = (dict["data"] as! String).replacingOccurrences(of: "T", with: "  ")
        
        totale_positivi = dict["totale_positivi"]! as! Int
        nuovi_positivi = dict["nuovi_positivi"]! as! Int
        variazione_positivi = dict["variazione_totale_positivi"]! as! Int
        dimessi_guariti = dict["dimessi_guariti"]! as! Int
        deceduti = dict["deceduti"]! as! Int
        terapia_intensiva = dict["terapia_intensiva"]! as! Int
        ospedalizzati = dict["totale_ospedalizzati"]! as! Int
        tamponi = dict["tamponi"]! as! Int
        isolamento = dict["isolamento_domiciliare"]! as! Int
        casi_totali = dict["totale_casi"]! as! Int
        ricoverati_sintomi = dict["ricoverati_con_sintomi"]! as! Int
    }
}

var formatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.usesGroupingSeparator = true
    formatter.groupingSeparator = "."
    formatter.groupingSize = 3
    formatter.locale = Locale(identifier: "it_IT")
    return formatter
}


func sample() -> NationalData {
    let dict: [String:Any] = [
        "data":"26/12/2020T17:00:00",
        "totale_positivi":553000,
        "nuovi_positivi":19000,
        "variazione_totale_positivi":-13450,
        "dimessi_guariti": 1300400,
        "isolamento_domiciliare": 8923,
        "ricoverati_con_sintomi": 1234,
        "deceduti":70349,
        "terapia_intensiva": 2487,
        "totale_ospedalizzati": 25843,
        "tamponi": 27543129,
        "totale_casi": 2343129
    ]
    
    return NationalData(dict: dict)
}


