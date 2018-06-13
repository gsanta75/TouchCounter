//
//  ViewController.swift
//  TouchCounter
//
//  Created by GSanta on 13/06/18.
//  Copyright © 2018 GSanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel! { didSet { countLabel.text = String(format: "%02d", count) } }
    
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
        
        guard let customFont = UIFont(name: "Menlo-Regular", size: 250.0) else {
            fatalError("""
        Failed to load the "Menlo-Regular" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        countLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        countLabel.adjustsFontForContentSizeCategory = true
    }

    private func updateUI() {
        countLabel.text = String(format: "%02d", count)
    }
    
    private func setRndColorForUIView(_ view:UIView) {
        guard let labelForColor = view as? UILabel else {
            view.backgroundColor = UIColor.rndColor
            return
        }
        
        labelForColor.textColor = UIColor.rndColor
    }
    
    @objc private func changeColorsUI() {
        setRndColorForUIView(countLabel)
        setRndColorForUIView(view)
    }
}

extension UIColor {
    fileprivate class var rndColor: UIColor {
        let _red = Float(arc4random() % 256) / 256.0
        let _green = Float(arc4random() % 256) / 256.0
        let _blue = Float(arc4random() % 256) / 256.0
        return UIColor(red: CGFloat(_red), green: CGFloat(_green), blue: CGFloat(_blue), alpha: 1.0)
    }
}

