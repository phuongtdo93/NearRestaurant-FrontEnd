//
//  SignUpViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import Foundation
import Combine

class SignUpViewModel: LoginViewModel {
    @Published var confirmPassword: String = "12345678"
    @Published var isValidConfirmPassword: UserAuthorizationStatus = .new
    @Published var signUpResponse: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let logging = HandleLogging.instance
    
    func checkValidConfirmPassword() {
        $confirmPassword.debounce(for: 1, scheduler: DispatchQueue.main)
            .sink { _ in
                self.isValidConfirmPassword = self.password == self.confirmPassword && self.confirmPassword.count > 0 ? .success : .failed
            }
            .store(in: &cancellables)
    }
    
    override func clearInfo() {
        confirmPassword = ""
        isValidConfirmPassword = .new
        super.clearInfo()
    }
    
    private func signUp() async -> Bool {
        do {
            return try await withCheckedThrowingContinuation { continuation in
                authorizationService.signUp(email: email, password: password) { result in
                    switch result {
                    case .success( _):
                        continuation.resume(returning: true)
                    case .failure(let err):
                        self.logging.error("SignUpViewModel - signUpThenLogin - signUp failed err: \(err)")
                        continuation.resume(throwing: err)
                    }
                }
            }
        } catch {
            return false
        }
    }
    
    @MainActor
    func signUpThenLogin() async {
        let signUpResult = await signUp()
        
        if signUpResult {
            let loginResult = await login()
            if loginResult {
                signUpResponse = true
            } else {
                logging.error("SignUpViewModel - signUpThenLogin - Login failed")
            }
        } else {
            logging.error("SignUpViewModel - signUpThenLogin - Signup failed")
        }
    }
    
}
