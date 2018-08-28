//
//  SettingViewController.swift
//  DelegateSample
//
//  Created by Ryohei Azuma on 2018/08/28.
//  Copyright © 2018年 Ryohei Azuma. All rights reserved.
//

import UIKit

protocol testDelegate: class {
    var soundSetting:Int { get set }
    func test1()
    func test2(soundSetting: Int)
}

class SettingViewController: UIViewController {
    
    weak var testdelegate: testDelegate?
    
    var soundSetting:Int = 0
    var pageIndex:Int = 0
    var selectedVC:Int = 0
    var arrayLength:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Viewを閉じる（VCへ戻る）dismisボタン作成
        let backDMButton = UIButton()
        backDMButton.frame = CGRect(x: 0, y: 0, width: 120, height: 30)
        backDMButton.center = CGPoint(x: self.view.frame.midX, y: 35)
        backDMButton.setTitle("dismiss戻り", for: .normal)
        backDMButton.setTitleColor(UIColor.magenta, for: .normal)
        backDMButton.addTarget(self, action: #selector(backDMVC(sender:)), for: .touchUpInside)
        self.view.addSubview(backDMButton)
        
        // セグメントボタンを作成
        let array : NSArray = ["OFF","ON"]
        let uiSegmentedControl: UISegmentedControl = UISegmentedControl(items: array as [AnyObject])
        uiSegmentedControl.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        uiSegmentedControl.center = CGPoint(x: self.view.frame.width/2, y: 100)
        uiSegmentedControl.selectedSegmentIndex = soundSetting
        uiSegmentedControl.backgroundColor = UIColor.white
        uiSegmentedControl.tintColor = UIColor.darkGray
        uiSegmentedControl.addTarget(self, action: #selector(self.segmentChanged(segcon:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(uiSegmentedControl)
        
    }  // viewDidLoadを閉じる
    
    
    // セグメントボタン押下時に実行するメソッド
    @objc func segmentChanged(segcon: UISegmentedControl){
        switch segcon.selectedSegmentIndex {
        case 0:
            soundSetting = 0
        case 1:
            soundSetting = 1
        default:
            print("Error")
        }
    }
    
    // セグエで遷移した戻り
    @objc func backDMVC(sender: AnyObject) {
        
        let nav = self.presentingViewController  as! UINavigationController
        let pageViewController = nav.topViewController as! PageViewController
        pageViewController.soundSetting = soundSetting
        
        self.dismiss(animated: true, completion: nil)
        
        self.testdelegate?.soundSetting = soundSetting
        self.testdelegate?.test1()
        self.testdelegate?.test2(soundSetting: soundSetting)
    }
}
