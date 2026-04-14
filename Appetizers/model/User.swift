////
////  User.swift
////  Appetizers
////
////  Created by rojin on 14.04.2026.
////

import SwiftUI

struct User : Codable {
     var name                   = ""
     var surname                = ""
     var email                  = ""
     var date                   = Date()
     var notifyMeAbout          = NotifyEnum.directMessages
     var playNotificationSounds = false

}
