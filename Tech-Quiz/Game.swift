//
//  Game.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 06/11/21.
//

import Foundation

class Game: ObservableObject {
    private let baseUrl : String = "https://opentdb.com/api.php?amount=10"
    @Published var difficulty: String = "easy"
    private var category: Int = 8
    
    @Published var username: String = "player42"
    @Published var score: Int = 0
    @Published var questions : [Question] = []
    @Published var questionIndex : Int = 0
    
    init(difficulty: String, category: Int) {
        self.difficulty = difficulty.lowercased()
        self.category = category + 8
        
        self.loadQuestions { (questions) in
            self.questions = questions
        }
    }
    
    func buildQuery() -> String {
        if self.category > 8 {
            return "\(self.baseUrl)&category=\(category)&difficulty=\(difficulty)&encode=base64"
        }
        return "\(self.baseUrl)&difficulty=\(self.difficulty)&encode=base64"
    }
    
    func loadQuestions(completion: @escaping ([Question]) -> ()) {
        guard let url = URL(string: self.buildQuery()) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let response = try! JSONDecoder().decode(QuestionsResult.self, from: data!)
            
            DispatchQueue.main.async {
                completion(response.results)
            }
        }
        .resume()
    }
    
    func getNewQuestions() {
        self.loadQuestions { (questions) in
            self.questions = questions
        }
    }
    
    func startGame(username: String, difficulty: String, category: Int) {
        self.difficulty = difficulty.lowercased()
        self.category = category + 8
        self.username = username
        
        self.getNewQuestions()
    }
    
    func isOver() -> Bool {
        if self.questionIndex >= 9 {
            return true
        }
        return false
    }
}
