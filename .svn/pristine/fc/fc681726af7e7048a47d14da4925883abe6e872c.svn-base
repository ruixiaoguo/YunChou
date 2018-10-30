//
//  YCInfoOpenViewController.swift
//  YunChou
//
//  Created by yy on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCInfoOpenViewController: BaseTableViewController{
    private let infoOpen = "infoOpen"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 50, width: Main_Screen_Width, height: view.bounds.height - 50 - StatusBarHeight - SafeBottomMargin - 50)
        tableView.backgroundColor = YCColorWhite
        tableView.register(YCInfoOpenTableViewCell.self, forCellReuseIdentifier: infoOpen)
        
        glt_scrollView = tableView
        // Do any additional setup after loading the view.
    }
    
    
    
    
    //tableview

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let vc = UIView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: 140))
        vc.backgroundColor = YCColorWhite
        let lb = UIImageView(frame: CGRect(x: 15, y: 10, width: Main_Screen_Width-30, height: 125))
        lb.image = UIImage(named: "yc_infoImage")
        vc.addSubview(lb)
        return vc
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YCInfoOpenTableViewCell = tableView.dequeueReusableCell(withIdentifier: infoOpen, for: indexPath) as! YCInfoOpenTableViewCell
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator//添加箭头

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
