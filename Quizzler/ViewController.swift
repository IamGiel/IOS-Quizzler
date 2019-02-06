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
    var score = 0;
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
       
        let firstItem = allQuestions.list[0]
        questionLabel.text = firstItem.questionText
//        scoreLabel.text = "Score: \(score)";
        progressBar.frame.size.width = view.frame.size.width;
        
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
        progressLabel.text = "\(questionNumber + 1)/\(allQuestions.list.count)";
        scoreLabel.text = "Score: \(score)";
        print( progressBar.frame.size.width);
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1);
    }
    

    func nextQuestion() {
        
        print(questionNumber);
        if(questionNumber == allQuestions.list.count) {
            questionNumber = 0;
            // print("DONE! ");
            let alert = UIAlertController(title: "AWESOME!", message: "Beat the top score! and try again...", preferredStyle: .actionSheet); // try .alert
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(UIAlertAction) in self.startOver()}))
            // alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil);
        }
        questionLabel.text = allQuestions.list[questionNumber].questionText;
        
    }
    
    
    func checkAnswer() {
        
        let firstItem = allQuestions.list[questionNumber];
        questionLabel.text = firstItem.questionText
        
        let firstItemAnswer = allQuestions.list[questionNumber].answer;
        
        if(firstItemAnswer == pickedAnswer){
            print("correct");
            ProgressHUD.showSuccess("Correct")
            score += 1;
            print(score);
        } else {
            print("Wrong");
            ProgressHUD.showError("Error")
        }
        
        updateUI();
    }
    
    
    func startOver() {
        print("starting over");
        questionNumber = 0;
        nextQuestion();
        score = 0;
        updateUI();
    }
    

    
}
