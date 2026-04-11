//
//  InstructionsLoader.swift
//  Appetizers
//
//  Created by rojin on 11.04.2026.
//

import SwiftUI
import Combine

final class InstructionsLoader: ObservableObject {
    @Published var instructions: [String] = []

    @MainActor
    func separate(from mealInst: String) async {

        self.instructions = mealInst.components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }
}

