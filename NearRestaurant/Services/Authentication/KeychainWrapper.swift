//
//  KeychainWrapper.swift
//  NearRestaurant
//
//  Created by Salmdo on 11/20/23.
//

import Foundation

enum KeychainErrorType: Error {
  case badData
  case servicesError
  case itemNotFound
  case unableToConvertToString
}
protocol KeychainWrapperProtocol {
    func storeUserAuthenticateFor(account: String, token: String) throws
    
    func getUserAuthenticateFor(account: String) throws -> String
}

struct KeychainWrapper: KeychainWrapperProtocol {
    private let logging = HandleLogging.instance
    
    func storeUserAuthenticateFor(account: String, token: String) throws {
        guard let tokenData = token.data(using: .utf8) else {
            logging.error("KeychainWrapper - storeUserInformation - cannot convert token to data")
            throw KeychainErrorType.badData
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,  //The user name
            kSecValueData as String: tokenData      //The password data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        switch status {
        case errSecSuccess:
            break
        default:
            throw KeychainErrorType.servicesError
        }
    }
    
    func getUserAuthenticateFor(account: String) throws -> String {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecMatchLimitOne as String: kSecMatchLimitOne, // expect a single item as a search result
            kSecReturnAttributes as String: true, //return all attributes for the found value.
            kSecReturnData as String: true //return all data for the found value.
        ]
        
        var item: CFTypeRef?
        
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status != errSecItemNotFound  else {
            throw KeychainErrorType.itemNotFound
        }
        
        guard status == errSecSuccess else {
            throw KeychainErrorType.servicesError
        }
        
        guard let existingItem = item as? [String: Any],
              let valueData = existingItem[kSecValueData as String] as? Data,
              let value = String(data: valueData, encoding: .utf8)
        else {
            throw KeychainErrorType.unableToConvertToString
        }
        return value
    }
    
    func updateUserAuthenticationFor(account: String, token: String) throws {
        guard let tokenData = token.data(using: .utf8) else {
            logging.error("KeychainWrapper - updateUserAuthenticationFor - cannot convert token to data")
            return
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account
        ]
        
        let attributes: [String: Any] = [kSecValueData as String: tokenData]
        
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        guard status != errSecItemNotFound else {
            throw KeychainErrorType.itemNotFound
        }
        guard status == errSecSuccess else {
            throw KeychainErrorType.servicesError
        }
    }
    
    func deleteUserAuthencationFor(account: String) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account
            ]
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainErrorType.servicesError
        }
        
    }
}
