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


class Game {
    
    let baseUrl : String = "https://opentdb.com/api.php?amount=1"
    var difficulty: String = "easy"
    var category: Int = 8
    
//    PASS THIS VARIABLES INTO VIEW
    //    var username: String = "player42"
    //    var score: Int = 0
    //    @State var questions : [Question] = []
    //    var questionNumber : Int = 0
    
    init(difficulty: String, category: Int) {
        self.difficulty = difficulty.lowercased()
        self.category = category + 8
    }
    
    func buildQuery() -> String {
        if self.category > 8 {
            return "\(self.baseUrl)&category=\(category)&difficulty=\(difficulty)&encode=base64"
        }
        return "\(self.baseUrl)&difficulty=\(self.difficulty)&encode=base64"
    }
    
    func loadQuestion(completion: @escaping (Question) -> ()) {
        guard let url = URL(string: self.buildQuery()) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let response = try! JSONDecoder().decode(QuestionsResult.self, from: data!)
            
            DispatchQueue.main.async {
                completion(response.results[0])
            }
        }
        .resume()
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
