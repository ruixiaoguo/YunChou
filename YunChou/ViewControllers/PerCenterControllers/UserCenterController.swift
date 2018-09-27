//
//  UserCenterController.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

let centerCellHight = 55

class UserCenterController: BaseController,UITableViewDelegate,UITableViewDataSource {

    lazy var userCenterTableView = UITableView(frame: self.view.frame, style: .grouped)
    private lazy var titleSouce :[String] = [String]()
    var sectionOneArray:Array = [PersionModel]()
    var sectionSedArray:Array = [PersionModel]()
    var sectionThirdArray:Array = [PersionModel]()
    var sectionForArray:Array = [PersionModel]()

    var allArray:Array = [[PersionModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "个人设置"
        self.view.backgroundColor = YCColorWhite
        self.leftView.isHidden = false
        //添加数据源
        self.addDataSource()
        
        self.userCenterTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.userCenterTableView.delegate = self
        self.userCenterTableView.dataSource = self
        self.userCenterTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.userCenterTableView .register(CenterTableCell.self, forCellReuseIdentifier: UserCenterCellIdentifier)
        self.view.addSubview(userCenterTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allArray[section].count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 80
        default:
            return 5
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(section==self.allArray.count-1){
            return 60
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if(section==self.allArray.count-1){
            let footView = UIView()
            //退出按钮
            footView.addSubview(self.loginOutBtn)
            self.loginOutBtn.snp.makeConstraints { (make) in
                make.top.equalTo(8)
                make.right.equalTo(0)
                make.left.equalTo(0)
                make.height.equalTo(52)
            }
            return footView
        }else{
            return nil
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let hearView = UserCenterHeadView()
            hearView.owner = self
            return hearView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(centerCellHight)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:UserCenterCellIdentifier) as! CenterTableCell
        cell.selectionStyle = .none
        cell.gaintPersionModel(model: self.allArray[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section==3&&indexPath.row==2){
            //关于我们
            let aboutUsVC = AboutUsController()
            aboutUsVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(aboutUsVC, animated: true)
        }
    }
    
    func addDataSource(){
        self.allArray.removeAll()
        sectionOneArray.removeAll()
        sectionSedArray.removeAll()
        sectionThirdArray.removeAll()
        sectionForArray.removeAll()
        let titleSouce1 = ["昵称"]
        let titleSouce2 = ["绑定手机","绑定微信","绑定邮箱"]
        let titleSouce3 = ["实名认证"]
        let titleSouce4 = ["密码管理","清除缓存","关于我们"]
        for i in 0..<titleSouce1.count {
            let model = PersionModel()
            model.title = titleSouce1[i]
            sectionOneArray.append(model)
        }
        for i in 0..<titleSouce2.count {
            let model = PersionModel()
            model.title = titleSouce2[i]
            sectionSedArray.append(model)
        }
        for i in 0..<titleSouce3.count {
            let model = PersionModel()
            model.title = titleSouce3[i]
            sectionThirdArray.append(model)
        }
        for i in 0..<titleSouce4.count {
            let model = PersionModel()
            model.title = titleSouce4[i]
            sectionForArray.append(model)
        }
        self.allArray.append(sectionOneArray)
        self.allArray.append(sectionSedArray)
        self.allArray.append(sectionThirdArray)
        self.allArray.append(sectionForArray)
    }
    
    lazy var loginOutBtn:UIButton = {
         let loginOutBtn = UIButton()
        loginOutBtn.backgroundColor = YCColorWhite
        loginOutBtn.setTitle("退出登录", for: .normal)
        loginOutBtn.setTitleColor(YCColorBlack, for: .normal)
        loginOutBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return loginOutBtn
    }()
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}
