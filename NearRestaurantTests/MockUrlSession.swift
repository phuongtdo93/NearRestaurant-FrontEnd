//
//  MockUrlSession.swift
//  NearRestaurantTests
//
//  Created by Salmdo on 7/16/23.
//

import Foundation


class MockUrlSession: URLProtocol {
    static var responseData: Data?
    static var responseError: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockUrlSession.responseError {
            self.client?.urlProtocol(self, didFailWithError: error)
//            self.client?.urlProtocol(self, didLoad: MockUrlSession.responseData ?? Data())
        } else {
            self.client?.urlProtocol(self, didLoad: MockUrlSession.responseData ?? Data())
            
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
    
}
