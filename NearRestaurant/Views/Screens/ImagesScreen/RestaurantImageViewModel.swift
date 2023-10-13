//
//  RestaurantImageViewModel.swift
//  NearRestaurant
//
//  Created by Salmdo on 9/27/23.
//

import Foundation
import OSLog
import SwiftUI

class RestaurantImageViewModel: ObservableObject {
    
    private let label = "com.salmdo.nearRestaurant.images"
    private let restaurantService: RestaurantServiceProtocol?
    private let imageService: ImageService?
    private let handleLogging: Logger?
    private var imageURLs: [String] = []
    let downloadGroup = DispatchGroup()
    
    var categoryId: String?
    var restaurantId: String?
    @Published var isLoading = false
    @Published var images: [UIImage] = []
    
    
    
    init(categoryId: String, restaurantId: String, restaurantService: RestaurantServiceProtocol){
        self.categoryId = categoryId
        self.restaurantId = restaurantId
        self.restaurantService = restaurantService
        imageService = ImageService(session: URLSession(configuration: .default))
        handleLogging = HandleLogging.instance
    }
    
    private func downloadImage(){

        
        for imageUrl in imageURLs {
            self.downloadGroup.enter()
           imageService?.fetchImage(url: imageUrl, completion: { data in
               self.downloadGroup.leave()
               if let data , let photo = UIImage(data: data) {
                   self.images.append(photo)
               }
            })
        }
        
        downloadGroup.notify(queue: DispatchQueue.main) {
            self.isLoading = false
            print("imageURLs")
            print(self.images)
        }
        
    }
    
    func fetchImages() {
        guard let categoryId, let restaurantId else { return }
        
        restaurantService?.fetchRestaurantImages(categoryId: categoryId, restaurantId: restaurantId, completion: { result in
            switch result {
            case .success(let res):
                self.imageURLs = res
                self.downloadImage()
            case .failure(let err):
                self.handleLogging?.error("fetchImages failed: \(err)")
            }
        })
    }
    
    func fetchRestaurantImages() async -> [String] {
        guard let categoryId, let restaurantId else { return [] }
        
        return await withCheckedContinuation({continuation in
            restaurantService?.fetchRestaurantImages(categoryId: categoryId, restaurantId: restaurantId) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let res):
                        continuation.resume(returning: res)
                    case .failure(let err):
                        self.handleLogging?.error("fetchImages failed: \(err)")
                    }
                }
            }
        })
        
    }
}
