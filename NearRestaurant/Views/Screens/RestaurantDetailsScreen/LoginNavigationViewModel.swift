//
//  UserStatusValidationViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 11/20/23.
//

import Foundation


class LoginNavigationViewModel: ObservableObject {
    @Published var loginNavigationLinkActive = false
    @Published var destinateNavigationLinkActive = false

    private let userValidationService: UserStatusValidationProtocol
    init(userStatusValidationService: UserStatusValidationProtocol){
        self.userValidationService = userStatusValidationService
    }
    
    func checkUserStatus(){
        let token = userValidationService.validateUserLogging()
        if token.count == 0 {
            loginNavigationLinkActive = true
        } else {
            destinateNavigationLinkActive = true
        }
    }
}
