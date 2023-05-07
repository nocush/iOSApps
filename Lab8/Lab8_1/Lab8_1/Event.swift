//
//  Event.swift
//  Lab8_1
//
//  Created by Mateusz Bartoszek on 29/04/2023.
//

import Foundation


struct Event{
    var name:String
    var duration:Double
    
    static func getEvents()->[Event]{
        var events:[Event] = []
        for i in 1...5{
            let event = Event(name: "Wydarzenie \(i)", duration: 0)
            events.append(event)
        }
        return events
    }
}
