//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 김지호 on 2021/04/22.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var  question : String
    var  answer : String
    
    init(q : String , a : String) {
        question = q
        answer = a
    }
}
