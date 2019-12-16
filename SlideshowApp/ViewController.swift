//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 黒川ももこ on 2019/12/12.
//  Copyright © 2019 10d132mk. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var sushisushi: UIImageView!
    var timer_sec :Double=0
    var imageIndex = 0
    var timer: Timer!
    let images = [UIImage(named: "fugusashi"), UIImage(named: "nigiri"), UIImage(named: "oke")]
    
    
    override func viewDidLoad() {
        //最初から画像表示するためのコード
        sushisushi.image=images[imageIndex]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.sushi2=images[imageIndex]
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            modoru.isEnabled=true
            susumu.isEnabled=true
            saiseiTeishi.setTitle("再生", for:.normal)
        }
    }
    
    @IBAction func backImage(_ sender: UIButton) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        sushisushi.image = images[imageIndex]
    }
    
    @IBAction func nextImage(_ sender: UIButton) {
        if imageIndex == 2 {
            imageIndex = 0
            
        } else {
            imageIndex += 1
        }
        sushisushi.image = images[imageIndex]
        
    }
    
    @IBOutlet weak var modoru: UIButton!
    @IBOutlet weak var susumu: UIButton!
    @IBOutlet weak var saiseiTeishi: UIButton!
    
    
    
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec = 2.0
        if imageIndex == 2 {
            imageIndex = 0
            
        } else {
            imageIndex += 1
        }
        sushisushi.image = images[imageIndex]
    }
    
    //↓から停止
    func stopTimer() {
        self.timer.invalidate()// タイマーを停止する
        self.timer = nil
        
    }

    
    
    
    @IBAction func startStop(_ sender: UIButton) {
        
        sender.setTitle("停止", for: .normal)
        modoru.isEnabled=false
        susumu.isEnabled=false
        //タイマーが動いてないとき
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats:true)
        } else {
            self.timer.invalidate()// タイマーを停止する
            self.timer = nil
            modoru.isEnabled=true
            susumu.isEnabled=true
            sender.setTitle("再生", for: .normal)
        }
        
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
