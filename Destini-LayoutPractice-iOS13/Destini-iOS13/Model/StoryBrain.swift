//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
struct StoryBrain {
    
    var userInput = 0
        
        
    let stories = [Story(
        title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
        choice1: "I'll hop in. Thanks for the help!", choice2: "Better ask him if he's a murderer first.", choice1Destination: 2, choice2Destination: 1
    ),
    Story(
        title: "He nods slowly, unfazed by the question.",
        choice1: "At least he's honest. I'll climb in.", choice2: "Wait, I know how to change a tire.", choice1Destination: 2, choice2Destination: 3
    ),
    Story(
        title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
        choice1: "I love Elton John! Hand him the cassette tape.", choice2: "It's him or me! You take the knife and stab him.", choice1Destination: 5, choice2Destination: 4
    ),
    Story(
        title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
        choice1: "The", choice2: "End", choice1Destination: 0, choice2Destination: 0
    ),
    Story(
        title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
        choice1: "The", choice2: "End", choice1Destination: 0, choice2Destination: 0
    )
    ]
    
    func getTitle() -> String {
        return stories[userInput].title
    }
    func getChoice1() -> String {
        return stories[userInput].choice1
    }
    func getChoice2() -> String {
        return stories[userInput].choice2
    }
    
    
    mutating func updateUI(pressedButton : String){
        if pressedButton == stories[userInput].choice1{
            userInput = stories[userInput].choice1Destination
        }else if pressedButton == stories[userInput].choice2{
            userInput = stories[userInput].choice2Destination
        }
    }
}
