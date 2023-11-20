//
//  User.swift
//  NearRestaurant
//
//  Created by Salmdo on 6/30/23.
//

import Foundation

struct UserAuthentication: Codable {
    let email: String
    let password: String
}

struct SignupUser: Decodable {
    let _id: String
}

struct SignupResponse: Decodable {
//    let success: Bool
//    let data: SignupUser

    let id: String?
    let success: Bool?

    private enum CodingKeys: String, CodingKey {
        case data
        case success
        case id = "_id"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        success = try container.decodeIfPresent(Bool.self, forKey: .success)
        id = try dataContainer.decodeIfPresent(String.self, forKey: .id)
    }
    
}

struct LoginResponse: Decodable {
    let token: String
    let success: Bool
    
    private enum UserAuthenticationKeys: String, CodingKey {
        case data
        case success
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserAuthenticationKeys.self)
        success = try container.decodeIfPresent(Bool.self, forKey: .success) ?? false
        
        let data = try container.decodeIfPresent(String.self, forKey: .data)
        token = data ?? ""
    }
}
