//
//  Constants.swift
//  WordDictonary
//
//  Created by 1979876 on 02/08/23.
//

import Foundation

enum ApiUrl {
   //static let wordSearch = "http://www.nactem.ac.uk/software/acromine/dictionary.py"
    static let wordSearch = "http://api.dictionaryapi.dev/api/v2/entries/en/"
}

enum CellIdentifier {
    static let SearchResultsCell = "SearchResultsCell"
}

enum ErrorMessage {
    static let noInternetConnection = "Not able to connect. Try After Some time"
    static let somethingWentWrong = "Something went wrong, Please try after some time"
    static let noResultsFound = "No Results found"
    static let invaildRequest = "Invalid request"
}
