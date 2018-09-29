//
//  YCSearchBoxView.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/27.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit



@objc protocol YCSearchBoxViewDelegate {
    func searchBoxText(str:String)
    func searchTextFieldDidBeginEditing()
    func searchBoxCancelBtnClick()

}


class YCSearchBoxView: UIView {
    
    weak var myDelegate:YCSearchBoxViewDelegate?
    
    
    private lazy var backVC : UIView = {
        let backVC = UIView()
        backVC.backgroundColor = YCBackground_LightColor
        return backVC
    }()

    private lazy var searchImage : UIImageView = {
      let searchImage = UIImageView()
        searchImage.image = UIImage(named: "搜索")
        return searchImage
    }()
    
    private lazy var inputTF : UITextField = {
       let inputTF = UITextField()
        inputTF.placeholder = "请输入项目名称"
        inputTF.font = YC_FONT_PFSC_Medium(15)
        inputTF.delegate = self
        inputTF.returnKeyType = UIReturnKeyType.search
        return inputTF
    }()
    
    private lazy var cancelBtn : UIButton = {
        let cancelBtn = UIButton.init(type: UIButton.ButtonType.custom)
        cancelBtn.backgroundColor = UIColor.white
        cancelBtn.setTitle("取消", for: UIControl.State.normal)
        cancelBtn.titleLabel?.font = YC_FONT_PFSC_Medium(16)
        cancelBtn.setTitleColor(YC_FontColor_45Dark, for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancelBtnHandel), for: .touchUpInside)
        return cancelBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        createSubViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func cancelBtnHandel(){
        myDelegate?.searchBoxCancelBtnClick()
    }
    
    func createSubViews(){
        self.addSubview(self.backVC)
        backVC.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(5)
            make.height.equalTo(33)
            make.left.equalTo(self).offset(12)
            make.right.equalTo(self).offset(-70)
        }
        
        backVC.layer.cornerRadius = 33/2
        
        backVC.addSubview(self.searchImage)
        searchImage.snp.makeConstraints { (make) in
            make.left.equalTo(backVC).offset(12)
            make.centerY.equalTo(backVC.snp.centerY)
            make.width.height.equalTo(18)
        }
        
        backVC.addSubview(self.inputTF)
        inputTF.snp.makeConstraints { (make) in
            make.left.equalTo(searchImage.snp.right).offset(8)
            make.top.bottom.right.equalTo(0)
        }
        
        self.addSubview(self.cancelBtn)
        cancelBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-14)
            make.top.equalTo(5)
            make.width.equalTo(50)
            make.height.equalTo(33)
        }
        
        let lin = UILabel()
        lin.backgroundColor = YCBackground_LightColor
        self.addSubview(lin)
        lin.snp.makeConstraints { (make) in
            make.bottom.equalTo(1)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        
        
    }

}

extension YCSearchBoxView:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        let str : String = textField.text!
        if str.count > 0{
            myDelegate?.searchBoxText(str: textField.text!)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTF.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        myDelegate?.searchTextFieldDidBeginEditing()
    }
}

