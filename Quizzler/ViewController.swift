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

    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer() {
        
        let firstItem = allQuestions.list[0];
        questionLabel.text = firstItem.questionText
        
        let firstItemAnswer = allQuestions.list[0].answer;
        
        if(firstItemAnswer == pickedAnswer){
            print("correct answer");
        } else {
            print("nope, try again");
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
