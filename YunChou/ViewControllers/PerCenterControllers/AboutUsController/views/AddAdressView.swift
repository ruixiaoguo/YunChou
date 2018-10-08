//
//  AddAdressView.swift
//  YunChou
//
//  Created by grx on 2018/9/27.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class AddAdressView: UIView,UITextFieldDelegate {
    
    var callSelDefauleBlock:((_ isOpen:Bool)->Void)?
    var callSelSexBlock:((_ buttonTag:Int)->Void)?
    var callSelAdressBlock:(()->Void)?

    let linkTitle = UILabel() //联系人标题
    let linkTextField = UITextField() //联系人
    let lineView = UIView()
    let lineGrayView = UIView()

    let selSwitch = UISwitch()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    func initUi() {
        //联系人标题
        linkTitle.text = "联系人"
        linkTitle.font = UIFont.systemFont(ofSize: 14)
        linkTitle.textColor = YCColorBlack
        self.addSubview(linkTitle)
        linkTitle.snp.makeConstraints({ (make) in
            make.top.equalTo(25)
            make.left.equalTo(15)
            make.width.equalTo(50)
        })
        //联系人
        linkTextField.placeholder = "姓名"
        linkTextField.clearButtonMode = .never
        linkTextField.setModifyClearButton()// 添加自定义清除按钮
        linkTextField.font = UIFont.systemFont(ofSize: 14)
        linkTextField.textColor = YCColorBlack
        self.addSubview(linkTextField)
        linkTextField.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.left.equalTo(linkTitle.snp.right).offset(15)
            make.right.equalTo(-15)
            make.height.equalTo(40)
        })
        //分割线
        lineView.backgroundColor = YCColorLight
        self.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.top.equalTo(linkTextField.snp.bottom).offset(5)
            make.left.equalTo(75)
            make.right.equalTo(-0)
            make.height.equalTo(1)
        })
        //选择性别
        let sexArray:Array = ["先生","女士"]
        for i in 0..<2{
            let sexButton = UIButton()
            sexButton.setTitle(sexArray[i], for: .normal)
            sexButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            sexButton.layer.borderWidth = 1
            sexButton.layer.cornerRadius = 3
            sexButton.layer.borderColor = YCColorDarkLight.cgColor
            sexButton.setTitleColor(YCColorBlack, for: .normal)
            sexButton.tag = i+10
            self.addSubview(sexButton)
            sexButton.addTarget(self, action: #selector(sexSelectClick(_:)), for: .touchUpInside)
            sexButton.snp.makeConstraints({ (make) in
                make.top.equalTo(lineView.snp.bottom).offset(10)
                make.left.equalTo(75+i*90)
                make.width.equalTo(80)
                make.height.equalTo(30)
            })
            if(sexButton.tag==10){
                sexButton.setTitleColor(YCColorBlue, for: .normal)
                sexButton.layer.borderColor = YCColorBlue.cgColor
            }
        }
        for i in 0..<3 {
            let lineView1 = UIView()
            lineView1.backgroundColor = YCColorLight
            self.addSubview(lineView1)
            lineView1.snp.makeConstraints({ (make) in
                make.top.equalTo(lineView.snp.bottom).offset(50+i*45)
                make.left.equalTo(0)
                make.right.equalTo(-0)
                make.height.equalTo(1)
            })
        }
        //标题
        let titleArray:Array = ["电话","地址","门牌号"]
        for i in 0..<3 {
            let titleLable = UILabel()
            titleLable.textColor = YCColorBlack
            titleLable.font = UIFont.systemFont(ofSize: 14)
            titleLable.text = titleArray[i]
            self.addSubview(titleLable)
            titleLable.snp.makeConstraints({ (make) in
                make.top.equalTo(lineView.snp.bottom).offset(50+i*45)
                make.left.equalTo(15)
                make.width.equalTo(50)
                make.height.equalTo(45)
            })
        }
        //输入框
        let textArray:Array = ["手机号码","选择收货地址","例：5单元1002室"]
        for i in 0..<3 {
            let textfeild = UITextField()
            textfeild.textColor = YCColorBlack
            textfeild.clearButtonMode = .never
            textfeild.setModifyClearButton()// 添加自定义清除按钮
            textfeild.font = UIFont.systemFont(ofSize: 14)
            textfeild.placeholder = textArray[i]
            self.addSubview(textfeild)
            textfeild.tag = i+100
            textfeild.snp.makeConstraints({ (make) in
                make.top.equalTo(lineView.snp.bottom).offset(50+i*45)
                make.left.equalTo(80)
                make.right.equalTo(-30)
                make.height.equalTo(45)
            })
            if(textfeild.tag==101){
                textfeild.delegate = self
            }
        }
        //小箭头
        let arrowImage = UIImageView()
        arrowImage.contentMode = .scaleAspectFill
        arrowImage.clipsToBounds = true
        self.addSubview(arrowImage)
        arrowImage.image = UIImage(named: "persionArrow")
        arrowImage.snp.makeConstraints { (make) in
            make.top.equalTo(165)
            make.right.equalTo(-15)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        //分割线
        lineGrayView.backgroundColor = YCColorLight
        self.addSubview(lineGrayView)
        lineGrayView.snp.makeConstraints({ (make) in
            make.top.equalTo(lineView.snp.bottom).offset(190)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.height.equalTo(10)
        })
        //设置默认地址
        let defauleAdress = UILabel()
        defauleAdress.text = "设为默认地址"
        defauleAdress.font = UIFont.systemFont(ofSize: 14)
        defauleAdress.textColor = YCColorBlack
        self.addSubview(defauleAdress)
        defauleAdress.snp.makeConstraints({ (make) in
            make.top.equalTo(lineGrayView.snp.bottom).offset(0)
            make.left.equalTo(15)
            make.right.equalTo(-150)
            make.height.equalTo(45)
        })
        //设置开关
        self.addSubview(selSwitch)
        selSwitch.isOn = false
        selSwitch.snp.makeConstraints({ (make) in
            make.top.equalTo(lineGrayView.snp.bottom).offset(10)
            make.right.equalTo(-15)
        })
        //设置开状态下的颜色
        selSwitch.onTintColor = YCColorBlue
        selSwitch.addTarget(self, action: #selector(switchDidChange), for: UIControl.Event.valueChanged)
    }
    
    //选择性别
    @objc func sexSelectClick(_ button:UIButton){
        for i in 0..<2 {
            let btn:UIButton = self.viewWithTag(i+10) as! UIButton
            btn.layer.borderColor = YCColorDarkLight.cgColor
            btn.setTitleColor(YCColorBlack, for: .normal)
            btn.isSelected = false
        }
        button.layer.borderColor = YCColorBlue.cgColor
        button.setTitleColor(YCColorBlue, for: .normal)
        callSelSexBlock!(button.tag)
    }
    
    //选择地址
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        self.PickUpKeyboard()
        callSelAdressBlock!()
    }
    
    //UISwitch监听方法
    @objc func switchDidChange() {
        callSelDefauleBlock!(selSwitch.isOn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.PickUpKeyboard()
    }
    
    func PickUpKeyboard() {
        for i in 0..<3 {
            let textField:UITextField = self.viewWithTag(i+100) as! UITextField
            textField.resignFirstResponder()
            linkTextField.resignFirstResponder()
        }
    }
    
    internal func gaintAdressModel(model:MyAdressModel) {
        linkTextField.text = model.title
        let phoneField:UITextField = self.viewWithTag(100) as! UITextField
        phoneField.text = model.phone
        let adressField:UITextField = self.viewWithTag(102) as! UITextField
        adressField.text = model.adressContent
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
