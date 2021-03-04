//
//  MediumWidgetView.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 26/12/20.
//

import SwiftUI
import WidgetKit

struct MediumWidget: View {
    
    let data: NationalData
    
    var body: some View {
        HStack {
            VStack {
                
                WidgetLabel(image: "person.3.fill", value: data.totale_positivi, color: .blue)
                WidgetLabel(image: "plus.circle.fill", value: data.nuovi_positivi, color: .blue)
                WidgetLabel(image: "plus.slash.minus", value: data.variazione_positivi, color: .purple)
                
            }.padding()
            VStack {
                
                WidgetLabel(image: "heart.fill", value: data.dimessi_guariti, color: .green)
                WidgetLabel(image: "xmark.square.fill", value: data.deceduti, color: .red)
                WidgetLabel(image: "bed.double.fill", value: data.terapia_intensiva, color: .gray)
                
                
            }.padding()
        }.font(.callout)
    }
}

struct WidgetLabel: View {
    
    let image: String
    let value: Int
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: image).foregroundColor(color)
            Text(formatter.string(for: value)!)
            Spacer()
        }.padding(.vertical, 5)
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidget(data: sample())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
