//
//  SingleMunitesTests.swift
//  BerlinClockTests
//
//  Created by 2019 DEV 191 on 13/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest
@testable import BerlinClock

class SingleMinutesTests: XCTestCase {

    func testMidnight() {
        
        var components = DateComponents()
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        let expected: [BClock.State] = [.O, .O, .O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).singleMinutes
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_23_59_59() {
        
        var components = DateComponents()
        components.hour = 23
        components.minute = 59
        components.second = 59
        
        let expected: [BClock.State] = [.Y, .Y, .Y, .Y]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).singleMinutes
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_12_32_00() {
        
        var components = DateComponents()
        components.hour = 12
        components.minute = 32
        components.second = 00
        
        let expected: [BClock.State] = [.Y, .Y, .O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).singleMinutes
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_12_34_00() {
        
        var components = DateComponents()
        components.hour = 12
        components.minute = 34
        components.second = 00
        
        let expected: [BClock.State] = [.Y, .Y, .Y, .Y]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).singleMinutes
        
        XCTAssertEqual(result, expected)
        
    }
    
    func test_12_35_00() {
        
        var components = DateComponents()
        components.hour = 12
        components.minute = 35
        components.second = 00
        
        let expected: [BClock.State] = [.O, .O, .O, .O]
        
        let date = Calendar.current.date(from: components)!
        
        let result = BClock(date).singleMinutes
        
        XCTAssertEqual(result, expected)
        
    }

}
