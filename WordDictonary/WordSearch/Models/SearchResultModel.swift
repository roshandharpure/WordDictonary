//
//  SearchResultModel.swift
//  WordDictonary
//
//  Created by 1979876 on 02/08/23.
//

import Foundation

struct SearchResultModel: Codable {
    let word: String
    let phonetics: [Phonetic]
    let meanings: [Meaning]
    let license: License
    let sourceUrls: [String]
    
}

struct License: Codable {
    let name: String
    let url: String
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definations: [Defination]
    let synonyms, antonyms: [String]
}

struct Defination: Codable {
    let defination: String
    let synonyms, antonyms: [String]
    let example: String?
}

struct Phonetic: Codable {
    let audio: String
    let sourceURL: String?
    let licence: License?
    let text: String?
}

typealias SearchResults = [SearchResultModel]
