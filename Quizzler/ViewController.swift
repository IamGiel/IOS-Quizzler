//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank();
    var pickedAnswer: Bool = false;
    var questionNumber: Int = 0; // keeps track of state of which question the user is on
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
       
        let firstItem = allQuestions.list[0]
        questionLabel.text = firstItem.questionText
        
    }


    @IBAction func answerPressed(_ sender: UIControl) {
        
        print(sender.tag)
        
        if (sender.tag == 1) {
            print("true")
            pickedAnswer = true;
        }
        if (sender.tag == 2) {
            print("false")
            pickedAnswer = false;
        }
        
        checkAnswer()
        questionNumber += 1;
        nextQuestion()

    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
        print(questionNumber);
        if(questionNumber == allQuestions.list.count) {
            questionNumber = 0;
            // print("DONE! ");
            let alert = UIAlertController(title: "Try Again?", message: "Beat the top score!", preferredStyle: .actionSheet); // try .alert
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        questionLabel.text = allQuestions.list[questionNumber].questionText;
        
    }
    
    
    func checkAnswer() {
        
        let firstItem = allQuestions.list[questionNumber];
        questionLabel.text = firstItem.questionText
        
        let firstItemAnswer = allQuestions.list[questionNumber].answer;
        
        if(firstItemAnswer == pickedAnswer){
            print("correct answer");
        } else {
            print("nope, try again");
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
