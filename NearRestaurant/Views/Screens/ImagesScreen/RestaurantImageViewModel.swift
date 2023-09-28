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
    private let restaurantService: RestaurantService?
    private let imageService: ImageService?
    private let handleLogging: Logger?
    private var imageURLs: [String] = []
    
    var categoryId: String?
    var restaurantId: String?
    @Published var isLoading = false
    @Published var images: [UIImage] = []
    
    
    
    init(categoryId: String, restaurantId: String){
        self.categoryId = categoryId
        self.restaurantId = restaurantId
        restaurantService = RestaurantService.instance
        imageService = ImageService(session: URLSession(configuration: .default))
        handleLogging = HandleLogging.instance
        fetchImages()
    }
    
    private func downloadImage(){
        let downloadGroup = DispatchGroup()
        
        print("imageURLs")
        print(imageURLs)
        
        for imageUrl in imageURLs {
            downloadGroup.enter()
            let image = imageService?.fetchImage(url: imageUrl, completion: {
                downloadGroup.leave()
            })
            if let image, let photo = UIImage(data: image) {
                images.append(photo)
            }
        }
        
        downloadGroup.notify(queue: DispatchQueue.main) {
            self.isLoading = false
        }
        
    }
    
    private func fetchImages() {
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
