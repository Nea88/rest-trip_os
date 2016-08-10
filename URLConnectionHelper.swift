//
//  URLConnectionHelper.swift
//  rest-trip
//
//  Created by Sorochinskiy Dmitriy on 02.08.16.
//  Copyright © 2016 nelex. All rights reserved.
//
//TODO: add rest-trip api for this
import UIKit
import Foundation

class URLConnectionHelper: NSObject {
    let session: NSURLSession
    private override init() {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.timeoutIntervalForRequest = 30.0
        config.timeoutIntervalForResource = 30.0
        
        session = NSURLSession(configuration: config)
        
        super.init()
    }
    
    func request(url: String, complitionHandler:(NSData?, NSError?) -> Void) {
        let task = session.dataTaskWithURL(NSURL(string: url)!) {
            data, response, error in
            if let response = response as? NSHTTPURLResponse {
                print("status code: \(response.statusCode)")
            }
            if error != nil {
                print("error ->\(error?.localizedDescription)")
                complitionHandler(data, error)
            } else {
                print("got data ->\(data)")
                complitionHandler(data, error)
            }
        }
        
        task.resume()
    }
}
