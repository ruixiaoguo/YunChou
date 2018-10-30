
//
//  YCNumberButton.swift
//  YunChou
//
//  Created by yy on 2018/10/9.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCNumberButton: UIView {

    //传值block
    typealias numberHaseChanged = (_ numStr : String?) -> Void
    var numberHasChangedBlolc : numberHaseChanged?
    
    @objc public var currentNum : String = "1"
    @objc public var minMum : String = "1"
    @objc public var maxNum : String = "99"
    
    
    //减
    private lazy var decreaseBtn : UIButton = {
        let decreaseBtn = UIButton()
        decreaseBtn.setImage(UIImage.init(named: "yc_order_dec"), for: .normal)
        decreaseBtn.addTarget(self, action: #selector(decreaseBtnHandel(sender:)), for: .touchUpInside)
        return decreaseBtn
    }()
    //加
    private lazy var increaseBtn : UIButton = {
        let increaseBtn = UIButton()
        increaseBtn.setImage(UIImage.init(named: "yc_order_add"), for: .normal)
        increaseBtn.addTarget(self, action: #selector(increaseBtnHandel(sender:)), for: .touchUpInside)
        return increaseBtn
    }()
    //展示框
    private lazy var textTF : UITextField = {
        let textTF = UITextField()
//        textTF.delegate = self
//        textTF.endEditing(false)
        textTF.isUserInteractionEnabled = false
        textTF.textColor = YC_Color_DarkBlue
        textTF.textAlignment = NSTextAlignment.center
        textTF.keyboardType = UIKeyboardType.numberPad
        textTF.font = YC_FONT_PFSC_Semibold(16)
        textTF.text = currentNum;
        textTF.addTarget(self, action: #selector(textChange(textField:)), for: UIControl.Event.editingChanged)
        return textTF
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    //减
    @objc func decreaseBtnHandel(sender:UIButton){
        let num = Int(textTF.text!)! - 1
        let min = Int(minMum)!
        if num < min {
            shakeAnimationMethod()
        }else{
            textTF.text = "\(num)"
        }
        if numberHasChangedBlolc != nil {
            numberHasChangedBlolc!(textTF.text)
        }

    }
    //加
    @objc func increaseBtnHandel(sender:UIButton){
        let num = Int(textTF.text!)! + 1
        let max = Int(maxNum)!
        if num > max {
            shakeAnimationMethod()
        }else{
            textTF.text = "\(num)"
        }
        if numberHasChangedBlolc != nil {
            numberHasChangedBlolc!(textTF.text)
        }

    }
    //b
    @objc func textChange(textField : UITextField){
        
    }
    
    func shakeAnimationMethod(){
        let animation : CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position.x")
        let positionX = self.layer.position.x
        animation.values = [(positionX - 10),positionX,(positionX + 10)]
        animation.repeatCount = 3
        animation.duration = 0.07
        animation.autoreverses = true
        self.layer.add(animation, forKey: nil)
    }
    
    
   
   func createSubViews(){
    self.addSubview(self.decreaseBtn)
    decreaseBtn.snp.makeConstraints { (make) in
        make.left.top.equalTo(3)
        make.width.height.equalTo(24)
    }
    self.addSubview(self.increaseBtn)
    increaseBtn.snp.makeConstraints { (make) in
        make.top.equalTo(3)
        make.right.equalTo(-3)
        make.width.height.equalTo(24)
    }
    self.addSubview(self.textTF)
    textTF.snp.makeConstraints { (make) in
        make.top.bottom.equalTo(0)
        make.left.equalTo(decreaseBtn.snp.right).offset(5)
        make.right.equalTo(increaseBtn.snp.left).offset(-5)
    }
    
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
