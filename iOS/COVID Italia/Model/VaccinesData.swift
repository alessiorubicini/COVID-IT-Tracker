//
//  Vaccines.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 06/01/21.
//

import Foundation

struct VaccinesData: Identifiable {
    
    let id: UUID
    var lastUpdate: String
    
    var fasciaAnagrafica: String
    var operatoriSocioSanitari: Int
    var personaleNonSanitario: Int
    var personaleRSA: Int
    var totale: Int
    
    init(dict: [String:Any]) {
        id = UUID()
        lastUpdate = (dict["ultimo_aggiornamento"]! as! String).replacingOccurrences(of: "T", with: "  ")
        fasciaAnagrafica = (dict["fascia_anagrafica"]! as! String)
        
        operatoriSocioSanitari = dict["categoria_operatori_sanitari_sociosanitari"]! as! Int
        personaleNonSanitario = dict["categoria_personale_non_sanitario"]! as! Int
        personaleRSA = dict["categoria_ospiti_rsa"]! as! Int
        totale = dict["totale"]! as! Int
    }
    
}

extension VaccinesData {
    
    static let mock = VaccinesData(dict: ["index":0,
                                          "fascia_anagrafica":"16-19",
                                          "totale":2814,
                                          "sesso_maschile":1069,
                                          "sesso_femminile":1745,
                                          "categoria_operatori_sanitari_sociosanitari":1895,
                                          "categoria_personale_non_sanitario":797,
                                          "categoria_ospiti_rsa":122,
                                          "ultimo_aggiornamento":"2021-01-15T00:00:00.000Z"])
    
}
