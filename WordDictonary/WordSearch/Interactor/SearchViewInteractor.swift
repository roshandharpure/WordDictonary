//
//  SearchViewInteractor.swift
//  WordDictonary
//
//  Created by 1979876 on 02/08/23.
//

import UIKit

public protocol SearchViewInteracting: AnyObject {
    func getWordMeaning(with searchText: String)
}

final class SearchViewInteractor {
    weak var presenter: SearchViewPresentable?
    var searchResults: SearchResultModel?
}

extension SearchViewInteractor: SearchViewInteracting {

    func getWordMeaning(with searchText: String) {
        let urlString = ApiUrl.wordSearch + searchText
        
        APIService.shared.getRequest(urlString: urlString, type: SearchResults.self) { [weak self] (results) in
            guard  let weakSelf = self else {
                return
            }
            
            guard  results.count != 0 else {
                weakSelf.presenter?.updateWithError(ErrorMessage.noResultsFound)
                return
            }
            
            weakSelf.searchResults = results[0]
            weakSelf.presenter?.updateWithSearchResults(weakSelf.searchResults!)
        } errorHandler: { [weak self] (errorMessage) in
            self?.presenter?.updateWithError(errorMessage)
        }
    }
}



//let url = URL(string: ApiUrl.wordSearch + searchText)!
//       let urlRequest = URLRequest(url: url)
//
//       //        let url = URL(string: ApiUrl.wordSearch)!
//       //        var urlComponents = URLComponents.init(string: ApiUrl.wordSearch)!
//       //        urlComponents.queryItems = [
//       //            URLQueryItem.init(name: "sf", value: "HMM"),
//       //            URLQueryItem.init(name: "lf", value: "")
//       //        ]
//       //        var urlRequest = URLRequest(url: urlComponents.url!)
//
//
//       URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in
//           if let error = error {
//               self?.presenter?.updateWithError(error.localizedDescription)
//               print(error.localizedDescription.description)
//           } else if
//               let data = data,
//               let response = urlResponse as? HTTPURLResponse,
//               response.statusCode == 200 {
//               let string = String(data: data, encoding: .utf8)
//               print(string)
//               let jsonDecoder = JSONDecoder()
//               let searchResults = try? jsonDecoder.decode(SearchResults.self, from: data)
//
//               if let results = searchResults, results.count != 0 {
//                   self?.presenter?.updateWithSearchResults(results[0])
//               } else {
//                   self?.presenter?.updateWithError(ErrorMessage.noResultsFound)
//               }
//           }
//           else {
//               self?.presenter?.updateWithError(ErrorMessage.noResultsFound)
//           }
//       }.resume()
