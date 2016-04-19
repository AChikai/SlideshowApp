//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Akio Chikai on 2016/04/16.
//  Copyright © 2016年 Akio Chikai. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var rImageview: UIImageView!
    
    var rDispImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rImageview.image = rDispImage?.image
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
