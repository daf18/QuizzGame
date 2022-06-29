//
//  Game.swift
//  OpenQuizz
//
//  Created by Vincent Leduc on 2020-06-08.
//  Copyright © 2020 Ahuntsic. All rights reserved.
//

import Foundation

class Game {
    var score = 0

    private var questions = [Question]()
    
    private var currentIndex = 0

    var state: State = .ongoing

    enum State {
        case ongoing, over
    }

    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    static let questionsLoadedNotifName = Notification.Name(rawValue: "QuestionsLoaded")
    
    static let questionsLoadedNotif = Notification(name: questionsLoadedNotifName)
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
 
         QuestionManager.shared.get { (questions) in
            
            self.setGameQuestions(questions)
            NotificationCenter.default.post(Game.questionsLoadedNotif)
         }
    }

    func setGameQuestions(_ questions: [Question]) {
        self.questions = questions
        self.state = .ongoing
    }
    
    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }

    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }

    private func finishGame() {
        state = .over
    }


}
