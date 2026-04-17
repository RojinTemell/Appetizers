//
//  AccountView.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

struct AccountView: View {
    @State private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField :FormTextField?

    enum FormTextField{
        case name,surname,mail
    }
    var body: some View {
        @Bindable var viewModel = viewModel
        NavigationView{
            Form{
                Section("Peronal Info"){
                    TextField("Name", text: $viewModel.user.name,)
                        .focused($focusedTextField,equals: .name)
                        .onSubmit { focusedTextField = .surname }
                        .submitLabel(.next)
                    TextField("Surname", text: $viewModel.user.surname,)
                        .focused($focusedTextField,equals: .surname)
                        .onSubmit { focusedTextField = .mail }
                        .submitLabel(.next)

                    TextField("Mail", text: $viewModel.user.email,)
                        .focused($focusedTextField,equals: .mail)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
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
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Button("Dismiss"){
                            focusedTextField = nil
                        }
                    }
                }
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
