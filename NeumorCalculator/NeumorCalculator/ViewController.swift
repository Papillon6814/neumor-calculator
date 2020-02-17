//
//  ViewController.swift
//  NeumorCalculator
//
//  Created by Papillon on 2020/02/10.
//  Copyright © 2020 Papillon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBAction func ButtonPush(_ sender: NeumorSquareButton) {
        sender.buttonPush()
    }
    @IBAction func ButtonUp(_ sender: NeumorSquareButton) {
        sender.button()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let params = Params()

        self.view.backgroundColor = params.BACKGROUND_COLOR
    }
}

