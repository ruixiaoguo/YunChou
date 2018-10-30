//
//  YCTagsView.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/28.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCTagsView: UIView {

    
    private let tagsCell = "tagsCell"
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.register(YCTagsViewTableViewCell.self, forCellReuseIdentifier: tagsCell)
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
        }
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.estimatedRowHeight = 44.0
        
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    let dataArr : NSArray = [["title":"项目类型",
                              "content":["全部","民宿","公寓","酒店","乐园","酒吧"]],
                             ["title":"权益类型",
                              "content":["全部","股权","债券","酒店众筹"]],
                             ["title":"项目所在地区",
                              "content":["全部","北京","上海","天津","山东","全部","北京","上海","天津","山东"]]]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(0)
            make.left.right.equalTo(self).offset(0)
            make.bottom.equalTo(self).offset(0)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
extension YCTagsView:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCTagsViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: tagsCell, for: indexPath) as! YCTagsViewTableViewCell
        cell.dataDic = (dataArr[indexPath.row] as! NSDictionary)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    
}

