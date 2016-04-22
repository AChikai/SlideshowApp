//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Akio Chikai on 2016/04/16.
//  Copyright © 2016年 Akio Chikai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var dispGoButton: UIButton!
    @IBOutlet weak var dispBackButton: UIButton!
    
    var imageNo = 2
    
    func dispImage() {
        if imageNo == 0 {

            photo1.hidden = false
            photo2.hidden = true
            photo3.hidden = true
        }
        if imageNo == 1 {
            photo1.hidden = true
            photo2.hidden = false
            photo3.hidden = true
        }
        if imageNo == 2 {
            photo1.hidden = true
            photo2.hidden = true
            photo3.hidden = false
        }
    }
    

    
    func changeView () {
    imageNo += 1
        if imageNo == 3 {
            imageNo = 0
        }
        dispImage()
    }
    
    var timer: NSTimer = NSTimer()
    func slideTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "changeView", userInfo: nil, repeats: true)
    }
    var setTimer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        photo1.userInteractionEnabled = true
        photo2.userInteractionEnabled = true
        photo3.userInteractionEnabled = true
        
        let tapGesture:UIGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapped:")
        //シングルタップ
        
        tapGesture.delegate = self;
        //デリゲートをセット
        let tapGesture2:UIGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapped:")
        //タップジェスチャー２
        
        tapGesture2.delegate = self;
        let tapGesture3:UIGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapped:")
        //タップジェスチャー３
        
        tapGesture3.delegate = self;
        
        self.photo1.addGestureRecognizer(tapGesture)
        self.photo2.addGestureRecognizer(tapGesture2)
        self.photo3.addGestureRecognizer(tapGesture3)
        //Viewに追加
        
    }
    
    func tapped(sender: UITapGestureRecognizer) {
        //タップイベント
        
        performSegueWithIdentifier("toResultViewController2", sender: nil)
        //ResultViewControllerへ遷移するために Segue を呼び出
     }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toResultViewController2") {
            let resultViewController: ResultViewController = (segue.destinationViewController as! ResultViewController)
            var toImageView: UIImageView = photo1
            if imageNo == 0 {
                toImageView = photo1
            }
            if imageNo == 1 {
                toImageView = photo2
            }
            if imageNo == 2 {
                toImageView = photo3
            }
            resultViewController.rDispImage = toImageView
            timer.invalidate()
        }
    }
    

    
    @IBAction func playButton(sender: AnyObject) {
        
        setTimer += 1
        if setTimer == 2 {
            setTimer = 0
        }
        
        if setTimer == 1 {
        playButton.setTitle("停止", forState: .Normal)
        dispGoButton.enabled = false
        dispBackButton.enabled = false
            slideTimer()
        } else {
            playButton.setTitle("再生", forState: .Normal)
            dispGoButton.enabled = true
            dispBackButton.enabled = true
            timer.invalidate()
        }
        
    }
    
    @IBAction func goButton(sender: AnyObject) {
        
        imageNo += 1
        if imageNo == 3 {
            imageNo = 0
        }
        dispImage()
    }
    
    @IBAction func backButton(sender: AnyObject) {
        
        imageNo -= 1
        if imageNo == -1 {
            imageNo = 2
        }
        dispImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        if setTimer == 1 {
            slideTimer()
        }
    }
}

