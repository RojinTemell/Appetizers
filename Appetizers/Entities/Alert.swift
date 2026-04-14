//
//  Alert.swift
//  Appetizers
//
//  Created by rojin on 11.04.2026.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title :Text
    let message :Text
    let dismissButton :Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid.Please contact support."),
                                       dismissButton:.default(Text("OK")))

    static let invalidResponse = AlertItem(title: Text( "Server Error"),
                                           message: Text("the ser Please try agaan Later or contact support."),
                                           dismissButton: .default(Text("OK")))

    static let invalidURL = AlertItem(title: Text("Sever Error"),
                                      message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                      dismissButton: .default(Text("OK")))

    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet conn"),
                                            dismissButton:.default(Text("OK")))
    static let invalidForm = AlertItem(title: Text("Server Error"),
                                            message: Text("You have to fill all places"),
                                            dismissButton:.default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Server Error"),
                                       message: Text("You have to fill email correctly"),
                                       dismissButton:.default(Text("OK")))

    static let userSaveSuccess = AlertItem(title: Text("Success"),
                                        message: Text("user Save Success"),
                                        dismissButton:.default(Text("OK")))
    static let invalidUserData = AlertItem(title: Text("Server Error"),
                                        message: Text("invalid User Data"),
                                        dismissButton:.default(Text("OK")))
}

