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

    private enum CodingKeys: String, CodingKey {
        case data
        case id = "_id"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        id = try dataContainer.decodeIfPresent(String.self, forKey: .id)
    }
    
}

struct LoginResponse: Decodable {
    let token: String
    
    private enum UserAuthenticationKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserAuthenticationKeys.self)
        
        let data = try container.decodeIfPresent(String.self, forKey: .data)
        token = data ?? ""
    }
}
