//
//  PageContentViewController.swift
//  DelegateSample
//
//  Created by Ryohei Azuma on 2018/08/28.
//  Copyright © 2018年 Ryohei Azuma. All rights reserved.
//

import UIKit
class PageContentViewController: UIViewController, testDelegate {
    
    //シーン移動の際に設定されるデータ
    var pageIndex:Int = 0
    var selectedVC:Int = 0
    var selectedSVC:Int = 0
    
    var soundSetting:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func test1() {
        self.view.backgroundColor = UIColor.yellow
        print("test1メソッドに入った: \(soundSetting)")
    }
    
    func test2(soundSetting: Int) {
        if soundSetting == 0 {
            self.view.backgroundColor = UIColor.red
            print("test2メソッドに入ったsoundSetting: \(soundSetting)")
        }
        if soundSetting == 1 {
            self.view.backgroundColor = UIColor.brown
            print("test2メソッドに入ったsoundSetting: \(soundSetting)")
        }
    }
}

