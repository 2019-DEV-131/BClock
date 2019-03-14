//
//  BClock.swift
//  BerlinClock
//
//  Created by 2019 DEV 191 on 13/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct BClock {
    
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
        return calculateStates(4, onSigns: minutes % 5, onState: .Y)
    }
    
    var fiveMinutes: [LampState] {
        guard let minutes = dateComponents.minute else { return [] }
        let result = calculateStates(11, onSigns: calculateOnSigns(minutes), onState: .Y)
        return result.flipping(from: .Y, to: .R, every: 3)
    }
    
    var singleHours: [LampState] {
        guard let hours = dateComponents.hour else { return [] }
        return calculateStates(4, onSigns: hours % 5, onState: .R)
    }
    
    var fiveHours: [LampState] {
        guard let hours = dateComponents.hour else { return [] }
        return calculateStates(4, onSigns: calculateOnSigns(hours), onState: .R)
    }
    
    var seconds: [LampState] {
        guard let seconds = dateComponents.second else { return [] }
        return seconds % 2 == 0 ? [LampState.R] : [LampState.O]
    }
    
    var time: [LampState] {
        return []
    }
    
    
    private func calculateStates(_ lamps: Int, onSigns: Int, onState: LampState) -> [LampState] {
        
        var result = [LampState]()
        
        for _ in 0..<onSigns {
            result.append(onState)
        }
        
        for _ in 0..<(lamps - onSigns) {
            result.append(.O)
        }
        
        return result
        
    }
    
    private func calculateOnSigns(_ number: Int) -> Int {
        return (number - (number % 5)) / 5
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
