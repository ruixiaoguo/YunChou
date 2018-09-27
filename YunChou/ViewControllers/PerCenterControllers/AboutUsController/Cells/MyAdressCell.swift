//
//  MyAdressCell.swift
//  YunChou
//
//  Created by grx on 2018/9/27.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyAdressCell: UITableViewCell {
    var callSelectAdressBlock:((_ button:UIButton)->Void)?
    var callEditAdressBlock:((_ button:UIButton)->Void)?
    var callDeleteAdressBlock:((_ button:UIButton)->Void)?

    //收货人名称
    private lazy var nameLabel:UILabel = UILabel()
    //收货人手机号
    private lazy var phoneLable:UILabel = UILabel()
    //收货地址
    private lazy var adressLable:UILabel = UILabel()
    //分割线
    private lazy var lineView:UIView = UIView()
    //设置默认图片
    private lazy var selectAdressBtn:UIButton = UIButton()
    //编辑
    private lazy var editeButton:UIButton = UIButton()
    //删除
    private lazy var deleteButton:UIButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //收货人名称
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = YCColorBlack
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.right.equalTo(-150)
        })
        //收货人手机号
        phoneLable.font = UIFont.systemFont(ofSize: 16)
        phoneLable.textColor = YCColorBlack
        phoneLable.textAlignment = NSTextAlignment.right
        contentView.addSubview(phoneLable)
        phoneLable.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.width.equalTo(150)
            make.right.equalTo(-15)
        })
        //收货人地址
        adressLable.font = UIFont.systemFont(ofSize: 14)
        adressLable.textColor = YCColorDarkLight
        adressLable.numberOfLines = 0
        contentView.addSubview(adressLable)
        adressLable.snp.makeConstraints({ (make) in
            make.top.equalTo(phoneLable.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-60)
        })
        //分割线
        lineView.backgroundColor = YCColorLight
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.top.equalTo(adressLable.snp.bottom).offset(15)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.height.equalTo(1)
        })
        //设置默认地址
        self.addSubview(selectAdressBtn)
        selectAdressBtn .setImage(UIImage(named:"adress_nol"), for: .normal)
        selectAdressBtn .setImage(UIImage(named:"adress_sel"), for: .selected)
        selectAdressBtn .setTitle("设为默认地址", for: .normal)
        selectAdressBtn .yc_locationAdjust(buttonMode: .Left, spacing: 20)
        selectAdressBtn .setTitleColor(YCColorDarkLight, for: .normal)
        selectAdressBtn .titleLabel?.font = UIFont.systemFont(ofSize: 14)
        selectAdressBtn.addTarget(self, action:#selector(selectAdressClick(_:)), for:.touchUpInside)
        selectAdressBtn.snp.makeConstraints({ (make) in
            make.top.equalTo(lineView.snp.bottom).offset(0)
            make.left.equalTo(-4)
            make.width.equalTo(140)
            make.height.equalTo(45)
        })
        //删除地址
        self.addSubview(deleteButton)
        deleteButton .setImage(UIImage(named:"delete"), for: .normal)
        deleteButton .setTitle("删除", for: .normal)
        deleteButton .yc_locationAdjust(buttonMode: .Left, spacing: 20)
        deleteButton .setTitleColor(YCColorBlack, for: .normal)
        deleteButton .titleLabel?.font = UIFont.systemFont(ofSize: 14)
        deleteButton.addTarget(self, action: #selector(deletClick(_:)), for: .touchUpInside)
        deleteButton.snp.makeConstraints({ (make) in
            make.top.equalTo(lineView.snp.bottom).offset(0)
            make.right.equalTo(-15)
            make.width.equalTo(80)
            make.height.equalTo(45)
        })
        //编辑地址
        self.addSubview(editeButton)
        editeButton .setImage(UIImage(named:"edite"), for: .normal)
        editeButton .setTitle("编辑", for: .normal)
        editeButton .yc_locationAdjust(buttonMode: .Left, spacing: 20)
        editeButton .setTitleColor(YCColorBlack, for: .normal)
        editeButton .titleLabel?.font = UIFont.systemFont(ofSize: 14)
        editeButton.addTarget(self, action: #selector(editeClick(_:)), for: .touchUpInside)
        editeButton.snp.makeConstraints({ (make) in
            make.top.equalTo(lineView.snp.bottom).offset(0)
            make.right.equalTo(deleteButton.snp.left).offset(0)
            make.width.equalTo(80)
            make.height.equalTo(45)
        })
    }
    
    internal func gaintPersionModel(model:MyAdressModel) {
        nameLabel.text = "\(model.title)"
        phoneLable.text = "\(model.phone)"
        adressLable.text = "\(model.adressContent)"
        nameLabel.text = "\(model.title)"
        selectAdressBtn.isSelected = model.isSelectAdress
    }
    
    //MARK:=====选择默认地址
    @objc func selectAdressClick(_ button:UIButton){
        callSelectAdressBlock!(button)
    }
    
    //MARK:=====删除地址
    @objc func deletClick(_ button:UIButton){
        callDeleteAdressBlock!(button)
    }
    
    //MARK:=====编辑地址
    @objc func editeClick(_ button:UIButton){
        callEditAdressBlock!(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
