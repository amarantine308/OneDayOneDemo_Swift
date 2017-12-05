//
//  ViewController.swift
//  CircularBead
//
//  Created by 冯毅潇 on 2017/9/19.
//  Copyright © 2017年 QM. All rights reserved.
// 设置圆角 不同样子的圆角矩形

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let titleArr = ["没有圆角","全部圆角","上部圆角","下部圆角","左部圆角","右部圆角","左上圆角","右上圆角","左下圆角","左下圆角"]
        let space : Float = 10.0
        let lineCount = 4
        let view_WID : Float = (Float(view.frame.size.width) - space * (Float(lineCount) + 1))/Float(lineCount)
        
        for i in stride(from: 0, to: 10, by: 1) {
            print("\(i)")
            let textLab = UILabel()
            textLab.textAlignment = NSTextAlignment.center
            textLab.textColor = UIColor.red
            //textLab.backgroundColor = UIColor.lightGray
            let rect = CGRect(x: CGFloat(space + (view_WID + space)*Float(i%lineCount)), y: CGFloat(100 + (view_WID + space)*Float(i/lineCount)), width: CGFloat(view_WID), height: CGFloat(view_WID))
            textLab.frame = rect
            textLab.text = titleArr[i]
            textLab .setZFJGlobalView(viewType: GlobalViewType(rawValue: i)!, cornerRadius: 10.0)
            self.view.addSubview(textLab)
                       
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

