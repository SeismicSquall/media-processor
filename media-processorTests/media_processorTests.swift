//
//  SampleCodeTests.swift
//  SampleCodeTests
//
//  Created by Alex Maslov on 2018-08-12.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import XCTest
import Foundation
//@testable import media_processor

enum MockRequest:String,Request {
    case mediaList = "content.json"
    
    var url: URL? {
        return Bundle.main.url(forResource: rawValue, withExtension: "")
    }
}



class media_processorTests: XCTestCase {
    
    var networkService = MediaService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testService() {
        let _ = networkService.get(request: MockRequest.mediaList) { (result:Result<[Image]>) in
            switch result {
            case .success(let images):
                XCTAssert(images.count > 0)
            case .error:
                XCTAssert(false)
            }
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
