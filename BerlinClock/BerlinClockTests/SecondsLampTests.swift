//
//  SecondsLampTests.swift
//  BerlinClockTests
//
//  Created by 2019 DEV 191 on 13/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest

class SecondsLampTests: XCTestCase {

    func testMidnight() {
        
        var components = DateComponents()
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        let expected = [BClock.State.Y]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).seconds
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_23_59_59() {
        
        var components = DateComponents()
        components.hour = 23
        components.minute = 59
        components.second = 59
        
        let expected = [BClock.State.O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).seconds
        
        XCTAssertEqual(result, expected)
        
    }

}
