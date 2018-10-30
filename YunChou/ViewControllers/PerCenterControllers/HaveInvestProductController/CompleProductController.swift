//
//  CompleProductController.swift
//  YunChou
//  已完成
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class CompleProductController: BaseController,UITableViewDelegate,UITableViewDataSource {
    lazy var compleTableView = UITableView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: Main_Screen_Height-NaviBarHeight-SafeBottomMargin-40), style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorLight
        self.compleTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.compleTableView.delegate = self
        self.compleTableView.dataSource = self
        self.compleTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.compleTableView .register(FinancingCell.self, forCellReuseIdentifier: FinancingCellIdentifier)
        self.view.addSubview(compleTableView)
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
        let compleCell = tableView.dequeueReusableCell(withIdentifier:FinancingCellIdentifier) as! FinancingCell
        compleCell.subLable.text = "已完成"
        compleCell.subLable.textColor = gof_ColorWithHex(0xACD1FF)
        return compleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = InvesProDetailController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
