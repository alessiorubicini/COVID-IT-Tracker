//
//  COVID_Italia_Widget.swift
//  COVID Italia Widget
//
//  Created by Alessio Rubicini on 26/12/20.
//

import WidgetKit
import SwiftUI

// MARK: - Data widget

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), updates: sample())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), updates:sample())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        // Fetch data
        let api = API()
        
        api.widgetData() { data in
            let entry = SimpleEntry(date: Date(), updates: data)
            let expiryDate = Calendar.current.date(byAdding: .minute, value: 2, to: Date()) ?? Date()
            
            let timeline = Timeline(entries: [entry], policy: .after(expiryDate))
            completion(timeline)
        }

        
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let updates: NationalData
}


struct COVID_Italia_WidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        
        case .systemSmall:
            SmallWidget(data: entry.updates)
        
        case .systemMedium:
            MediumWidget(data: entry.updates)
        
        case .systemLarge:
            LargeWidget(data: entry.updates)
            
        default:
            Text("Widget family not supported")
        }
    }
}

@main
struct COVID_Italia_Widget: Widget {
    let kind: String = "COVID_Italia_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            COVID_Italia_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Dati andamento nazionale")
        .description("Widget per visualizzare rapidamente gli ultimi dati sull'andamento nazionale")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}



// MARK: - Preview

struct COVID_Italia_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            COVID_Italia_WidgetEntryView(entry: SimpleEntry(date: Date(), updates: sample()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            COVID_Italia_WidgetEntryView(entry: SimpleEntry(date: Date(), updates: sample()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}

