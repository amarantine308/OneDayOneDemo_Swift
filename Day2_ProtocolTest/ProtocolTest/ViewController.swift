//
//  ViewController.swift
//  ProtocolTest
//
//  Created by 冯毅潇 on 2017/9/14.
//  Copyright © 2017年 QM. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource,btnClick{

    var tableView : UITableView!
    
    func clickRow(IndexPath:NSIndexPath){
        print("---> 代理回调 \(IndexPath)")
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView = UITableView.init(frame: self.view.bounds)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView =  UIView(frame: CGRect.zero)
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "cellID")

        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! CustomCell
//        if cell == nil {
//            cell = CustomCell.init(style:.default , reuseIdentifier: "cellID")
//        }
        cell.btn.tag = 100 + indexPath.row
        cell.delegate = self
        return cell
    }
}

