//
//  Questions.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 30/10/21.
//

import Foundation

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
}

class Api {
    let baseUrl : String = "https://opentdb.com/api.php?amount=10"
    var level: String? = nil
    var category: Int? = nil
    
    init(level: String, category: Int) {
        self.level = level.lowercased()
        self.category = category
    }
    
    func buildQuery() -> String {
//        fix conditions
        if let difficulty = self.level, let category = self.category {
            return "\(self.baseUrl)&category=\(category)&difficulty=\(difficulty)"
        }
        if let difficulty = self.level{
            return "\(self.baseUrl)&difficulty=\(difficulty)"
        }
        if let category = self.category {
            return "\(self.baseUrl)&category=\(category)"
        }
        return self.baseUrl
        
    }
    
    func loadQuestions() {
        guard let url = URL(string: self.buildQuery()) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let result = try! JSONDecoder().decode(QuestionsResult.self, from: data!)
            print(result)
        }
        .resume()

    }
}
