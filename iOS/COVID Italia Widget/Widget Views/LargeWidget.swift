//
//  LargeWidget.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 26/12/20.
//

import SwiftUI
import WidgetKit

struct LargeWidget: View {
    
    let data: NationalData
    
    var body: some View {
        VStack {
            // Date
            HStack {
                Text("\(data.update)").font(.largeTitle).fontWeight(.semibold)
                    .padding()
                Spacer()
            }
            
            // Data
            HStack {
                VStack {
                    
                    WidgetLabel(image: "person.3.fill", value: data.totale_positivi, color: .blue)
                    WidgetLabel(image: "plus.circle.fill", value: data.nuovi_positivi, color: .blue)
                    WidgetLabel(image: "plus.slash.minus", value: data.variazione_positivi, color: .purple)
                    WidgetLabel(image: "staroflife.fill", value: data.ospedalizzati, color: .red)
                    WidgetLabel(image: "house.fill", value: data.isolamento, color: .gray)
                    
                }.padding()
                VStack {
                    
                    WidgetLabel(image: "heart.fill", value: data.dimessi_guariti, color: .green)
                    WidgetLabel(image: "xmark.square.fill", value: data.deceduti, color: .red)
                    WidgetLabel(image: "bed.double.fill", value: data.terapia_intensiva, color: .gray)
                    WidgetLabel(image: "eyedropper.full", value: data.tamponi, color: .blue)
                    WidgetLabel(image: "cross.case", value: data.ricoverati_sintomi, color: .gray)
                    
                    
                }.padding()
            }.font(.callout)
        }
    }
}

struct LargeWidget_Previews: PreviewProvider {
    static var previews: some View {
        LargeWidget(data: sample())
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
