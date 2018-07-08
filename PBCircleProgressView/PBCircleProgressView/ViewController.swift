//
//  ViewController.swift
//  PBCircleProgressView
//
//  Created by pradeep burugu on 7/8/18.
//  Copyright © 2018 pradeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressView: PBCircleProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progressView = PBCircleProgressView(frame: CGRect(origin: self.view.center, size: CGSize(width: 100, height: 100)))
        
        progressView.lineWidth = 10.0
        
        progressView.trackStrokeColor = UIColor.red.withAlphaComponent(0.1)
        progressView.progressStrokeColor = UIColor.red
        
        self.view.addSubview(progressView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func increment(_ sender: Any) {
        progressView.progressValue += 0.1
    }
}

