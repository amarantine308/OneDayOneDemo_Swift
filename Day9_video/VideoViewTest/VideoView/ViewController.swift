//
//  ViewController.swift
//  VideoView
//
//  Created by 冯毅潇 on 2018/2/26.
//  Copyright © 2018年 冯毅潇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vedioView = VideoView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        self.view.addSubview(vedioView)
        vedioView.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

