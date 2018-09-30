//
//  AddMyAdressController.swift
//  YunChou
//
//  Created by grx on 2018/9/27.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class AddMyAdressController: BaseController {
    
    var isEdit = false
    var editModel = MyAdressModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = isEdit ? "编辑地址" : "新增地址"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.initContentView()
        self.initFootView()
    }
    
    //添加内容模块
    func initContentView() {
        let contentView = AddAdressView()
        self.view.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(NaviBarHeight)
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(310)
        }
        //编辑状态回显数据
        if(self.isEdit){
            contentView.gaintAdressModel(model: self.editModel)
        }
        //选择性别
        contentView.callSelSexBlock = {(_ buttonTag:Int) in
            
        }
        //选择地址
        contentView.callSelAdressBlock = {() in
            let selectAdressVC = SelectAdressController()
            self.navigationController?.pushViewController(selectAdressVC, animated: true)
        }
        //设置默认地址
        contentView.callSelDefauleBlock = {(_ isOpen:Bool) in
            
        }
    }
    
    //添加保存按钮
    func initFootView() {
        let footView = MyFootButtonView()
        footView.sureOverBtn.setTitle("保存并使用", for: .normal)
        self.view.addSubview(footView)
        footView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-SafeBottomMargin)
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
        }
        footView.sureOvercallBlock = {() in
            
        }
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}
