//
//  Questions.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 30/10/21.
//

import Foundation
import SwiftUI

struct QuestionsResult: Codable {
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
    
    init() {
        self.category = ""
        self.type = ""
        self.difficulty = ""
        self.question = ""
        self.correct_answer = ""
        self.incorrect_answers = []
    }
}

struct Answer: Codable, Identifiable {
    var id = UUID()
    let title : String
    let isCorrect: Bool
    
    init(title: String, isCorrect: Bool) {
        self.title = title
        self.isCorrect = isCorrect
    }
}

func getAnswers(question: Question, completion: @escaping ([Answer]) -> ()) {
    var answers : [Answer] = []
    answers.append(Answer(title: question.correct_answer, isCorrect: true))
    for answer in question.incorrect_answers {
        answers.append(Answer(title: answer, isCorrect: false))
    }
    answers = answers.shuffled()
    
    DispatchQueue.main.async {
        completion(answers)
    }
}
