//
//  SMSCodeView.swift
//  YunChou
//  发送验证码
//  Created by grx on 2018/9/28.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class SMSCodeView: UIView {
    let smsButton = UIButton(type:.custom)
    var sendCodeBlock:(()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    func initUi() {
        smsButton.setTitle("获取验证码", for: .normal)
        smsButton.setTitleColor(YCColorLightBlack, for: .normal)
        smsButton.titleLabel?.font = YC_FONT_PFSC_Medium(14)
        self.addSubview(smsButton)
        smsButton.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(40)
        }
        smsButton.addTarget(self, action:#selector(smsButtonClick(_:)), for:.touchUpInside)
    }
    
    @objc func smsButtonClick(_ button:UIButton){
        //调用方法
        sendCodeBlock!()
    }
    
    //验证码倒计时
     func countDown(timeOut:Int){
        //倒计时时间
        var timeout = timeOut
        let queue:DispatchQueue = DispatchQueue.global(qos: .default)
        // 在global线程里创建一个时间源
        let codeTimer = DispatchSource.makeTimerSource(queue:queue)
        codeTimer.schedule(deadline: .now(), repeating:.seconds(1))
        //每秒执行
        codeTimer.setEventHandler(handler: { () -> Void in
            if(timeout<=0){ //倒计时结束，关闭
                codeTimer.cancel()
                DispatchQueue.main.sync(execute: { () -> Void in
                    //设置界面的按钮显示 根据自己需求设置
                    self.smsButton.setTitle("重新发送", for: UIControl.State.normal)
                    self.smsButton.isUserInteractionEnabled = true
                    self.smsButton.setTitleColor(YCColorBlue, for: .normal)
                })
            }else{//正在倒计时
                let seconds = timeout
                let strTime = NSString.localizedStringWithFormat("%.d", seconds)
                DispatchQueue.main.sync(execute: { () -> Void in
                    //                    NSLog("----%@", NSString.localizedStringWithFormat("%@S", strTime) as String)
                    UIView.beginAnimations(nil, context: nil)
                    UIView.setAnimationDuration(1)
                    //设置界面的按钮显示 根据自己需求设置
                    self.smsButton.setTitle(NSString.localizedStringWithFormat("%@S", strTime) as String, for: UIControl.State.normal)
                    UIView.commitAnimations()
                    self.smsButton.isUserInteractionEnabled = false
                    self.smsButton.setTitleColor(YCColorBlue, for: .normal)
                })
                timeout -= 1;
            }
        })
        codeTimer.resume()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
