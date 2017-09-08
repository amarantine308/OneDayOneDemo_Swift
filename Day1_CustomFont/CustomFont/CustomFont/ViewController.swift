//
//  ViewController.swift
//  CustomFont
//
//  Created by 冯毅潇 on 2017/9/8.
//  Copyright © 2017年 QM. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let label = UILabel()
    var allFontNames = [String]()
    var currentCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printAllSupportedFontNames()

        initUI()
        
    }
    func initUI(){
        
        label.text = "When i see you , the world are all of you"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12.0)
        self.view.addSubview(label)
        label.textColor = UIColor.cyan
        
        label.snp.makeConstraints({ (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
        })
        
        let changeBtn = UIButton(type:.custom)
        self.view.addSubview(changeBtn)
        changeBtn.setTitle("Change Font Family", for: .normal)
        changeBtn.setTitleColor(UIColor.purple, for: .normal)
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.cornerRadius = 5
        changeBtn.addTarget(self, action: #selector(changeFontFamily), for: .touchUpInside)
        changeBtn.snp.makeConstraints({
            (make) in
            
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
        })

    }
    func changeFontFamily(){
      let fontName = allFontNames[currentCount]
      //label.font  = UIFont(name: "Savoye LET", size: 16)
        if currentCount>allFontNames.count {
            currentCount = 0
        }
      label.font  = UIFont(name: fontName, size: 16)
      currentCount = currentCount + 1
    }
    
    func printAllSupportedFontNames(){
        let familyNames = UIFont.familyNames
        for aName in familyNames{
            print("\(aName)")
            let fontNames = UIFont.fontNames(forFamilyName: aName)
            for fontName in fontNames {
                print("----- \(fontName)")
                allFontNames.append(fontName)
            }
         
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

