//
//  Labo_1Tests.swift
//  Labo 1Tests
//
//  Created by Vincent Leduc on 2021-06-30.
//  Copyright © 2021 Ahuntsic. All rights reserved.
//

import XCTest
@testable import Labo_1 // MARK: - FIXME

class Labo_1Tests: XCTestCase {
    
    var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    func setScore(_ score: Int) {
        game.score = score
    }
    
    func testGivenTwoTrueQuestions_WhenAnsweringTrue_ThenScoreIsOneAndGameOnGoing() {
        game.setGameQuestions([Question(title: "Q1", isCorrect: true),Question(title: "Q2", isCorrect: true)])
        setScore(0)
        game.answerCurrentQuestion(with: true)
        
        XCTAssertEqual(game.score, 1)
        XCTAssertEqual(game.state, .ongoing)
    }
    
    
    func testGivenOneTrueQuestion_WhenAnsweringFalse_ThenScoreIs0AndGameOver() {
        game.setGameQuestions([Question(title: "Q1", isCorrect: true)])
        setScore(0)
        game.answerCurrentQuestion(with: false)
        
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.state, .over)
    }
    
    
    func testGivenOneTrueQuestion_WhenAnsweringTrue_ThenScoreIs1AndGameOver() {
        game.setGameQuestions([Question(title: "Q1", isCorrect: true)])
        setScore(0)
        game.answerCurrentQuestion(with: true)
        
        XCTAssertEqual(game.score, 1)
        XCTAssertEqual(game.state, .over)
    }
    
    func testGivenEmptyQuestionnaire_WhenSetGameQuestions_ThenGameIsOnGoingAndCurrentQuestionMatchesExcpectedTitle() {
        var question = Question()
        question.title = "Question"
        
        XCTAssertEqual(game.state, .ongoing)
        XCTAssertEqual(question.title, "Question")
    }
    
    //Il faut rajouter les tests pour lorsque la partie se finit et quand elle est rafraichie
    
    func testGivenTwoTrueQuestions_WhenBothQuestionsAnsweredWithFalse_ThenAcoreIs0AndGameIsOver() {
        game.setGameQuestions([Question(title: "Q1", isCorrect: true),Question(title: "Q2", isCorrect: true)])
        game.answerCurrentQuestion(with: false)
        game.answerCurrentQuestion(with: false)
        
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.state, .over)
    }
    
    func testGivenTwoQuestions_WhenGameIsOverAndScore1_ThenGameIsRefreshedAndScoreBackTo0() {
        game.setGameQuestions([Question(title: "Q1", isCorrect: true),Question(title: "Q2", isCorrect: true)])
        game.answerCurrentQuestion(with: true)
        game.answerCurrentQuestion(with: false)
        
        XCTAssertEqual(game.score, 1)
        XCTAssertEqual(game.state, .over)
        
        game.refresh()
        
        XCTAssertEqual(game.state, .over)
        XCTAssertTrue(game.score == 0)
    }
}
