//
//  API.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 30/12/20.
//

import Foundation



class API {
    
    // API URLs
    
    private let regionsURL: URL = URL(string: "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-regioni-latest.json")!
    private let nationalURL: URL = URL(string: "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale-latest.json")!
    private let newsURL = URL(string: "https://newsapi.org/v2/top-headlines?" + "q=covid&" + "country=it&" + "apiKey=" + "954521a497c943429c100276965eddd0")!
    private let vaccinesURL = URL(string: "https://raw.githubusercontent.com/italia/covid19-opendata-vaccini/master/dati/anagrafica-vaccini-summary-latest.json")!
    
    func nationalData(completion: @escaping (Result<NationalData, Error>) -> Void ) {
        
        // Retrieve national data
        URLSession.shared.dataTask(with: nationalURL) { data, response, error in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        
                        completion(.success(NationalData(dict: json[0])))
                    }
                } catch {
                    completion(.failure(error))
                }
            } else {
                print("Data not received")
            }
        }.resume()
    }
    
    func regionsData(completion: @escaping (RegionData) -> Void)  {        // Retrieve regions data
        URLSession.shared.dataTask(with: regionsURL) { data, response, error in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        // Update
                        
                        _ = json.map({ completion(RegionData(dict: $0)) })
                        
                    }
                } catch {
                    print("Error")
                    return
                }
            } else {
                print("Data not received")
            }
        }.resume()

    }
    
    
    
    func lastNews(completion: @escaping (News) -> Void) {
        
        var request = URLRequest(url: newsURL)
        request.httpMethod = "GET"

        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data {
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                        let articles = json["articles"] as! [Any]
                        print(articles)
                        
                        _ = articles.map({ completion(News(dict: $0 as! [String:Any])) })
                        
                        
                    } catch {
                        
                    }
                    
                }
        }
        task.resume()
        
    }
    
    func vaccines(completion: @escaping (VaccinesData) -> Void) {
        URLSession.shared.dataTask(with: vaccinesURL) { data, response, error in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        // Update
                        let vacData = json["data"] as! [[String:Any]]
                        
                        _ = vacData.map({ completion(VaccinesData(dict: $0)) })
                        
                    }
                } catch {
                    print("Error")
                    return
                }
            } else {
                print("Data not received")
            }
        }.resume()
    }
    
}

extension API {
    
    func widgetData(completion: ((NationalData) -> Void)? = nil) {
        nationalData() { result in
            switch result {
            
            case .success(let data):
                completion?(data)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}

func getRegionColor(regionName: String, completion: @escaping (String) -> Void) {
    URLSession.shared.dataTask(with: URL(string: "https://raw.githubusercontent.com/imcatta/restrizioni_regionali_covid/main/dataset.json")!) { data, response, error in
        if let data = data {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]] {
                    // Update
                    
                    
                    for region in json {
                        //print("REGIONE: \(region) \n\n")
                        if (region["denominazione_regione"]! == regionName && region["data"]! == "2021-02-27") {
                            completion(region["colore"]!)
                        }
                    }
                    
                }
            } catch {
                print("Error")
                return
            }
        } else {
            print("Data not received")
        }
    }.resume()
}
