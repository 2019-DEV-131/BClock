//
//  BClock.swift
//  BerlinClock
//
//  Created by 2019 DEV 191 on 13/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct BClock {
    
    // Should have better naming for these enums
    private enum Const {
        static let zero = 0
        static let two = 2
        static let five = 5
    }
    
    private enum LampsCount {
        static let singleMinutes = 4
        static let fiveMinutes = 11
        static let singleHours = 4
        static let fiveHours = 4
    }
    
    private var dateComponents: DateComponents!
    
    var date: Date {
        didSet {
            dateComponents = Calendar.current.dateComponents([Calendar.Component.hour, .minute, .second], from: date)
        }
    }
    
    // Init with a given date but default to the current date
    init(_ date: Date = Date()) {
        self.date = date
        dateComponents = Calendar.current.dateComponents([Calendar.Component.hour, .minute, .second], from: date)
    }
    
    // Internal ENUM for the Lamp state
    enum LampState: String, CustomStringConvertible {
        case O, Y, R
        
        var description: String {
            return self.rawValue
        }
        
    }
    
    var singleMinutes: [LampState] {
        guard let minutes = dateComponents.minute else { return [] }
        return calculateStates(LampsCount.singleMinutes, onSigns: minutes % Const.five, onState: .Y)
    }
    
    var fiveMinutes: [LampState] {
        guard let minutes = dateComponents.minute else { return [] }
        let result = calculateStates(LampsCount.fiveMinutes, onSigns: calculateOnSigns(minutes), onState: .Y)
        return result.flipping(from: .Y, to: .R, every: 3)
    }
    
    var singleHours: [LampState] {
        guard let hours = dateComponents.hour else { return [] }
        return calculateStates(LampsCount.singleHours, onSigns: hours % Const.five, onState: .R)
    }
    
    var fiveHours: [LampState] {
        guard let hours = dateComponents.hour else { return [] }
        return calculateStates(LampsCount.fiveHours, onSigns: calculateOnSigns(hours), onState: .R)
    }
    
    var seconds: [LampState] {
        guard let seconds = dateComponents.second else { return [] }
        return seconds % Const.two == Const.zero ? [LampState.R] : [LampState.O]
    }
    
    var time: [LampState] {
        return seconds + fiveHours + singleHours + fiveMinutes + singleMinutes
    }
    
    func asDigitalTime(_ lamps:[LampState]) -> Date {
        return Date()
    }
    
    
    private func calculateStates(_ lamps: Int, onSigns: Int, onState: LampState) -> [LampState] {
        
        var result = [LampState]()
        
        for _ in Const.zero..<onSigns {
            result.append(onState)
        }
        
        for _ in Const.zero..<(lamps - onSigns) {
            result.append(.O)
        }
        
        return result
        
    }
    
    private func calculateOnSigns(_ number: Int) -> Int {
        return (number - (number % Const.five)) / Const.five
    }
}

extension Array where Element : Equatable {

    func flipping(from oldElem: Element, to newElem: Element, every step: Int) -> [Element] {
        
        var results = self
        
        for (idx, element) in self.enumerated() {
            
            if (idx+1) % step == 0 && element == oldElem {
                results[idx] = newElem
            }
            
        }
        
        return results
        
    }
}
