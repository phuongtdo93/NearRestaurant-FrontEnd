//
//  UserStatusValidation.swift
//  NearRestaurant
//
//  Created by Salmdo on 11/21/23.
//

import Foundation

protocol UserStatusValidationProtocol {
    func validateUserLogging() -> String
    func saveUserToken(token: String)
}

struct UserStatusValidation: UserStatusValidationProtocol {
    
    private let keychainWrapper = KeychainWrapper()
    
    func saveUserToken(token: String) {
        try? keychainWrapper.storeUserAuthenticateFor(account: "KWRestaurantNearMe", token: token)
    }
    
    
    func validateUserLogging() -> String {
        
        if let token = try? keychainWrapper.getUserAuthenticateFor(account: "KWRestaurantNearMe") {
            return token
        }
        return ""
    }
}
