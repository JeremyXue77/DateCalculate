//
//  ViewController.swift
//  Date
//
//  Created by JeremyXue on 2018/7/16.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func refreshCurrentTime(_ sender: UIBarButtonItem) {
        getCurrentTime()
    }
    
    @IBAction func pickChanged(_ sender: UIDatePicker) {
        calculateDays(date: datePicker.date)
        getCurrentTime()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getCurrentTime()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCurrentTime(){
        let now = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "YYYY年MM月dd日 HH點mm分"
        let currentTime = dateformatter.string(from: now)
        
        currentTimeLabel.text = currentTime
    }
    
    func calculateDays(date:Date) {
        
        let pickDate = Int(date.timeIntervalSinceNow)
        print(pickDate)
        
        if pickDate <= -60 {
            showAlert()
            return
        }

        let days = 60 * 60 * 24
        let hours = 60 * 60
        let minutes = 60

        let _days = pickDate / days
        let _hours = (pickDate % days) / hours
        let _minutes = (pickDate % hours) / minutes

        daysLeftLabel.text = "還有 \(_days)天\(_hours)時\(_minutes)分"
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "錯誤", message: "無法調整為過去的時間", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        let now = Date(timeIntervalSinceNow: 0)
        datePicker.setDate(now, animated: true)
    }
    
}

