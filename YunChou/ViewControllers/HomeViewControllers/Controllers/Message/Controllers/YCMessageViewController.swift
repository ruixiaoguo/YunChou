//
//  YCMessageViewController.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/27.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCMessageViewController: BaseController {

    private let messageCell = "messageCell"
    
    let titleArr : NSArray = [["title":"站内信","icon":"yc_message_system"],
                              ["title":"项目消息","icon":"yc_message_project"],
                              ["title":"账户消息","icon":"yc_message_account"]
                              ]
    var dataArr :  NSArray = []
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(YCMessageTableViewCell.self, forCellReuseIdentifier: messageCell)
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
            
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
//        tableView.estimatedRowHeight = 44.0
        
//        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView
    }()
   
    lazy var viewModel: YCMessageViewModel = {
        return YCMessageViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "消息"
        self.leftView.isHidden = false
    
        view.addSubview(self.tableView)
        view.backgroundColor = YCColorLight
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(NaviBarHeight)
            make.left.right.equalTo(view).offset(0)
            make.height.equalTo(Main_Screen_Height - NaviBarHeight)
        }
        
        
        loadData()

        // Do any additional setup after loading the view.
    }
    
    //加载数据
    func loadData(){
        viewModel.requestMessageSummaryList(success: {
            self.dataArr = [["content":self.viewModel.messageSummaryList?.mcontent,"status":self.viewModel.messageSummaryList?.mstatus,"Time":self.viewModel.messageSummaryList?.mTime],
                            ["content":self.viewModel.messageSummaryList?.pcontent,"status":self.viewModel.messageSummaryList?.pstatus,"Time":self.viewModel.messageSummaryList?.pTime],
                            ["content":self.viewModel.messageSummaryList?.econtent,"status":self.viewModel.messageSummaryList?.estatus,"Time":self.viewModel.messageSummaryList?.eTime]
                           ]
            
            self.tableView.reloadData()
            
        })
    }
 
}

extension YCMessageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCMessageTableViewCell = tableView.dequeueReusableCell(withIdentifier: messageCell, for: indexPath) as! YCMessageTableViewCell
        
        cell.titleDic = (titleArr[indexPath.row] as! NSDictionary)
        cell.dataDic = (dataArr[indexPath.row] as! NSDictionary)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        if indexPath.row == 2 {
          let vc =  YCSystemMessageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            let vc = YCProjectMessageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = YCAccountMessageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
