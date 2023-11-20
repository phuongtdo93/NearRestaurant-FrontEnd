//
//  ExtensionString.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import Foundation


extension String {
    func idValidLength(min: Int, max: Int) -> Bool {
        self.count >= min && self.count <= max
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        return self.range(of: emailRegEx, options: .regularExpression) != nil
    }
}
