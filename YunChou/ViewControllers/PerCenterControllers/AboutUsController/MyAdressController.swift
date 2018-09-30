//
//  MyAdressController.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyAdressController: BaseController,UITableViewDelegate,UITableViewDataSource {
    lazy var myAdressTableView = UITableView(frame: self.view.frame, style: .grouped)
    var allArray:Array = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "选择收货地址"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        //添加数据
        self.addDataSource()
        
        self.myAdressTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.myAdressTableView.delegate = self
        self.myAdressTableView.dataSource = self
        self.myAdressTableView.backgroundColor = YCColorLight
        //自动计算高度
        self.myAdressTableView.estimatedRowHeight = 70;
        self.myAdressTableView.rowHeight = UITableView.automaticDimension;
        //注册cell重用
        self.myAdressTableView .register(MyAdressCell.self, forCellReuseIdentifier: MyAdressCellIdentifier)
        self.view.addSubview(myAdressTableView)
        self.initFootView()
    }
    
    //MARK:========tableViewDelegate协议代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let adresCell = tableView.dequeueReusableCell(withIdentifier:MyAdressCellIdentifier) as! MyAdressCell
        adresCell.selectionStyle = .none
        adresCell.gaintPersionModel(model: self.allArray[indexPath.section] as! MyAdressModel)
        //选择地址
        adresCell.callSelectAdressBlock = {(button:UIButton) in
            for _i in 0..<self.allArray.count{
                let model:MyAdressModel = self.allArray[_i] as! MyAdressModel
                model.isSelectAdress = false
            }
            let model:MyAdressModel = self.allArray[indexPath.section] as! MyAdressModel
            model.isSelectAdress = !model.isSelectAdress
            self.myAdressTableView.reloadData()
        }
        //编辑地址
        adresCell.callEditAdressBlock = {(button:UIButton) in
            let addAdressVC = AddMyAdressController()
            addAdressVC.isEdit = true
            addAdressVC.editModel = self.allArray[indexPath.section] as! MyAdressModel
            self.navigationController?.pushViewController(addAdressVC, animated: true)
        }
        //删除地址
        adresCell.callDeleteAdressBlock = {(button:UIButton) in
            self.allArray .remove(at: indexPath.section)
            self.myAdressTableView.reloadData()
        }
        return adresCell
    }
    
    //添加新增按钮
    func initFootView() {
        let footView = MyFootButtonView()
        self.view.addSubview(footView)
        footView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-SafeBottomMargin)
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
        }
        footView.sureOvercallBlock = {() in
            let addAdressVC = AddMyAdressController()
            self.navigationController?.pushViewController(addAdressVC, animated: true)
        }
    }
    
    func addDataSource(){
        self.allArray.removeAll()
        for _ in 0..<3 {
            let model = MyAdressModel()
            model.title = "晓时代"
            model.phone = "15810662320"
            model.adressContent = "北京市朝阳区东三环北路28号博瑞大厦B座12层"
            model.isSelectAdress = false
            self.allArray.append(model)
        }
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}
