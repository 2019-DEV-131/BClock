//
//  FiveHoursTests.swift
//  BerlinClockTests
//
//  Created by 2019 DEV 191 on 13/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest

class FiveHoursTests: XCTestCase {

    func testMidnight() {
        
        var components = DateComponents()
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        let expected =  [BClock.State.O, .O, .O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveHours
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_23_59_59() {
        
        var components = DateComponents()
        components.hour = 23
        components.minute = 59
        components.second = 59
        
        let expected =  [BClock.State.R, .R, .R, .R]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveHours
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_02_04_00() {
        
        var components = DateComponents()
        components.hour = 02
        components.minute = 04
        components.second = 00
        
        let expected = [BClock.State.O, .O, .O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveHours
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_08_23_00() {
        
        var components = DateComponents()
        components.hour = 08
        components.minute = 23
        components.second = 00
        
        let expected = [BClock.State.R, .O, .O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveHours
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_16_35_00() {
        
        var components = DateComponents()
        components.hour = 16
        components.minute = 35
        components.second = 00
        
        let expected = [BClock.State.R, .R, .R, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveHours
        
        XCTAssertEqual(result, expected)
        
    }

}
