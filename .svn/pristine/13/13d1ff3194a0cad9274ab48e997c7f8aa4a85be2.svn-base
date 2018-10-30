//
//  AboutUsViewController.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import WebKit

class AboutUsController: BaseController,UITableViewDelegate,UITableViewDataSource {

    lazy var aboutUsTableView = UITableView(frame: self.view.frame, style: .grouped)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "联系我们"
        self.view.backgroundColor = YCColorWhite
        self.leftView.isHidden = false
        self.aboutUsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.aboutUsTableView.delegate = self
        self.aboutUsTableView.dataSource = self
        self.aboutUsTableView.backgroundColor = YCColorLight
        //自动计算高度
        self.aboutUsTableView.estimatedRowHeight = 70;
        self.aboutUsTableView.rowHeight = UITableView.automaticDimension;
        //注册cell重用
        self.aboutUsTableView .register(AboutKeFuTableCell.self, forCellReuseIdentifier: AboutUsKefuCellIdentifier)
        self.aboutUsTableView .register(AboutEmailTableCell.self, forCellReuseIdentifier: AboutUsEmailCellIdentifier)
        self.aboutUsTableView .register(AboutAdressTableCell.self, forCellReuseIdentifier: AboutUsAdressCellIdentifier)
        self.view.addSubview(aboutUsTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
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
        let kefuCell = tableView.dequeueReusableCell(withIdentifier:AboutUsKefuCellIdentifier) as! AboutKeFuTableCell
        let emailCell = tableView.dequeueReusableCell(withIdentifier:AboutUsEmailCellIdentifier) as! AboutEmailTableCell
        let adressCell = tableView.dequeueReusableCell(withIdentifier:AboutUsAdressCellIdentifier) as! AboutAdressTableCell
        switch indexPath.section {
        case 0:
            kefuCell.selectionStyle = .none
            return kefuCell
        case 1:
            emailCell.selectionStyle = .none
            return emailCell
        case 2:
            adressCell.selectionStyle = .none
            return adressCell
        default:
            break
        }
        return kefuCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            self.callTelphone()
            break
        case 1:
            let bindVC = BindEmailController()
            self.navigationController?.pushViewController(bindVC, animated: true)
            break
        case 2:
            let adressVC = MyAdressController()
            self.navigationController?.pushViewController(adressVC, animated: true)
            break
        default:
            break
        }
    }
    
    //MARK:======打电话
    func callTelphone() {
        let tel = "tel:".appending(YCKeFUPhone)
        let callView = UIWebView.init()
        let request = URLRequest.init(url:URL(string:tel)!)
        callView.loadRequest(request)
        self.view.addSubview(callView)
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}
