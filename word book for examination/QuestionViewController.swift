//
//  QuestionViewController.swift
//  word book for examination
//
//  Created by 平山大翼 on 2016/02/20.
//  Copyright © 2016年 平山大翼. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionText: UITextView!
    @IBOutlet var answerText: UITextView!
    @IBOutlet var openAnswerButton: UIButton!
    @IBOutlet var easyButton: UIButton!
    @IBOutlet var normalButton: UIButton!
    @IBOutlet var hardButton: UIButton!
    
    var questionArray: [AnyObject] = [] //ユーザーデフォルトからとる配列
    var limitedQuestionArray: [AnyObject] = [] //時間で制限をかけた配列
    var shuffledQuestionArray: [AnyObject] = [] //シャッフルした配列
    var nowNumber: Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        answerText.hidden = true
        easyButton.hidden = true
        normalButton.hidden = true
        hardButton.hidden = true
            
        //改善の余地あり
        let textStyle = NSMutableParagraphStyle()
        textStyle.lineSpacing = 41
    }
    
    override func viewWillAppear(animated: Bool) {
        questionArray = saveData.arrayForKey("QUESTION")!
        
        //試行段階
        for(var i: Int = 0; i < questionArray.count; i++) {
            let strDateCheck = questionArray[i]["date"] as? String
            let intDateCheck = Int(strDateCheck!)
            
            let date = NSDate()
            let format = NSDateFormatter()
            format.dateFormat = "yyyyMMddHHmmss"
            let strDate = format.stringFromDate(date)
            let intDate = Int(strDate)
            
            if intDateCheck <= intDate {
                let limitedQuestionDictionary = questionArray[i]
                limitedQuestionArray.append(limitedQuestionDictionary)
                //改善の余地あり
                questionArray.removeAtIndex(i)
            }
        }
        
        shuffle()
        questionText.text = shuffledQuestionArray[nowNumber]["question"] as? String
        answerText.text = shuffledQuestionArray[nowNumber]["answer"] as? String
    }
    
    func shuffle() {
        while limitedQuestionArray.count > 0 {
            let index = Int(rand()) % limitedQuestionArray.count
            shuffledQuestionArray.append(limitedQuestionArray[index])
            limitedQuestionArray.removeAtIndex(index)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func openAnswer() {
        questionText.hidden = true
        openAnswerButton.hidden = true
        answerText.hidden = false
        easyButton.hidden = false
        normalButton.hidden = false
        hardButton.hidden = false
    }
    
    //easyButton
    @IBAction func easyButtonPushed() {
        let date = NSDate(timeIntervalSinceNow: 2*24*60*60)
        let format = NSDateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        let strDate = format.stringFromDate(date)
        
        let answeredDictionary = ["question": questionText.text!, "answer": answerText.text!, "date": strDate]
        
        questionArray.append(answeredDictionary)
        
        saveData.setObject(questionArray, forKey: "QUESTION")
        
        nowNumber++
        
        if nowNumber < shuffledQuestionArray.count {
            answerText.hidden = true
            easyButton.hidden = true
            normalButton.hidden = true
            hardButton.hidden = true
            questionText.text = shuffledQuestionArray[nowNumber]["question"] as? String
            answerText.text = shuffledQuestionArray[nowNumber]["answer"] as? String
            questionText.hidden = false
            openAnswerButton.hidden = false
        }else {
            self.performSegueWithIdentifier("toFinishView", sender: nil)
        }
    }

    
    //normalButton
    @IBAction func normalButtonPushed() {
        let date = NSDate(timeIntervalSinceNow: 60*60)
        let format = NSDateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        let strDate = format.stringFromDate(date)
        
        let answeredDictionary = ["question": questionText.text!, "answer": answerText.text!, "date": strDate]
        
        questionArray.append(answeredDictionary)
        
        saveData.setObject(questionArray, forKey: "QUESTION")
        
        nowNumber++

        if nowNumber < shuffledQuestionArray.count {
            answerText.hidden = true
            easyButton.hidden = true
            normalButton.hidden = true
            hardButton.hidden = true
            questionText.text = shuffledQuestionArray[nowNumber]["question"] as? String
            answerText.text = shuffledQuestionArray[nowNumber]["answer"] as? String
            questionText.hidden = false
            openAnswerButton.hidden = false
        }else {
            self.performSegueWithIdentifier("toFinishView", sender: nil)
        }
        
    }
    
    //hardButton
    @IBAction func hardButtonPushed() {
        let date = NSDate(timeIntervalSinceNow: 10*60)
        let format = NSDateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        let strDate = format.stringFromDate(date)
        
        let answeredDictionary = ["question": questionText.text!, "answer": answerText.text!, "date": strDate]
        
        questionArray.append(answeredDictionary)
        
        saveData.setObject(questionArray, forKey: "QUESTION")
        
        nowNumber++

        if nowNumber < shuffledQuestionArray.count {
            answerText.hidden = true
            easyButton.hidden = true
            normalButton.hidden = true
            hardButton.hidden = true
            questionText.text = shuffledQuestionArray[nowNumber]["question"] as? String
            answerText.text = shuffledQuestionArray[nowNumber]["answer"] as? String
            questionText.hidden = false
            openAnswerButton.hidden = false
        }else {
            self.performSegueWithIdentifier("toFinishView", sender: nil)
        }
        
    }


    
}
