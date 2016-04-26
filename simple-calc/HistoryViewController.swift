//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by iGuest on 4/25/16.
//  Copyright © 2016 Jennifer Kang. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var historyString:[String] = [];
    
    @IBOutlet weak var List: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0;
        for i in historyString {
            let yCoor = count * 21
            let screenRect = UIScreen.mainScreen().bounds
            let label = UILabel(frame: CGRectMake(0, CGFloat(yCoor), screenRect.size.width, 21))
            label.text = i
            List.addSubview(label)
            count += 1
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("heading back to calculator")
        let svc = segue.destinationViewController as! ViewController
        svc.historyString = historyString
        
    }
    
}


