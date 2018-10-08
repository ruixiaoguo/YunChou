//
//  RiskAssessController.swift
//  YunChou
//
//  Created by grx on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class RiskAssessController: BaseController {
    let bgImage = UIImageView()
    let footView = MyFootButtonView()

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
        self.view.addSubview(bgImage)
        bgImage.image = UIImage(named: "Risk")
        bgImage.snp.makeConstraints { (make) in
            make.top.equalTo(NaviBarHeight)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.height.equalTo(Main_Screen_Height/2-50)
        }
        self.creatBackButton()
        self.initRiskButton()
        self.initRiskstruction()
    }
    

    func creatBackButton() {
        let navBarView = UIView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: NaviBarHeight))
        navBarView.backgroundColor = UIColor(patternImage: UIImage(named:"navDarkBlue")!)
        self.view.addSubview(navBarView)
        //标题
        let titleLable = UILabel()
        titleLable.textColor = YCColorWhite
        titleLable.text = "风险评测"
        titleLable.font = YC_FONT_PFSC_Semibold(20)
        titleLable.textAlignment = NSTextAlignment.center
        navBarView.addSubview(titleLable)
        titleLable.frame = CGRect(x:100, y:StatusBarHeight, width:Main_Screen_Width-200, height:50)
        //自定义返回按钮
        let leftView = UIButton(type: .custom);
        leftView.frame = CGRect(x:0, y:StatusBarHeight, width:100, height:50)
        leftView.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let button =   UIButton(type: .custom)
        button.frame = CGRect(x:25, y:10, width:30, height:30)
        button.setBackgroundImage(UIImage(named:"back_white"), for: .normal)
        button.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        leftView.addSubview(button)
        navBarView.addSubview(leftView)
    }
    
    //添加立即邀请按钮
    func initRiskButton() {
        self.view.addSubview(footView)
        footView.sureOverBtn.setTitle("开始评测", for: .normal)
        let hight:CGFloat = kWidth(R: Main_Screen_Height/2+70)
        footView.snp.makeConstraints { (make) in
            make.top.equalTo(hight)
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
        }
        footView.sureOverBtn.layer.cornerRadius = 25
        footView.sureOverBtn.snp.updateConstraints { (make) in
            make.right.equalTo(-50)
            make.left.equalTo(50)
            make.height.equalTo(50)
        }
        footView.sureOvercallBlock = {[unowned self]() in
            
        }
    }
    
    //添加测试说明
    func initRiskstruction() {
        //标签
        let tagImage = UIImageView()
        tagImage.contentMode = .scaleAspectFill
        tagImage.clipsToBounds = true
        tagImage.image = UIImage(named: "tag")
        self.view.addSubview(tagImage)
        tagImage.snp.makeConstraints { (make) in
            make.top.equalTo(footView.snp.bottom).offset(25)
            make.left.equalTo(25)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        //名称
        let tagLable = UILabel()
        let contentStr:String = "为便于您了解自身的风险承受能力，选择合适的投资产品和服务。请填写一下风险承受能力评估问卷。评估结果仅供参考，不构成投资建议。我们建议您持续做好o动态评估，并s承诺保护您的所有个人隐私。"
        tagLable.font = UIFont.systemFont(ofSize: 14)
        tagLable.numberOfLines = 0
        tagLable.textColor = gof_ColorWithHex(0x9898A3)
        self.view.addSubview(tagLable)
        tagLable.snp.makeConstraints({ (make) in
            make.top.equalTo(footView.snp.bottom).offset(25)
            make.left.equalTo(tagImage.snp.right).offset(10)
            make.right.equalTo(-30)
        })
        tagLable.attributedText = YC_FONT_RowSpacing(10,UIFont.systemFont(ofSize: 14),contentStr)
    }

    override func backToPrevious() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
