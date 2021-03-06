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
    
    var isRest : Bool = false
    
    private lazy var resetBtn : UIButton = {
       let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setTitle("重置", for: .normal)
        btn.titleLabel?.font = YC_FONT_PFSC_Semibold(17)
        btn.setTitleColor(YCColorWhite, for: .normal)
        btn.addTarget(self, action: #selector(resetBtnHandel), for: .touchUpInside)
        btn.setSomeColors(superView: btn, gradientColors: [gof_ColorWithHex(0xFF8972).cgColor,gof_ColorWithHex(0xFF5463).cgColor])

        return btn
    }()
    private lazy var sureBtn : UIButton = {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setTitle("确定", for: .normal)
        btn.titleLabel?.font = YC_FONT_PFSC_Semibold(17)
        btn.setTitleColor(YCColorWhite, for: .normal)
        btn.addTarget(self, action: #selector(sureBtnHandel), for: .touchUpInside)
        btn.setSomeColors(superView: btn, gradientColors: [gof_ColorWithHex(0x2890FF).cgColor,gof_ColorWithHex(0x3AB2FF).cgColor])

        return btn
    }()
    
    private lazy var tableView : UITableView = {
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
    
    
//    var dataArr : NSArray = [["title":"项目类型",
//                              "content":["全部","民宿","公寓","酒店","乐园","酒吧"]],
//                             ["title":"权益类型",
//                              "content":["全部","股权","债券","酒店众筹"]],
//                             ["title":"项目所在地区",
//                              "content":["全部","北京","上海","天津","山东","全部","北京","上海","天津","山东"]]]
    var dataArr : NSArray = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCBackground_LightColor
        self.addSubview(resetBtn)
        resetBtn.snp.makeConstraints { (make) in
            make.left.equalTo(31)
            make.width.equalTo(i5Rate(R: 150))
            make.height.equalTo(45)
            make.bottom.equalTo(-SafeBottomMargin-20)
        }
        resetBtn.layer.cornerRadius = 45/2
        self.addSubview(sureBtn)
        sureBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-31)
            make.width.equalTo(i5Rate(R: 150))
            make.height.equalTo(45)
            make.bottom.equalTo(-SafeBottomMargin-20)
        }
        sureBtn.layer.cornerRadius = 45/2

        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(0)
            make.left.right.equalTo(self).offset(0)
            make.bottom.equalTo(resetBtn.snp.top).offset(-9)
        }

    }
    
    
    func reloadDateView(project:NSArray ,right:NSArray , address:NSArray){
        dataArr = [["title":"项目类型",
        "content":project],
        ["title":"权益类型",
        "content":right],
        ["title":"项目所在地区",
        "content":address]]
        
        isRest = !isRest
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        DispatchQueue.main.async {
            self.tableView.layoutIfNeeded()
        }
        //        DispatchQueue.main.async {
        self.isRest = !self.isRest
        //        }

    }
    
    
    //重置
    @objc func resetBtnHandel(){
        isRest = !isRest
//        DispatchQueue.main.async {
            self.tableView.reloadData()
//        }
        self.tableView.layoutIfNeeded()
//        DispatchQueue.main.async {
        self.isRest = !self.isRest
//        }

    }
    
    //确定
    @objc func sureBtnHandel(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
extension YCTagsView:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCTagsViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: tagsCell, for: indexPath) as! YCTagsViewTableViewCell
        if isRest {
            cell.isReset = true
        }else{
            cell.isReset = false
        }
        cell.dataDic = (dataArr[indexPath.row] as! NSDictionary)
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    
}

