//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Prem Kumar on 10/6/23.
//
import Foundation
import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var Option1: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var Option3: UIButton!
    @IBOutlet weak var Option4: UIButton!
    
    struct Question {
        let label1 : String
        let questionLabel: String
        let answers: [String]
        let correctAnswerIndex: Int
    }
    
    let questions: [Question] = [
        Question(label1: "Question 1/3", questionLabel:"What is Capital of France?", answers: ["Karachi","Moscow","Paris", "Rome"], correctAnswerIndex: 2),
        
        Question(label1: "Question 2/3",
                 questionLabel: "Which continent is largest?",
                 answers: ["Asia","Africa","North America","South America"], correctAnswerIndex: 0),
        
        Question(label1: "Question 3/3", questionLabel: "Who won Fifa World Cup in 2022", answers: ["England","Argentina","France","Croatia"], correctAnswerIndex: 1)
    ]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    func updateUI() {
        if currentQuestionIndex < 0 || currentQuestionIndex >= questions.count {
            print("Invalid. Resetting")
            currentQuestionIndex = 0
        }
        
        let currentQuestion = questions[currentQuestionIndex]
        Label1.text = currentQuestion.label1
        QuestionLabel.text = currentQuestion.questionLabel
        Option1.setTitle(currentQuestion.answers[0], for: .normal)
        Option2.setTitle(currentQuestion.answers[1], for: .normal)
        Option3.setTitle(currentQuestion.answers[2], for: .normal)
        Option4.setTitle(currentQuestion.answers[3], for: .normal)
    }
    @IBAction func optionSelected(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex >= questions.count {
            currentQuestionIndex = 0
        }
        updateUI()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
