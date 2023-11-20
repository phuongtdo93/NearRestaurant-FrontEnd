//
//  UserAuth.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import Foundation
import SwiftUI
import Combine

enum UserAuthorizationStatus {
    case new,  success, failed
}

class LoginViewModel: ObservableObject {
    @Published var email: String = "thao@gmail.com"
    @Published var password: String = "12345678"
    
    @Published var isValidUserName: UserAuthorizationStatus = .new
    @Published var isValidPassword: UserAuthorizationStatus = .new
    @Published var loginStatus: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    let authorizationService: UserAuthorizationProtocol
    
    init (authorizationService: UserAuthorizationProtocol) {
        self.authorizationService = authorizationService
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
                            self.loginStatus = true
                            print("token: \(res?.token)")
//                            UserDefaults.standard.set(res, forKey: "token")
//                            print("My token is \(UserDefaults.standard.string(forKey: "token"))")
                            continuation.resume(returning: true)
                        case .failure(let err ):
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
