//
//  BindInfoController.swift
//  YunChou
//
//  Created by grx on 2018/9/30.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class BindInfoController: BaseController,UITableViewDelegate,UITableViewDataSource {
    lazy var bindTableView = UITableView(frame: self.view.frame, style: .grouped)
    var allArray:Array = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "绑定信息"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        //添加数据源
        self.addDataSource()
        
        self.bindTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.bindTableView.delegate = self
        self.bindTableView.dataSource = self
        self.bindTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.bindTableView .register(BindTableCell.self, forCellReuseIdentifier: BindTableCellIdentifier)
        self.view.addSubview(bindTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allArray.count
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:BindTableCellIdentifier) as! BindTableCell
        cell.gaintDic(dic: self.allArray[indexPath.section] as NSDictionary)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 绑定手机
        let bindPhoneVC = BindPhoneController()
        // 绑定微信
        let bindWeixin = BindWeiXinController()
        // 绑定邮箱
        let bindEmailVC = BindEmailController()
        if(indexPath.section==0){
            self.navigationController?.pushViewController(bindPhoneVC, animated: true)
        }else if(indexPath.section==1){
            self.navigationController?.pushViewController(bindWeixin, animated: true)
        }else if(indexPath.section==2){
            self.navigationController?.pushViewController(bindEmailVC, animated: true)
        }
    }
    
    func addDataSource(){
        self.allArray.removeAll()
        let phoneDic = ["image":"bindPhone","title":"绑定手机号","content":"158273842"]
        let weixinDic = ["image":"bindWeixin","title":"绑定微信号","content":"Wiwixq1233"]
        let emailDic = ["image":"bindEmail","title":"绑定邮箱","content":"22312341@qq.com"]
        self.allArray.append(phoneDic)
        self.allArray.append(weixinDic)
        self.allArray.append(emailDic)
    }

    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}
