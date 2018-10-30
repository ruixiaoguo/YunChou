//
//  UnbindBankCartController.swift
//  YunChou
//
//  Created by grx on 2018/10/24.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class UnbindBankCartController: BaseController,UITableViewDelegate,UITableViewDataSource {
    lazy var unbindBankTableView = UITableView(frame: self.view.frame, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "解除绑定银行卡"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.unbindBankTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.unbindBankTableView.delegate = self
        self.unbindBankTableView.dataSource = self
        self.unbindBankTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.unbindBankTableView .register(MyBankListCell.self, forCellReuseIdentifier: UnbindBankListCellIdentifier)
        self.view.addSubview(unbindBankTableView)
        self.initUnBindButton()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:UnbindBankListCellIdentifier) as! MyBankListCell
        cell.selectionStyle = .none
        return cell
    }
    
    //添加立即邀请按钮
    func initUnBindButton() {
        let footView = MyFootButtonView()
        footView.backgroundColor = YCColorLight
        self.view.addSubview(footView)
        footView.sureOverBtn.setTitle("解除绑定", for: .normal)
        footView.snp.makeConstraints { (make) in
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
            make.bottom.equalTo(-SafeBottomMargin-30)
        }
        footView.sureOverBtn.snp.updateConstraints { (make) in
            make.right.equalTo(-24)
            make.left.equalTo(24)
        }
        footView.sureOvercallBlock = {() in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}
