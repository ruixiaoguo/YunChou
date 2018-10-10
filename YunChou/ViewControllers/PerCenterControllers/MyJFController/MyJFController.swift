//
//  MyJFController.swift
//  YunChou
//
//  Created by grx on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyJFController: BaseController,UITableViewDelegate,UITableViewDataSource {
    var jfStr:String?

    let headView = MyJFHeadView()
    
    var accountMoneyStr:String?
    lazy var myJfTableView = UITableView(frame: self.view.frame, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的积分"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.myJfTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.myJfTableView.delegate = self
        self.myJfTableView.dataSource = self
        self.myJfTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.myJfTableView .register(MyJfCell.self, forCellReuseIdentifier: MyJFCellIdentifier)
        self.view.addSubview(myJfTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 420
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //积分商城
        headView.selectjfShopBlock = {()in
            let jfShopVC = MyJfShopController()
            self.navigationController?.pushViewController(jfShopVC, animated: true)
        }
        //兑换商品
        headView.selChangeClickBlock = {() in
            
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:MyJFCellIdentifier) as! MyJfCell
        cell.selectionStyle = .none
        return cell
    }
    
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
    
    
}
