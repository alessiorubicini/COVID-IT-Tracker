//
//  Row.swift
//  COVID Italia
//
//  Created by Alessio Rubicini on 25/12/20.
//

import SwiftUI

struct InfoRow: View {
    let title: String
    let string: String?
    let number: Int?
    let color: Color
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if string != nil {
                Text(string!).foregroundColor(color)
                
            } else {
                Text(formatter.string(for: number)!)
                    .foregroundColor(color)
                    .fontWeight(title == "Casi totali" ? .semibold : .regular)
            }
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(title: "Guariti", string: nil, number: 1300000, color: .green)
            .previewLayout(.sizeThatFits)
    }
}
