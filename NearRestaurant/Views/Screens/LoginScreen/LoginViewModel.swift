//
//  UserAuth.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import Foundation
import SwiftUI
import Combine

enum UserAuthorizationStatus: Error {
    case new,  success, failed
}

class LoginViewModel: ObservableObject {
    @Published var email: String = "thao@gmail.com"
    @Published var password: String = "12345"
    
    @Published var isValidUserName: UserAuthorizationStatus = .new
    @Published var isValidPassword: UserAuthorizationStatus = .new
    @Published var loginStatus: Bool = false
    @Published var loginResponseMessage = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let logging = HandleLogging.instance
    
    let authorizationService: UserAuthorizationProtocol
    private let userStatusValidation: UserStatusValidationProtocol
    
    init (authorizationService: UserAuthorizationProtocol, userStatusValidation: UserStatusValidationProtocol) {
        self.authorizationService = authorizationService
        self.userStatusValidation = userStatusValidation
    }
    
    func checkValidUserName() {
        $email.debounce(for: 1, scheduler: DispatchQueue.main)
            .sink {  [unowned self] _ in
                if  self.email.idValidLength(min: 8, max: 50) && email.isValidEmail() {
                    self.isValidUserName = .success
                } else {
                    self.isValidUserName = .failed
                }
            }
            .store(in: &cancellables)
        
        
    }
    
    func checkValidPassword () {
        $password.debounce(for: 1, scheduler: DispatchQueue.main)
            .sink { [unowned self] _ in
                self.isValidPassword = password.idValidLength(min: 8, max: 12) ? .success : .failed
            }
            .store(in: &cancellables)
        
    }
    
    func clearInfo(){
        email = ""
        password = ""
        isValidUserName = .new
        isValidPassword = .new
    }
    
    @MainActor
    func login() async -> Bool {
        do {
            return try await withCheckedThrowingContinuation({ continuation in
                authorizationService.login(email: email, password: password) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let res):
                            if let res {
                                if res.success {
                                    self.loginStatus = true
                                    self.userStatusValidation.saveUserToken(token: res.token)
                                    continuation.resume(returning: true)
                                }
                                else {
                                    self.loginResponseMessage = res.token
                                    self.logging.error("Logging failed with message: \(res.token)")
                                    continuation.resume(throwing: UserAuthorizationStatus.failed)
                                }
                            }
                            
                        case .failure(let err ):
                            self.loginResponseMessage = err.localizedDescription
                            continuation.resume(throwing: err)
                        }
                    }
                }
            })
        } catch {
            return false
        }
        
    }
}
