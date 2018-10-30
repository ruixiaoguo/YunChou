
//
//  YCSearchResultView.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/28.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCSearchResultView: UIView {

    
    private lazy var searchSegmentBtn : YCSearchSegmentBtnView = {
        let searchSegmentBtn = YCSearchSegmentBtnView()
        return searchSegmentBtn
    }()
    
    private let tagsCell = "searchResultCell"
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = YCBackground_LightColor
        tableView.register(YCHomeTableViewCell.self, forCellReuseIdentifier: tagsCell)
        
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(searchSegmentBtn)
        searchSegmentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(45)
        }
        
        
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchSegmentBtn.snp.bottom).offset(0)
            make.left.right.equalTo(self).offset(0)
            make.bottom.equalTo(self).offset(0)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension YCSearchResultView:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: tagsCell, for: indexPath) as! YCHomeTableViewCell
//        cell.dataDic = (dataArr[indexPath.row] as! NSDictionary)
        return cell
    }
    
    
}
