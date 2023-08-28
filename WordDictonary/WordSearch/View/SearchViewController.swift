//
//  ViewController.swift
//  WordDictonary
//
//  Created by 1979876 on 02/08/23.
//

import UIKit

protocol SearchViewing: AnyObject {
    func startLoading()
    func stopLoading()
    func updateData(with searchResults:  [Meaning])
    func showError(with message: String)
}

class SearchViewController: UIViewController {
    var presenter: SearchViewPresentable!
    var wordMeaning: [Meaning] = []
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialSetup()
    }
    
    func initialSetup() {
        //Hide activity indicator at launch
        self.stopLoading()
        
        //Initialization
        let interactor = SearchViewInteractor()
        presenter = SearchViewPresenter(searchView: self,
                                        interactor: interactor)
        interactor.presenter = presenter
        
        //Set tableview delegates
        searchResultTableView.dataSource = self
        searchResultTableView.delegate = self
        
        //Set tableview row height
        searchResultTableView.rowHeight = 100
        searchResultTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordMeaning.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResultsCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.SearchResultsCell, for: indexPath) as! SearchResultsCell
        searchResultsCell.setupCell(with: self.wordMeaning[indexPath.row])
        return searchResultsCell
    }
}

extension SearchViewController: SearchViewing {
   
    func startLoading() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    func updateData(with meanings: [Meaning]) {
        self.wordMeaning = meanings
        
        DispatchQueue.main.async {
            self.stopLoading()
            self.searchResultTableView.reloadData()
        }
    }
     
    func showError(with message: String) {
        DispatchQueue.main.async {
            self.stopLoading()
            AlertView().showAlert(message: message, vc: self)
        }
    }
}


extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.startLoading()
        presenter.getSearchResults(with: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
