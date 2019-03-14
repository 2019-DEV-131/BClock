//
//  ClockTests.swift
//  BerlinClockTests
//
//  Created by 2019 DEV 191 on 14/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest

class ClockTests: XCTestCase {
    
    var systemUnderTest: BClock!
    
    override func setUp() {
        systemUnderTest = BClock()
    }
    
    override func tearDown() {
        systemUnderTest = nil
    }

    func testMidnight() {
        
        var components = DateComponents()
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        // Y_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O
        let expected = [BClock.LampState.R,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        systemUnderTest.date = date
        let result = systemUnderTest.time
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_23_59_59() {
        
        var components = DateComponents()
        components.hour = 23
        components.minute = 59
        components.second = 59
        
        let expected = [BClock.LampState.O,.R,.R,.R,.R,.R,.R,.R,.O,.Y,.Y,.R,.Y,.Y,.R,.Y,.Y,.R,.Y,.Y,.Y,.Y,.Y,.Y]
        
        let date = Calendar.current.date(from: components)!
        
        systemUnderTest.date = date
        let result = systemUnderTest.time
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_16_50_06() {
        
        var components = DateComponents()
        components.hour = 16
        components.minute = 50
        components.second = 06
        
        let expected = [BClock.LampState.R,.R,.R,.R,.O,.R,.O,.O,.O,.Y,.Y,.R,.Y,.Y,.R,.Y,.Y,.R,.Y,.O,.O,.O,.O,.O]
        
        let date = Calendar.current.date(from: components)!
        
        systemUnderTest.date = date
        let result = systemUnderTest.time
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_11_37_01() {
        
        var components = DateComponents()
        components.hour = 11
        components.minute = 37
        components.second = 01
        
        let expected = [BClock.LampState.O,.R,.R,.O,.O,.R,.O,.O,.O,.Y,.Y,.R,.Y,.Y,.R,.Y,.O,.O,.O,.O,.Y,.Y,.O,.O]
        
        let date = Calendar.current.date(from: components)!
        
        systemUnderTest.date = date
        let result = systemUnderTest.time
        
        XCTAssertEqual(result, expected)
        
    }

}
