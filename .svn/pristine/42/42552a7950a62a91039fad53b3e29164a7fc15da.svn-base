//
//  FinancingProductController.swift
//  YunChou
//  筹资中
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class FinancingProductController: BaseController,UITableViewDelegate,UITableViewDataSource {
    lazy var financingTableView = UITableView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: Main_Screen_Height-NaviBarHeight-SafeBottomMargin-40), style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorLight
        self.financingTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.financingTableView.delegate = self
        self.financingTableView.dataSource = self
        self.financingTableView.backgroundColor = YCColorLight
        //自动计算高度
        self.financingTableView.estimatedRowHeight = 70;
        self.financingTableView.rowHeight = UITableView.automaticDimension;
        //注册cell重用
        self.financingTableView .register(FinancingCell.self, forCellReuseIdentifier: FinancingCellIdentifier)
        self.view.addSubview(financingTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 225
//    }
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
        let waitPayCell = tableView.dequeueReusableCell(withIdentifier:FinancingCellIdentifier) as! FinancingCell
        return waitPayCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = InvesProDetailController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
