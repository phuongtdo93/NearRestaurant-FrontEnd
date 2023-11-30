//
//  BiometricAuthentication.swift
//  NearRestaurant
//
//  Created by Salmdo on 11/21/23.
//

import Foundation
import LocalAuthentication

@MainActor
class BiometricAuthentication: ObservableObject {
    @Published var unlockApp = false
    @Published var showLogin = false
    
    private let logging = HandleLogging.instance
    private let context = LAContext()
    
    func tryBiometricAuthentication(){
        //The object context to get the biometrics from the user interaction and communicates with the Secure Enclave on the device
        var err: NSError?
        
        //If the biometric authentication is available. Because some divices do not have authentication or user may not set it up
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &err){
            //The reason need to be provided - why the application need to use the authentication
            let reason = "Authenticate to unlock the application"
            
            //Perform the authentication request
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { authenticated, error in
                if authenticated {
                    self.unlockApp = true
                } else {
                    if let errorString = error?.localizedDescription {
                        self.logging.error("BiometricAuthentication - tryBiometricAuthentication - Error in biometric policy evaluation: \(errorString)")
                    }
                    self.showLogin = true
                }
            }
        }
        //If the biometric authentication is no available
        else {
            if let errorString = err?.localizedDescription {
                self.logging.error(("BiometricAuthentication - tryBiometricAuthentication - Error in biometric policy evaluation: \(errorString)"))
            }
            showLogin = true
        }
    }
    
    func getBiometricType() -> String {
        _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        
        switch context.biometryType {
        case .faceID:
            return "faceid"
        case .touchID:
            return "touchid" //In iOS 14 and later
        case .none:
            return "lock"
        @unknown default:
            return "lock"
        }
    }
}
