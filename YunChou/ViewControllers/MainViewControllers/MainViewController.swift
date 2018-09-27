//
//  MainViewController.swift
//  YunChou
//
//  Created by grx on 2018/9/20.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import SwiftProgressHUD
import SwiftyJSON
import SwiftFCXRefresh

class MainViewController: BaseController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var mainTableView = UITableView(frame: CGRect(x: 0, y: -20, width: Main_Screen_Width, height: Main_Screen_Height), style: UITableView.Style.plain)
    /** 数据源 */
    var allArray:Array = [Any]()
    
    // MARK:=========视图将要显示时调用该方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    // MARK:=========当视图将要消失时调用该方法
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        //自动计算高度
        self.mainTableView.estimatedRowHeight = 44;
        self.mainTableView.rowHeight = UITableView.automaticDimension;
        //注册cell重用
        self.mainTableView .register(HomeTableCell.self, forCellReuseIdentifier: HomeCellIdentifier)
        self.view.addSubview(mainTableView)
    }
    
    //MARK:========tableViewDelegate协议代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:HomeCellIdentifier) as! HomeTableCell
//        cell.selectionStyle = .none
//        cell.getTitle(contain: allArray[indexPath.row])
        return cell
    }
    
   


}
