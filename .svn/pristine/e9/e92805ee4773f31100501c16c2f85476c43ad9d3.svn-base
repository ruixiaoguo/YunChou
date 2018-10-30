//
//  YCPayWayViewController.swift
//  YunChou
//
//  Created by yy on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCPayWayViewController: BaseTableViewController {

    var selectIndex : IndexPath = IndexPath(row: 1000, section: 1000)
    
    var titleArr : NSArray = [[["title":"电子钱包","icon":"yc_order_qb"]],
                              [["title":"支付宝","icon":"yc_order_al"],
                              ["title":"微信","icon":"yc_order_wx"]]
                              ]
    
    private lazy var bottomView : YCOrderBottomView = {
        let bottomView = YCOrderBottomView()
        bottomView.btnStr = "支付"
        return bottomView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "支付方式"
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(NaviBarHeight)
            make.left.right.equalTo(view).offset(0)
            make.bottom.equalTo(-50-SafeBottomMargin)
        }
        tableView.backgroundColor = YCBackground_LightColor
        tableView.register(YCPayWayTableViewCell.self, forCellReuseIdentifier: "payWayCell")
        
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
            //支付方法
           
        }
    }
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 75
        }
        return 49
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            
            let vc = UIView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: 75))
            vc.backgroundColor = YCBackground_LightColor
            let bc = UIView(frame: CGRect(x: 0, y: 10, width: Main_Screen_Width, height: 55))
            bc.backgroundColor = YCColorWhite
            vc.addSubview(bc)
            
            let lb = UILabel(frame: CGRect(x: 15, y: 10, width: 100, height: 55))
            lb.text = "应付金额"
            lb.font = YC_FONT_PFSC_Medium(14)
            lb.textColor = YC_FontColor_102Gray
            vc.addSubview(lb)
            
            let money = UILabel(frame: CGRect(x: Main_Screen_Width - 215, y: 10, width: 200, height: 55))
            money.text = "￥300000.00"
            money.font = YC_FONT_PFSC_Medium(14)
            money.textAlignment = NSTextAlignment.right
            money.textColor = YC_FontColor_45Dark
            vc.addSubview(money)
            return vc
        }
        let vc = UIView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: 49))
        vc.backgroundColor = YCBackground_LightColor
        let lb = UILabel(frame: CGRect(x: 15, y: 0, width: 200, height: 49))
        lb.text = "其他支付方式"
        lb.font = YC_FONT_PFSC_Medium(14)
        lb.textColor = YC_FontColor_102Gray
        vc.addSubview(lb)
        return vc
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCPayWayTableViewCell = tableView.dequeueReusableCell(withIdentifier: "payWayCell", for: indexPath) as! YCPayWayTableViewCell
        let seArr : NSArray = titleArr[indexPath.section] as! NSArray
        cell.dataDic = seArr[indexPath.row] as! NSDictionary
        if indexPath == selectIndex {
            cell.changeIconImage(bol: true)
        }else{
            cell.changeIconImage(bol: false)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        selectIndex = indexPath
        tableView.reloadData()
    }

}

