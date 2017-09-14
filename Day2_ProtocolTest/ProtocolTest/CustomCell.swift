//
//  CustomCell.swift
//  ProtocolTest
//
//  Created by 冯毅潇 on 2017/9/14.
//  Copyright © 2017年 QM. All rights reserved.
//

import UIKit
protocol btnClick : NSObjectProtocol {
    
    func clickRow(IndexPath:NSIndexPath)

}
class CustomCell: UITableViewCell {
    

    weak var delegate : btnClick!
    weak var btn : UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let btn_ = UIButton()
        contentView.addSubview(btn_)
        btn_.setTitle("测试", for: .normal)
        btn_.setTitleColor(UIColor.orange, for: .normal)
        btn_.backgroundColor = UIColor.yellow
        btn_.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
        self.btn = btn_
        
    }
    func btnAction(btn:UIButton){
        if self.delegate != nil {
            delegate.clickRow(IndexPath: NSIndexPath.init(row: btn.tag-100, section: 0))
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.btn.frame = CGRect(x: 7, y: 7, width: 60, height: 30)
    }
    
    
}
