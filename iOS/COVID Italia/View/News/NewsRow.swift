//
//  NewsRow.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import SwiftUI

struct NewsRow: View {
    
    let news: News
    
    var body: some View {
        VStack {
            HStack {
                Text(news.title).fontWeight(.semibold).font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 5)
                Spacer()
            }
            HStack {
                Text(news.date).fontWeight(.regular).font(.caption)
                Spacer()
            }
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(news: News(author: "Alessio", title: "Natale in zona rossa: cosa si può fare oggi? Pranzi, spostamenti, seconde case e visite. Le regole del decreto per il 25 dicembre. Per uscire occorre sempre l'autocertificazione", date: "25-12-2020", url: "http://www.governo.it/it/faq-natale"))
    }
}
