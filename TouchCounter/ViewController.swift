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
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func updateUI() {
        countLabel.text = "\(count)"
    }


}

