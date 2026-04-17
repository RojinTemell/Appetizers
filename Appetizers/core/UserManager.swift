//
//  UserManager.swift
//  Appetizers
//
//  Created by rojin on 17.04.2026.
//

import SwiftUI

final class UserManager{
    private let key = "user"

    func save(user:User)throws{
        let data = try JSONEncoder().encode(user)
        UserDefaults.standard.set(data, forKey: key)
    }

    func retrieve() throws -> User?{
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil}
        return try JSONDecoder().decode(User.self, from: data)
    }
}
