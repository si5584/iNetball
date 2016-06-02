//
//  GameTaggingVC.swift
//  iNetball
//
//  Created by Simon Lovelock on 01/06/2016.
//  Copyright © 2016 haloApps. All rights reserved.
//

import UIKit

class GameTaggingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var quarterBtn: UIButton!
    
    var quarterTimer:NSTimer!
    
    var quarterActive: Bool = false
    var currentQuarter: Int = 0
    var millisecondCount: Int = 0
    
    var quarterTagsArray:[Int : String] = [:]
    var quarterTimelines = [NSDictionary]()
    
    // Error Buttons
    @IBOutlet weak var passingErrorBtn: UIButton!
    @IBOutlet weak var catchingErrBtn: UIButton!
    @IBOutlet weak var contactErrBtn: UIButton!
    @IBOutlet weak var heldballErrBtn: UIButton!
    @IBOutlet weak var footworkErrBtn: UIButton!
    @IBOutlet weak var offsideErrBtn: UIButton!
    @IBOutlet weak var reboundLostErrBtn: UIButton!
    @IBOutlet weak var outOfCourtErrBtn: UIButton!
    @IBOutlet weak var deflectionErrBtn: UIButton!
    @IBOutlet weak var otherLossErrBtn: UIButton!
    
    var activeGameBtnsArray : [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Load Buttons into activeGamesBtnArray and then disable them all
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startStopQuarterBtnPressed(sender: UIButton) {
        
        if !self.quarterActive {
            
            // Change Btn Label, switch quarter to active and increment quarter
            sender.setTitle("End Quarter", forState: .Normal)
            self.quarterActive = true
            self.currentQuarter += 1
            
            // Start Timer for this Quarter
            self.quarterTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(GameTaggingVC.incrementMillisecondCount), userInfo: nil, repeats: true)

            
        } else {
            // Change Btn Label, switch quarter to false
            sender.setTitle("Start Quarter", forState: .Normal)
            self.quarterActive = false
            
            // Destory current timer as quarter is finished
            self.quarterTimer.invalidate()
            // Reset millisecond counter
            self.millisecondCount = 0
            
            // Add quarter Tags to Timeline Array
            self.quarterTimelines.append(self.quarterTagsArray)
            self.quarterTagsArray.removeAll()
        }
        
    }
    
    func incrementMillisecondCount() {
        self.millisecondCount+=1
    }
    
    // Setup TableView Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    @IBAction func errorBtnPressed(sender: UIButton) {
        
        let btnTitle = sender.currentTitle
        self.quarterTagsArray[self.millisecondCount] = btnTitle
        
        print(self.quarterTagsArray)
    }
    
    

}
