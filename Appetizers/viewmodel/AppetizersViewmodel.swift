//
//  AppetizersViewmodel.swift
//  Appetizers
//
//  Created by rojin on 9.04.2026.
//

import Foundation
import Combine

final class AppetizersViewmodel:ObservableObject {

    @Published var appetizers : [Appetizer] = []
    //    let networkManager :NetworkManager = NetworkManager()

    func getAppetizers(){
        NetworkManager.shared.getAppetizers {result in
            switch result{
            case .success(let appetizers):
                self.appetizers = appetizers
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }

}
