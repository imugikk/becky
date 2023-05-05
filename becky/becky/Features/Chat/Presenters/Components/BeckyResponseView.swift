//
//  BeckyResponseView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 04/05/23.
//

import Foundation


func getBeckyResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    let questions : [String] = [ "Are you buying this for the right reasons?", "Is this a need or a want?", "Can you get by without it?", "Do you need it right now?"
    ]
    
    for val in questions{
        if tempMessage.contains("yes") {
            return questions[1]
        } else if tempMessage.contains("no") {
            return questions[2]
        } else if tempMessage.contains("need") || tempMessage.contains("want") {
            return questions[3]
        } else {
            return questions[3]
        }
    }
    
    return ""
}
