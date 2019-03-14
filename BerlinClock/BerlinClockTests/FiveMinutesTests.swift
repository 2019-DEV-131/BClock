//
//  FiveMinutesTests.swift
//  BerlinClockTests
//
//  Created by 2019 DEV 191 on 13/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest

class FiveMinutesTests: XCTestCase {

    func testMidnight() {
        
        var components = DateComponents()
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        let expected = Array(repeating: BClock.LampState.O, count: 11)
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveMinutes
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_23_59_59() {
        
        var components = DateComponents()
        components.hour = 23
        components.minute = 59
        components.second = 59
        
        let expected = [BClock.LampState.Y, .Y, .R, .Y, .Y, .R, .Y, .Y, .R, .Y, .Y]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveMinutes
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_12_04_00() {
        
        var components = DateComponents()
        components.hour = 12
        components.minute = 04
        components.second = 00
        
        let expected = Array(repeating: BClock.LampState.O, count: 11)
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveMinutes
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_12_23_00() {
        
        var components = DateComponents()
        components.hour = 12
        components.minute = 23
        components.second = 00
        
        let expected = [BClock.LampState.Y, .Y, .R, .Y, .O, .O, .O, .O, .O, .O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveMinutes
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_12_35_00() {
        
        var components = DateComponents()
        components.hour = 12
        components.minute = 35
        components.second = 00
        
        let expected = [BClock.LampState.Y, .Y, .R, .Y, .Y, .R, .Y, .O, .O, .O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).fiveMinutes
        
        XCTAssertEqual(result, expected)
        
    }

}
