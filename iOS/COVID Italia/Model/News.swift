//
//  News.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import Foundation

struct News: Identifiable, Decodable {
    
    var id = UUID()
    var author: String
    var title: String
    var date: String
    var url: URL
    
    init(author: String, title: String, date: String, url: String) {
        self.author = author
        self.title = title
        self.date = date.replacingOccurrences(of: "T", with: " ")
        self.url = URL(string: url)!
    }
    
    init(dict: [String:Any]) {
        self.author = dict["author"] as? String ?? ""
        self.title = dict["title"] as? String  ?? ""
        self.date = (dict["publishedAt"] as? String ?? "").replacingOccurrences(of: "T", with: " ")
        self.url = URL(string: (dict["url"] as! String).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
    }
    
}
