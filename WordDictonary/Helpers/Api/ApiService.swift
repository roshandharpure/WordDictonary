//
//  ApiService.swift
//  WordDictonary
//
//  Created by 1979876 on 02/08/23.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func getRequest<T:Codable>(urlString: String, type: T.Type, completionHandler: @escaping (T) -> Void, errorHandler: @escaping (String) -> Void) {
        
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString
        
        guard let url = URL.init(string: urlString) else {
            errorHandler(ErrorMessage.invaildRequest)
            return
        }
        
        let urlRequest = URLRequest.init(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200  else {
                errorHandler(ErrorMessage.somethingWentWrong)
                return
            }
            
            guard let data, error == nil else {
                errorHandler(ErrorMessage.noResultsFound)
                return
            }
            
            guard let responseData = try? JSONDecoder().decode(T.self, from: data) else {
                errorHandler(ErrorMessage.somethingWentWrong)
                return
            }
            
            completionHandler(responseData)
        }
        
        task.resume()
    }
}
