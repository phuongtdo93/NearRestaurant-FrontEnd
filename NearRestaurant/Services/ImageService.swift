//
//  ImageService.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/27/23.
//

import Foundation

struct ImageService {
    let imageUrl: String = ""
    
    let urlSession: URLSession?
    
    init(session: URLSession) {
        urlSession = session
    }

    func fetchImage(url: String, completion: @escaping(Data?) -> Void) {
        guard let urlFromString = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: urlFromString) { data, res, err in
            let statusCode = (res as? HTTPURLResponse)?.statusCode
            
            DispatchQueue.main.async {
                guard let data, err == nil, statusCode == 200 else {
                    completion(nil)
                    return
                }
                completion(data)
            }
        }.resume()
   
    }
}
