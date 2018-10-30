//
//  BonusProductController.swift
//  YunChou
//  分红中
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class BonusProductController: BaseController,UITableViewDelegate,UITableViewDataSource {
    lazy var bonusTableView = UITableView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: Main_Screen_Height-NaviBarHeight-SafeBottomMargin-40), style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorLight
        self.bonusTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.bonusTableView.delegate = self
        self.bonusTableView.dataSource = self
        self.bonusTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.bonusTableView .register(FinancingCell.self, forCellReuseIdentifier: FinancingCellIdentifier)
        self.view.addSubview(bonusTableView)
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
        let bonusPayCell = tableView.dequeueReusableCell(withIdentifier:FinancingCellIdentifier) as! FinancingCell
        bonusPayCell.subLable.text = "分红中"
        bonusPayCell.subLable.textColor = YC_Color_Red
        return bonusPayCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = InvesProDetailController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
