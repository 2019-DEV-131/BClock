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
    
    enum State: String, CustomStringConvertible {
        case O, Y, R
        
        var description: String {
            return self.rawValue
        }
        
    }
    
    var singleMinutes: [State] {
        return []
    }
    
    var fiveMinutes: [State] {
       return []
    }
    
    var singleHours: [State] {
        return []
    }
    
    var fiveHours: [State] {
        return []
    }
    
    var seconds: [State] {
        return []
    }

}
