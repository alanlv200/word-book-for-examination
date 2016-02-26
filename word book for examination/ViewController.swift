//
//  ViewController.swift
//  word book for examination
//
//  Created by 平山大翼 on 2016/02/20.
//  Copyright © 2016年 平山大翼. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    let saveData = NSUserDefaults.standardUserDefaults()
    let cal = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let now = NSDate()
        
        if saveData.arrayForKey("COUNTDOWN") != nil {
            let countdown = saveData.arrayForKey("COUNTDOWN")!
            let countdownYear = countdown[0]["year"] as? String
            let countdownMonth = countdown[0]["month"] as? String
            let countdownDay = countdown[0]["day"] as? String
        
            let intYear = Int(countdownYear!)
            let intMonth = Int(countdownMonth!)
            let intDay = Int(countdownDay!)
        
        let countdownDate = cal.dateWithEra(1, year: intYear!, month: intMonth!, day: intDay!, hour: 0, minute: 0, second: 0, nanosecond: 0)
        
        let componentsByDay = cal.components([.Day], fromDate: now, toDate: countdownDate!, options: NSCalendarOptions())
        
        label.text = String(componentsByDay)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {
    }
    
    @IBAction func study() {
        let saveData = NSUserDefaults.standardUserDefaults()
        if let questionArray = saveData.arrayForKey("QUESTION") {
            if questionArray.count > 0 {
                self.performSegueWithIdentifier("toQuestionView", sender: nil)
                return
            }
        }
        
        let alert = UIAlertController(
            title: "問題リストに問題がありません",
            message: "まずは問題リストをタップして問題を追加しましょう",
            preferredStyle: .Alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .Default,
            handler: nil
            )
        )
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    
    
}

