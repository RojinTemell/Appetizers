//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by rojin on 14.04.2026.
//

import SwiftUI

@Observable
final class AccountViewModel {
    
    private let userManager = UserManager()
    var user :User = User()
    var alertItem: AlertItem?

    func saveChances() {
        guard isValidForm else {
            return
        }
        do{
            try userManager.save(user: user)
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.invalidUserData
        }}


    func retrieveUser() {
        do {
            if let savedUser = try userManager.retrieve(){
                user = savedUser
            }
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
