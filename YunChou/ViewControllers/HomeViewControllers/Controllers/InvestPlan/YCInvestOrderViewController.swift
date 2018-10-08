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
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = YCBackground_LightColor
        tableView.register(YCInvestOrderTableViewCell.self, forCellReuseIdentifier: InvestPlanOrderCell)
        
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
        self.navigationItem.title = "预约"
        self.leftView.isHidden = false
        
        view.addSubview(tableView)
        //        glt_scrollView = tableView
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(NaviBarHeight)
            make.left.right.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
        }
        // Do any additional setup after loading the view.
    }
}

extension YCInvestOrderViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCInvestOrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: InvestPlanOrderCell, for: indexPath) as! YCInvestOrderTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        //            let vc = YCProjectDetailViewController()
        //            vc.hidesBottomBarWhenPushed = true
        //            self.navigationController?.pushViewController(vc, animated: true)
    }
}

