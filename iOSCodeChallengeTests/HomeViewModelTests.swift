//
//  HomeViewModelTests.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 26/07/2022.
//

import XCTest
@testable import iOSCodeChallenge

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewmodel!

    override func setUp() {
        viewModel = .init()
    }
    
    func testNasaDataSuccessToTrue() {
        viewModel.fetchNasaDataCollection()
        
        XCTAssertTrue(viewModel.nasaData != nil)
    }
}
