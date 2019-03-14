//
//  DigitalTimeTests.swift
//  BerlinClockTests
//
//  Created by 2019 DEV 191 on 14/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest

class DigitalTimeTests: XCTestCase {

    var systemUnderTest: BClock!
    
    override func setUp() {
        systemUnderTest = BClock()
    }
    
    override func tearDown() {
        systemUnderTest = nil
    }

    func testConvertToMidnight() {
        
        let time = [BClock.LampState.R,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O,.O]
        
        let result = systemUnderTest.asDigitalTime(time)
        
        let components = Calendar.current.dateComponents([Calendar.Component.hour, .minute, .second], from: result)
        
        XCTAssertEqual(components.hour!, 0)
        XCTAssertEqual(components.minute!, 0)
        XCTAssertEqual(components.second!, 0)
        
    }
    
    func testConvertTo_23_59_59() {
        
        let time = [BClock.LampState.O,.R,.R,.R,.R,.R,.R,.R,.O,.Y,.Y,.R,.Y,.Y,.R,.Y,.Y,.R,.Y,.Y,.Y,.Y,.Y,.Y]
        
        let result = systemUnderTest.asDigitalTime(time)
        
        let components = Calendar.current.dateComponents([Calendar.Component.hour, .minute, .second], from: result)
        
        XCTAssertEqual(components.hour!, 23)
        XCTAssertEqual(components.minute!, 59)
        XCTAssertEqual(components.second!, 59)
        
    }
    
    func testConvertTo_16_50_06() {
        
        let time = [BClock.LampState.R,.R,.R,.R,.O,.R,.O,.O,.O,.Y,.Y,.R,.Y,.Y,.R,.Y,.Y,.R,.Y,.O,.O,.O,.O,.O]
        
        let result = systemUnderTest.asDigitalTime(time)
        
        let components = Calendar.current.dateComponents([Calendar.Component.hour, .minute, .second], from: result)
        
        XCTAssertEqual(components.hour!, 16)
        XCTAssertEqual(components.minute!, 50)
        XCTAssertEqual(components.second!, 06)
        
    }
    
    func testConvertTo_11_37_01() {
        
        let time = [BClock.LampState.O,.R,.R,.O,.O,.R,.O,.O,.O,.Y,.Y,.R,.Y,.Y,.R,.Y,.O,.O,.O,.O,.Y,.Y,.O,.O]
        
        let result = systemUnderTest.asDigitalTime(time)
        
        let components = Calendar.current.dateComponents([Calendar.Component.hour, .minute, .second], from: result)
        
        XCTAssertEqual(components.hour!, 11)
        XCTAssertEqual(components.minute!, 37)
        XCTAssertEqual(components.second!, 01)
        
    }
}
