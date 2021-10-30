//
//  Questions.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 30/10/21.
//

import Foundation

struct QuestionsList: Codable {
    let response_code: Int
    let results: [Question]
}

struct Question: Codable {
    let category : String
    let type : String
    let difficulty: String
    let question : String
    let correct_answer: String
    let incorrect_answers : [String]
}

