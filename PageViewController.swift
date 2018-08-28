//
//  PageViewController.swift
//  DelegateSample
//
//  Created by Ryohei Azuma on 2018/08/28.
//  Copyright © 2018年 Ryohei Azuma. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    // シーン移動の際に渡される値
    var selectedVC:Int = 0            // viewControllerで押されたセルのindex
    var selectedSVC: Int = 0    // SecondViewControllerで押されたセルのindex
    var arrayLength: Int = 0
    
    var soundSetting: Int = 0
    
    var pageIndex: Int = 0
    
    var currentVC:UIViewController!
    
    // ページングするviewControllerを格納する配列のプロパティ宣言
    var contentVCs = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        arrayLength = 2
        
        for index in 0..<arrayLength {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController
            contentVC.pageIndex = index
            contentVC.selectedSVC = selectedSVC
            contentVC.selectedVC = selectedVC
            contentVCs.append(contentVC)
        }
        
        self.setViewControllers([contentVCs[selectedSVC]], direction: .forward, animated: true, completion: nil)
        
    }  // viewDidLoad()を閉じる
    
    // 設定ボタンからセグエで遷移
    @IBAction func goSecondSettingBySegue(_ sender: Any) {
        performSegue(withIdentifier: "toSecondSetting", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingVC = segue.destination as? SettingViewController {
            settingVC.pageIndex = pageIndex
            settingVC.selectedVC = selectedVC
            settingVC.arrayLength = arrayLength
            settingVC.soundSetting = soundSetting
            
            let currentVC = contentVCs[pageIndex]
            settingVC.testdelegate = currentVC as? testDelegate
        }
    }
    
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = contentVCs.index(of: viewController as! PageContentViewController), index > 0 else {
            return nil
        }
        let previousVC = contentVCs[index - 1]
        
        pageIndex = index - 1
        
        return previousVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contentVCs.index(of: viewController as! PageContentViewController), index < contentVCs.count - 1 else {
            return nil
        }
        let nextVC = contentVCs[index + 1]
        
        pageIndex = index + 1
        
        return nextVC
    }
    
}
