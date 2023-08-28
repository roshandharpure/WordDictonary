//
//  WordDictonaryTests.swift
//  WordDictonaryTests
//
//  Created by 1979876 on 03/08/23.
//

import XCTest

@testable import WordDictonary

final class SearchViewInteractorTests: XCTestCase {
    var interactor: SearchViewInteractor!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = SearchViewInteractor()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
    }

    func testGetWordMeaning() {
        let presenter = SearchViewPresenter.init(searchView: nil, interactor: interactor)
        interactor.presenter = presenter
        
        let expectation = XCTestExpectation.init(description: "fetch word meanings success")
        
        interactor.getWordMeaning(with: "Hi there")
        
        wait(for: [expectation], timeout: 10.0)
        if let meanings = interactor.searchResults?.meanings, meanings.count > 0 {
            expectation.fulfill()
        }
        
        XCTAssertNotNil(interactor.searchResults)
        XCTAssertTrue((interactor.searchResults?.meanings.count ?? 0) > 0)
        
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
