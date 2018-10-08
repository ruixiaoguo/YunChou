

//
//  YCInvestPlanViewController.swift
//  YunChou
//
//  Created by yy on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit



class YCInvestPlanViewController: BaseController {

    var recommendList : [InverPlanListModel]?

    
    private let InvestPlanCell = "InvestPlanCell"
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = YCBackground_LightColor
        tableView.register(YCInvestPlanTableViewCell.self, forCellReuseIdentifier: InvestPlanCell)
        
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "投资方案"
        self.leftView.isHidden = false
        
        self.createRightButton()
        
        recommendList = [InverPlanListModel(),InverPlanListModel(),InverPlanListModel(),InverPlanListModel(),InverPlanListModel()]
        
        view.addSubview(tableView)
//        glt_scrollView = tableView
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(NaviBarHeight)
            make.left.right.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
        }
    }
    
    override func rightBtnHandel() {
        //风险
    }

}

extension YCInvestPlanViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
 
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCInvestPlanTableViewCell = tableView.dequeueReusableCell(withIdentifier: InvestPlanCell, for: indexPath) as! YCInvestPlanTableViewCell
        
        cell.inverstPlanModel = recommendList![indexPath.row]
        
        cell.orderBtnBlock = {
            
        }
        
        cell.moreBtnBlock = {
            self.recommendList![indexPath.row].isShowMore = !self.recommendList![indexPath.row].isShowMore
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let vc = YCInvestOrderViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

