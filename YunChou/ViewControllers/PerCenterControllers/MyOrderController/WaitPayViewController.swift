//
//  WaitPayViewController.swift
//  YunChou
//
//  Created by grx on 2018/10/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import SwiftFCXRefresh

class WaitPayViewController: BaseController,UITableViewDelegate,UITableViewDataSource {
    lazy var waitPayTableView = UITableView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: Main_Screen_Height-NaviBarHeight-SafeBottomMargin-40), style: .grouped)
    //上下拉刷新加载
    var headerRefreshView: FCXRefreshHeaderView?
    var footerRefreshView: FCXRefreshFooterView?
    
    var allDataArray:Array = [Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorLight
        self.waitPayTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.waitPayTableView.delegate = self
        self.waitPayTableView.dataSource = self
        self.waitPayTableView.backgroundColor = YCColorLight
//        self.waitPayTableView.estimatedRowHeight = 0;
        //注册cell重用
        self.waitPayTableView .register(WaitPayCell.self, forCellReuseIdentifier: WaitPayCellIdentifier)
        self.view.addSubview(waitPayTableView)
        self.addRefreshView()
        //获取数据源
        self.gaintAllOrderData(isLoadMore: false)
    }
    
    //MARK:==========添加上下拉刷新
    func addRefreshView() {
        self.waitPayTableView.mj_footer =
            MJRefreshAutoNormalFooter.init(refreshingBlock: {
                self.gaintAllOrderData(isLoadMore: true)
        })
        self.waitPayTableView.mj_footer.isAutomaticallyChangeAlpha = true;
        self.waitPayTableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.gaintAllOrderData(isLoadMore: false)
        })
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return allDataArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let waitPayCell = tableView.dequeueReusableCell(withIdentifier:WaitPayCellIdentifier) as! WaitPayCell
        waitPayCell.PayMoneyBlock = {[weak self](realMoney:String) in
            let payStyleVC = PayStyleController()
            payStyleVC.realMoneyStr = realMoney
            self?.navigationController?.pushViewController(payStyleVC, animated: true)
        }
        return waitPayCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let waitOrdDetailVC = WaitOrdDetailController()
        self.navigationController?.pushViewController(waitOrdDetailVC, animated: true)
    }
    
    func gaintAllOrderData(isLoadMore:Bool) {
        if isLoadMore {
            for i in 0..<5 {
                self.allDataArray.append(i)
            }
            self.waitPayTableView.reloadData()
            self.waitPayTableView.mj_footer.endRefreshing()
        }else{
            allDataArray.removeAll()
            for i in 0..<5 {
                self.allDataArray.append(i)
            }
            self.waitPayTableView.reloadData()
            self.waitPayTableView.mj_header.endRefreshing()
        }
    }
    
}