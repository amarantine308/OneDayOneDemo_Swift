//
//  ViewController.swift
//  WkWebView
//
//  Created by 冯毅潇 on 2017/9/18.
//  Copyright © 2017年 QM. All rights reserved.
//

import UIKit

class ViewController: UIViewController,GetBodyDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = UIButton.init(frame: CGRect(x:100,y:100,width:100,height:60))
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(self.btnAction), for: .touchUpInside)
        btn.backgroundColor = UIColor.orange
    }
    func didGetBody(_ body:String){
     print(body)
    }
    func btnAction(){
        
        let vc = GetBodyController()
        vc.getBodyDelegate = self
        vc.urlPath = "https://item.jd.com/5025518.html"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

