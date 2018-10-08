//
//  PersionViewController.swift
//  YunChou
//
//  Created by grx on 2018/9/20.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON

let CellHight = 55

class PersionViewController: BaseController,UITableViewDelegate,UITableViewDataSource {

    lazy var persionTableView = UITableView(frame: self.view.frame, style: .grouped)
    private lazy var titleSouce :[String] = [String]()
    var sectionOneArray:Array = [PersionModel]()
    var sectionSedArray:Array = [PersionModel]()
    var allArray:Array = [[PersionModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "个人中心"
        self.view.backgroundColor = YCColorWhite
        //添加数据源
        self.addDataSource()
        
        self.persionTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.persionTableView.delegate = self
        self.persionTableView.dataSource = self
        self.persionTableView.backgroundColor = YCColorLight
        //注册cell重用
        self.persionTableView .register(PersionTableCell.self, forCellReuseIdentifier: PersonCellIdentifier)
        self.view.addSubview(persionTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 320
        default:
            return 15
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let hearView = PersionHeadView()
            hearView.owner = self
            hearView.settingCallBlock = {[unowned self]()in
                YCLoginManager.PushToLoginController(ower: self)
            }
            hearView.messageCallBlock = {[unowned self]()in
                let messageVC = YCMessageViewController()
                messageVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(messageVC, animated: true)
            }
            
            return hearView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allArray[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CellHight)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:PersonCellIdentifier) as! PersionTableCell
        cell.selectionStyle = .none
        cell.gaintPersionModel(model: self.allArray[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if(indexPath.section==0&&indexPath.row==0){
            //绑定信息
            let bindInfoVC = BindInfoController()
            bindInfoVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(bindInfoVC, animated: true)
       }else if(indexPath.section==1&&indexPath.row==0){
            //风险评测
            let riskVC = RiskAssessController()
            riskVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(riskVC, animated: true)
       }else if(indexPath.section==1&&indexPath.row==1){
            //消费权益
            let cumterVC = CumerInterController()
            cumterVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(cumterVC, animated: true)
       }else if(indexPath.section==1&&indexPath.row==2){
            //选择收货地址
            let adressVC = MyAdressController()
            adressVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(adressVC, animated: true)
        }else if(indexPath.section==1&&indexPath.row==3){
            //邀请有礼
            let invitFriendVC = InvitFriendController()
            invitFriendVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(invitFriendVC, animated: true)
       }else if(indexPath.section==1&&indexPath.row==4){
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
        let titleSouce1 = ["绑定信息"]
        let titleSouce2 = ["风险评测","消费权益","收件地址","邀请好友","关于我们"]
        for i in 0..<titleSouce1.count {
            let model = PersionModel()
            model.title = titleSouce1[i]
            model.image = "persion0"
            model.introduction = ""
            sectionOneArray.append(model)
        }
        for i in 0..<titleSouce2.count {
            let model = PersionModel()
            model.title = titleSouce2[i]
            model.image = "persion_\(i)"
            model.introduction = ""
            sectionSedArray.append(model)
        }
        self.allArray.append(sectionOneArray)
        self.allArray.append(sectionSedArray)
    }
}
