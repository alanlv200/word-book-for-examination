//
//  countdownViewController.swift
//  word book for examination
//
//  Created by 平山大翼 on 2016/02/25.
//  Copyright © 2016年 平山大翼. All rights reserved.
//

import UIKit

class countdownViewController: UIViewController {
    
    @IBOutlet var yearTextField: UITextField!
    @IBOutlet var monthTextField: UITextField!
    @IBOutlet var dayTextField: UITextField!
    
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func update() {
        let countdownDate = ["year": yearTextField.text!, "month": monthTextField!, "day": dayTextField!]
        saveData.setObject(countdownDate, forKey: "COUNTDOWN")
    }

}
