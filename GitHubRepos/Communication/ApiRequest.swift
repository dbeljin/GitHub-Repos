//
//  ApiRequest.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import Foundation
import Alamofire

class ApiRequest {
    
    public static let GET = "GET"
    public static let POST = "POST"
    public static let DELETE = "DELETE"
    public static let PUT = "PUT"
    
    // Currently, no POST request is implemented since it’s not needed yet.
    // In the future, if required, we could either extend this method to support POST requests
    // or create a new one, accepting a generic Codable struct/class and encoding it
    // into the httpBody of a URLRequest.
    public static func request<T: Codable>(fromUrl urlString: String,
                                             httpMethod: String,
                                             outType: T.Type,
                                             _ completion: @escaping ((T?, ErrorMessage?) -> ())) {
        
        guard let url = URL(string: urlString) else {
            completion(nil, ErrorMessage.getDefaultError())
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.timeoutInterval = Constants.timeoutInterval
        AF.request(urlRequest).responseData { response in
            guard let data = response.data, let decodedResponse = data.decode(T.self) else {
                completion(nil, getErrorMessage(from: response))
                return
            }
            completion(decodedResponse, nil)
        }
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
    }
    
    private static func getErrorMessage(from response: AFDataResponse<Data>) -> ErrorMessage? {
        let responseError: String? = response.error?.localizedDescription
        let gitHubError: String? = response.data?.decode(GithubErrorMessage.self)?.message
        let bothErrors = [responseError, gitHubError].compactMap { $0 }.joined(separator: " ")
        
        return ErrorMessage.getDefaultError(with: bothErrors)
    }
}
