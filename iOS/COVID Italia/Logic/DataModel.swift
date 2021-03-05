//
//  DataModel.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import Foundation

class DataModel: ObservableObject {
    
    // MARK: - Attributes
    
    let api = API()
    
    @Published var nationalData: NationalData? = nil
    @Published var regionsData: [RegionData] = []
    @Published var trend: [NationalData] = []
    @Published var vaccines: [VaccinesData] = []
    
    init() {
        loadNationalData()
        loadRegionsData()
        loadVaccinesData()
    }
    
    // MARK: - API
    
    func loadNationalData() {
        
        // Call API
        api.nationalData() { result in
            
            switch result {
            
            
            case .success(let data):
                DispatchQueue.main.async {
                    self.nationalData = data
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadRegionsData() {
        // Call API
        api.regionsData() { region in
            DispatchQueue.main.async {
                self.regionsData.append(region)
            }
        }
    }
    
    
    func loadVaccinesData() {
        api.vaccines { data in
            DispatchQueue.main.async {
                self.vaccines.append(data)
            }
        }
    }
    

}


