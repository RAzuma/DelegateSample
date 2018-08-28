//
//  ViewController.swift
//  DelegateSample
//
//  Created by Ryohei Azuma on 2018/08/28.
//  Copyright © 2018年 Ryohei Azuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test(_ sender: Any) {
        performSegue(withIdentifier: "test", sender: nil)
        
    }

}

