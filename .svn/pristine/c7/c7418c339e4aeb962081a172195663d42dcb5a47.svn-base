//
//  CumerInterController.swift
//  YunChou
//
//  Created by grx on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class CumerInterController: BaseController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var cumerTableView = UITableView(frame: self.view.frame, style: .grouped)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "消费权益"
        self.view.backgroundColor = YCColorWhite
        self.leftView.isHidden = false
        self.cumerTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.cumerTableView.delegate = self
        self.cumerTableView.dataSource = self
        self.cumerTableView.backgroundColor = gof_ColorWithHex(0x3A84EC)
        //注册cell重用
        self.cumerTableView .register(CumerInterCell.self, forCellReuseIdentifier: CumerInterCellIdentifier)
        self.view.addSubview(cumerTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section==0&&indexPath.row==0){
            return 230
        }else{
            return 160
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:CumerInterCellIdentifier) as! CumerInterCell
        cell.gaintModel(tag: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}
