//
//  ImageService.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/27/23.
//

import Foundation

struct ImageService {
    let imageUrl: String = ""
    
    var urlSession: URLSession?
    
    init(session: URLSession) {
        urlSession = session
    }

    func fetchImage(url: String, completion: @escaping() -> Void) -> Data {
        //Fetch images
        return Data()
    }
}
