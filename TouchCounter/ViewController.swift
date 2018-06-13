//
//  ViewController.swift
//  TouchCounter
//
//  Created by GSanta on 13/06/18.
//  Copyright © 2018 GSanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel! { didSet { countLabel.text = "\(count)" } }
    
    @IBAction func tapCounter(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            count += 1
        }
    }
    
    // my model
    var count = 0 { didSet { updateUI() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapColor = UITapGestureRecognizer(target: self, action: #selector(changeColorsUI))
        view.addGestureRecognizer(tapColor)
        
    }

    private func updateUI() {
        countLabel.text = "\(count)"
    }
    
    private func setRndColorForUIView(_ view:UIView) {
        if view is UILabel {
            let label = view as! UILabel
            label.textColor = UIColor.rndColor
        } else {
            view.backgroundColor = UIColor.rndColor
        }

    }
    
    @objc private func changeColorsUI() {
        setRndColorForUIView(countLabel)
        setRndColorForUIView(view)
    }
}

extension UIColor {
    public class var rndColor: UIColor {
        /*
         let hue = CGFloat(arc4random() % 256) / 256.0 // 0.0 to 1.0
         let saturation = CGFloat(arc4random() % 128) / 256.0 // 0.5 to 1.0, away from white
         let brightness = CGFloat(arc4random() % 128) / 256.0 // 0.5 to 1.0, away from black
         return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
         */
        let _red = Float(arc4random() % 256) / 256.0
        let _green = Float(arc4random() % 256) / 256.0
        let _blue = Float(arc4random() % 256) / 256.0
        return UIColor(red: CGFloat(_red), green: CGFloat(_green), blue: CGFloat(_blue), alpha: 1.0)
    }
}

