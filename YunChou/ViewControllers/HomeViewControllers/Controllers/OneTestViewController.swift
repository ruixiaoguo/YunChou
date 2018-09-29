
//
//  OneTestViewController.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/26.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class OneTestViewController: BaseController {

    
    private let HomeCell = "HomeCell"

    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = YCBackground_LightColor
        tableView.register(YCHomeTableViewCell.self, forCellReuseIdentifier: HomeCell)
        
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

        view.addSubview(tableView)
        glt_scrollView = tableView
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(0)
            make.left.right.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
        }

        // Do any additional setup after loading the view.
    }
}

extension OneTestViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeCell, for: indexPath) as! YCHomeTableViewCell
        return cell
    }
    
    
}

