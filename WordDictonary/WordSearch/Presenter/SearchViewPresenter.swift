//
//  SearchViewPresenter.swift
//  WordDictonary
//
//  Created by 1979876 on 02/08/23.
//

import Foundation

protocol SearchViewPresentable: AnyObject {
    func getSearchResults(with searchText: String)
    func updateWithSearchResults(_ results: SearchResultModel)
    func updateWithError(_ errorMessage: String)
}

final class SearchViewPresenter {
    
    weak var searchView: SearchViewing?
    let interactor: SearchViewInteracting
    
    init(searchView: SearchViewing? , interactor: SearchViewInteracting) {
        self.searchView = searchView
        self.interactor = interactor
    }
}

extension SearchViewPresenter: SearchViewPresentable {
    func updateWithSearchResults(_ results: SearchResultModel) {
        searchView?.updateData(with: results.meanings)
    }
    
    func getSearchResults(with searchText: String) {
        interactor.getWordMeaning(with: searchText)
    }
    
    func updateWithError(_ errorMessage: String) {
        searchView?.showError(with: errorMessage)
    }
}
