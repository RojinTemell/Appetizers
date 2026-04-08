//
//  AppetizerWidget.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

struct AppetizerWidget: View {
    var appetizer:Appetizer
    var body: some View {
        HStack{
            Image("coreml")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 100)
                .cornerRadius(8)
            VStack(alignment: .leading,spacing: 5){
                Text(appetizer.name).font(.title2).fontWeight(.medium)

                Text("$\(appetizer.price,specifier:"%.2f")").fontWeight(.semibold).foregroundColor(.secondary)
            }
        }.padding(.leading)
    }
}

#Preview {
    AppetizerWidget(appetizer: MockData.sampleAppetizer)
}
