//
//  BClock.swift
//  BerlinClock
//
//  Created by 2019 DEV 191 on 13/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct BClock {
    
    var date: Date
    
    // Init with a given date but default to the current date
    init(_ date: Date = Date()) {
        self.date = date
    }
    
    // Internal ENUM for the Lamp state
    enum LampState: String, CustomStringConvertible {
        case O, Y, R
        
        var description: String {
            return self.rawValue
        }
        
    }
    
    var singleMinutes: [LampState] {
        let minutes = Calendar.current.component(.minute, from: date)
        return calculateStates(4, onSigns: minutes % 5, onState: .Y)
    }
    
    var fiveMinutes: [LampState] {
        let minutes = Calendar.current.component(.minute, from: date)
        let result = calculateStates(11, onSigns: calculateOnSigns(minutes), onState: .Y)
        return result.flipping(from: .Y, to: .R, every: 3)
    }
    
    var singleHours: [LampState] {
        return []
    }
    
    var fiveHours: [LampState] {
        return []
    }
    
    var seconds: [LampState] {
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
