//
//  ViewController.swift
//  SwiftRPI
//
//  Created by YoloHwang on 17/3/28.
//  Copyright © 2017年 Yolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rpiView = RPIView (frame: CGRect (x: 0, y: 0, width: 120, height: 120))
        rpiView.center = self.view.center
        rpiView.lineWidth = 6.0
        rpiView.duration = 3.0
        rpiView.colors = [UIColor.blue.cgColor, UIColor.green.cgColor, UIColor.red.cgColor]
        rpiView.locations = [0.25, 0.5, 0.75]
        rpiView.showRoundProgressIndecatorWithParentView(self.view, hasGradient: true)
        
    }
}

