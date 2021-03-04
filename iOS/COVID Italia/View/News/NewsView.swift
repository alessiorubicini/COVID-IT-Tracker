//
//  NewsView.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import SwiftUI

struct NewsView: View {
    
    @Binding var news: [News]
    
    var body: some View {
        NavigationView {
            if news.isEmpty {
                ProgressView()
            } else {
                List {
                    ForEach(news, id: \.id) { news in
                        Link(destination: news.url) {
                            NewsRow(news: news)
                        }
                    }
                }.listStyle(InsetGroupedListStyle())
                .navigationTitle("Notizie")
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(news: .constant([]))
    }
}
