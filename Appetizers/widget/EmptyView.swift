//
//  EmptyView.swift
//  Appetizers
//
//  Created by rojin on 15.04.2026.
//

import SwiftUI

struct EmptyView: View {
    let imageName: String
    let message: String

    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()

            }
        }.offset(y: -50)
    }
}

#Preview {
    EmptyView(imageName: "robot", message: "This is our test message.\nI'm making it a little long for testing.")
}
