//
//  CustomModifier.swift
//  Appetizers
//
//  Created by rojin on 15.04.2026.
//

import SwiftUI

struct StandarButtonStyle :ViewModifier{

    func body(content:Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.primaryButton)
            .controlSize(.large)

    }

}
extension View {
    func standarButtonStyle() -> some View {
        self.modifier(StandarButtonStyle())
    }
}
