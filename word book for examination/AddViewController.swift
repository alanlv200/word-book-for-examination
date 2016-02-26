//
//  AddViewController.swift
//  word book for examination
//
//  Created by 平山大翼 on 2016/02/20.
//  Copyright © 2016年 平山大翼. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var questionTextField: UITextField!
    @IBOutlet var answerTextField: UITextField!
    
    var questionArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if saveData.arrayForKey("QUESTION") != nil {
            questionArray = saveData.arrayForKey("QUESTION")!
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
    
    @IBAction func saveQuestion() {
        let date = NSDate()
        let format = NSDateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        let strDate = format.stringFromDate(date)
        
        let questionDictionary = ["question": questionTextField.text!, "answer": answerTextField.text!, "date": strDate]
        
        questionArray.append(questionDictionary)
        saveData.setObject(questionArray, forKey: "QUESTION")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "問題の登録が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        
        self.presentViewController(alert, animated: true, completion: nil)
        questionTextField.text = ""
        answerTextField.text = ""
    }
}
