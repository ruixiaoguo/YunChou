//
//  FailProductController.swift
//  YunChou
//  失败
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class FailProductController: BaseController,UITableViewDelegate,UITableViewDataSource {
    lazy var failTableView = UITableView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: Main_Screen_Height-NaviBarHeight-SafeBottomMargin-40), style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorLight
        self.failTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.failTableView.delegate = self
        self.failTableView.dataSource = self
        self.failTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.failTableView .register(FinancingCell.self, forCellReuseIdentifier: FinancingCellIdentifier)
        self.view.addSubview(failTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
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
        let failCell = tableView.dequeueReusableCell(withIdentifier:FinancingCellIdentifier) as! FinancingCell
        failCell.subLable.text = "失败"
        failCell.subLable.textColor = YCColorDarkLight
        return failCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = InvesProDetailController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
