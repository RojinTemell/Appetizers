//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by rojin on 14.04.2026.
//

import SwiftUI
import Combine

final class AccountViewModel : ObservableObject{
    @AppStorage("user") private var userData: Data?
    @Published var user :User = User()
    @Published var alertItem: AlertItem?

    func saveChances() {
        guard isValidForm else {
            return
        }
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    func retrieveUser() {
        guard let userData else { return }

        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }

    }

    var isValidForm :Bool{
        guard !user.name.isEmpty && !user.surname.isEmpty && !user.email.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }

        guard user.email.isValidEmail  else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }


}
