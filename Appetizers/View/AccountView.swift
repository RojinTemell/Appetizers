//
//  AccountView.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()

        var body: some View {
        NavigationView{
            Form{
                Section("Peronal Info"){
                    TextField("Name", text: $viewModel.user.name,)
                    TextField("Surname", text: $viewModel.user.surname,)
                    TextField("Mail", text: $viewModel.user.email,)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday",selection: $viewModel.user.date, displayedComponents: .date)

                }
                Section("Notifications"){
                    Picker("Notify Me About",selection: $viewModel.user.notifyMeAbout){
                        Text("Direct Messages").tag(NotifyEnum.directMessages)
                        Text("Mentions").tag(NotifyEnum.mentions)
                        Text("Anything").tag(NotifyEnum.anything)
                    }
                    Toggle("Play notification sounds", isOn: $viewModel.user.playNotificationSounds)
                    Button("Save Changes", action: {
                        viewModel.saveChances()
                    }).foregroundColor(.primaryButton).bold()
                }.toggleStyle(SwitchToggleStyle(tint: .primaryButton))
            }.navigationTitle("Account")
        }.task{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){ alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)

        }
    }
}

#Preview {
    AccountView()
}
