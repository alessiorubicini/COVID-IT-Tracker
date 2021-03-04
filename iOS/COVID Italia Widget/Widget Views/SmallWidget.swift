//
//  SmallWidgetView.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 26/12/20.
//

import SwiftUI
import WidgetKit

struct SmallWidget: View {
    
    let data: NationalData
    
    var body: some View {
        VStack {
            // Data
            Group {
                
                WidgetLabel(image: "person.3.fill", value: data.totale_positivi, color: .blue)
                WidgetLabel(image: "heart.fill", value: data.dimessi_guariti, color: .green)
                WidgetLabel(image: "xmark.square.fill", value: data.deceduti, color: .red)
            }

        }.padding()
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidget(data: sample())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
