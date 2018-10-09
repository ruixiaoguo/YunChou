//
//  YCInvestOrderViewController.swift
//  YunChou
//
//  Created by yy on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCInvestOrderViewController: BaseController {

    private let InvestPlanOrderCell = "InvestPlanOrderCell"
    //1 预约  2 认购
    @objc public var types : Int = 1

    
    var twoArr : NSArray = NSArray()
    
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = YCColorWhite
//        tableView.backgroundColor = YCBackground_LightColor
//        tableView.register(YCInvestOrderTableViewCell.self, forCellReuseIdentifier: InvestPlanOrderCell)
        
        
        tableView.register(YCOrderTopTableViewCell.self, forCellReuseIdentifier: "ordertop")
        tableView.register(YCOrderMiddleTableViewCell.self, forCellReuseIdentifier: "ordermiddle")
        tableView.register(YCOrderBottomTableViewCell.self, forCellReuseIdentifier: "orderbottom")

        
        
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
            
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.estimatedRowHeight = 44.0
        
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    private lazy var bottomView : YCOrderBottomView = {
       let bottomView = YCOrderBottomView()
        return bottomView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "预约"
        self.leftView.isHidden = false
        
        
        if types == 1{
          twoArr = [["title":"选择份数","allNum":"您还可以添加4份","currentNum":"1","maxNum":"5"],
             ["title":"订单金额","money":"￥30000.00"],
             ["title":"预约金说明","content":"预约斤为投资金额1%，认购时自动抵扣，若您最终放弃认购，预约金将转为代金券，不可退现。"]]
        }else{
            twoArr = [["title":"选择份数","allNum":"您还可以添加4份","currentNum":"1","maxNum":"5"],
                      ["title":"订单金额","money":"￥30000.00"],
                      ["title":"代金券","money":"-19389.00"],
                      ["title":"冷静期说明","content":"为保护投资人权益，认购期结束后24小时为投资冷静期。"]]
        }
       
        
        view.addSubview(tableView)
        //        glt_scrollView = tableView
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(NaviBarHeight)
            make.left.right.equalTo(view).offset(0)
            make.bottom.equalTo(-50-SafeBottomMargin)
        }
        view.addSubview(self.bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-SafeBottomMargin)
            make.left.right.equalTo(0)
            make.height.equalTo(50+SafeBottomMargin)
        }
       
        someBlock()
        
        // Do any additional setup after loading the view.
    }
    
    
    func someBlock(){
        bottomView.orderBtnBlock = {
            let vc = YCInvestOrderViewController()
            vc.types = 2
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension YCInvestOrderViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 2{
            return 1
        }
        return twoArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if types == 1{
            if section == 2{
                return 10
            }
            return 0.01
        }
        if section != 0{
            return 10
        }else{
            return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vc = UIView()
        vc.frame = CGRect.init(x: 0, y: 0, width: Main_Screen_Width, height: 10)
        vc.backgroundColor = YCBackground_LightColor
        return vc
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:YCInvestOrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: InvestPlanOrderCell, for: indexPath) as! YCInvestOrderTableViewCell
//        cell.selectionStyle = .none
//        return cell

        if indexPath.section == 0 {
            let cell:YCOrderTopTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ordertop", for: indexPath) as! YCOrderTopTableViewCell
            cell.selectionStyle = .none
            if types == 2{
                cell.createOtherView()
            }else{
                cell.addBottomVC()
            }
            return cell

        }else if indexPath.section == 1{
            let cell:YCOrderMiddleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ordermiddle", for: indexPath) as! YCOrderMiddleTableViewCell
            
            if indexPath.row == 0{
                cell.rowOneData(dic: twoArr[indexPath.row] as! NSDictionary)
            }else if indexPath.row == twoArr.count - 1{
                cell.rowLastData(dic: twoArr[indexPath.row] as! NSDictionary)
            }else{
                if types == 2{
                    if indexPath.row == twoArr.count - 2{
                        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator//添加箭头
//                        cell.changeMoneyLayout()
                    }
                }
                cell.otherRowData(dic: twoArr[indexPath.row] as! NSDictionary)
            }
            cell.selectionStyle = .none
            return cell
            
        }else{
            let cell:YCOrderBottomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "orderbottom", for: indexPath) as! YCOrderBottomTableViewCell
            cell.selectionStyle = .none
            return cell
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        //            let vc = YCProjectDetailViewController()
        //            vc.hidesBottomBarWhenPushed = true
        //            self.navigationController?.pushViewController(vc, animated: true)
    }
}

