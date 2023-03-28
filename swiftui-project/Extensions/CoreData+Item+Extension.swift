//
//  CoreData+Item+Extension.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/28/23.
//

import Foundation

extension Item {
    
    var theme: ColorTheme {
        get {
            return ColorTheme(rawValue: Int(self.colorTheme)) ?? .yellow
        }
        set {
            self.colorTheme = Int16(newValue.rawValue)
        }
    }
    
    var minutesRemaining: String {
        return "\(self.length - self.minutesElapsed)"
    }
    
    var secondsRemaining: String {
        if self.secondsElapsed <= 0 {
            return "00"
        } else {
            if self.secondsElapsed < 10 {
              return "0\(60 - self.secondsElapsed)"
            } else {
                return "\(60 - self.secondsElapsed)"
            }
        }
    }
}
