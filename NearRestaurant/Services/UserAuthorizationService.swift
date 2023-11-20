//
//  UserAuthorizationService.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/25/23.
//

import Foundation

protocol UserAuthorizationProtocol {
    func signUp(email: String, password: String, completion: @escaping((Result<SignupResponse?, ServiceError>) -> Void))
    
    func login(email: String, password: String, completion: @escaping((Result<LoginResponse?, ServiceError>) -> Void))
    
    
}

struct UserAuthorizationService: UserAuthorizationProtocol {
    
    private let signupService = PushServiceNoToken<UserAuthentication, SignupResponse>()
    private let loginService = PushServiceNoToken<UserAuthentication, LoginResponse>()
    
    private init(){ }
    
    static let instance = UserAuthorizationService()
    
    func signUp(email: String, password: String, completion: @escaping((Result<SignupResponse?, ServiceError>) -> Void)) {
        signupService.pushData(
            apiEndpoint: APIEndpoint.signup,
            input: UserAuthentication(email: email, password: password),
            completion: completion)
    }
    
    func login(email: String, password: String, completion: @escaping ((Result<LoginResponse?, ServiceError>) -> Void)) {
        loginService.pushData(apiEndpoint: APIEndpoint.login, input: UserAuthentication(email: email, password: password), completion: completion)
    }
    
    
}

protocol UserStatusValidationProtocol {
    func validateUserLogging() -> String
}

struct UserStatusValidation: UserStatusValidationProtocol {
    
    func validateUserLogging() -> String {
        let kcw = KeychainWrapper()
        if let token = try? kcw.getUserAuthenticateFor(account: "KWRestaurantNearMe") {
            return token
        }
        return ""
    }
}
