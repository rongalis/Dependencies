//
//  ServiceHandler.swift
//  UserApp
//
//  Created by srikanth on 10/31/22.
//

import Foundation
import UIKit

/// Supported HTTP Methods
public enum HttpMethod: String {
    case GET
    case POST
    case PUT
}

public class ServiceHandler: NSObject {
    
    ///
    /// - Parameters:
    ///   - url: API url string to fetch the data
    ///   - method: URLRequest's method
    ///   - body: URLRequest body for POST or PUT api calls
    ///   - completion: Callback method after fetching response data
    public func makeAPIcall(withUrl url: String?, method: HttpMethod?, body: [String:Any]?, completion: @escaping (_ results: Data) -> Void){
       /// Make api call asynchronously on background thread
        ///
        ///
        ///
         let frameworkBundle = Bundle(identifier: "com.rongali.myapp.ServiceKit")
        let storyboard = UIStoryboard(name: "Storyboard", bundle: frameworkBundle)
        print("Changes test - \(storyboard)")
        
    
        DispatchQueue.global().async {
            guard let url = url, let url = URL(string: url) else {
                /// display alert, invalid url
                return
            }

            var request = URLRequest(url: url)
            guard let method = method else {
                /// display alert,  method needed
                return
            }
            
            /// Set method
            request.httpMethod = method.rawValue
            
            /// Set request body only if method is not GET
            if !(method == .GET) {
                if let body = body, let jsonBody = try? JSONSerialization.data(withJSONObject:body) {
                    request.httpBody = jsonBody
                }else {
                    /// Bad request
                }
            }
            
            /// Create data task using URL Session
            let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
                if let data = data {
                    completion(data)
                }else {
                    // display alert, invalid response or error
                }
            })
            task.resume()
        }
    }
    
    
    /// Get image date from the image url
    /// - Parameters:
    ///   - url: url with image extention
    ///   - completion: Callback method after fetching response data
    public func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        /// Make api call asynchronously on background thread
        DispatchQueue.global().async{
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
    }
}
