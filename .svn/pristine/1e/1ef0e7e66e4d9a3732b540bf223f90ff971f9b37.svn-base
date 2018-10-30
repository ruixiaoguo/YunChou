//
//  YCTagsViewTableViewCell.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/28.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCTagsViewTableViewCell: UITableViewCell {

    private lazy var titleLable : UILabel = {
       let titleLable = UILabel()
        titleLable.textColor = YC_FontColor_102Gray
        titleLable.font = YC_FONT_PFSC_Regular(15)
        return titleLable
    }()
    
    private lazy var backvc : UIView = {
        let backvc = UIView()
        backvc.backgroundColor = UIColor.white
        return backvc
    }()
    
    private lazy var lin : UILabel = {
        let lin = UILabel()
        lin.backgroundColor = YCBackground_LightColor
        return lin
    }()
    
    var tempBtn : UIButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    //setrr
    var dataDic:NSDictionary?{
        didSet{
            guard let dic = dataDic else {return}
            titleLable.text = (dic.object(forKey: "title") as! String)
      
            
            if backvc.subviews.count > 0 {
                return
            }
            addTags(tagArr: dic.object(forKey: "content") as! NSArray)
            
        }
    }

    func addTags(tagArr:NSArray){
        var heights : CGFloat = 45
        var xx : CGFloat = 15
        var y : CGFloat = 15
        for indext in 0..<tagArr.count {
            let str : String = tagArr[indext] as! String
            let sizeW : CGFloat = getTextWidth(str , YC_FONT_PFSC_Medium(14) ,30) + 40.0
            let sizeH : CGFloat = 30.0
            if xx + sizeW > Main_Screen_Width - 20 {
                xx = 15.0
                y = y + sizeH + 15.0
                heights = heights + sizeH + 15.0
            }
            let tagBtn = UIButton.init(type: UIButton.ButtonType.custom)
            tagBtn.frame = CGRect(x: xx, y: y, width: sizeW, height: 30)
            tagBtn.setTitle(str, for: .normal)
            tagBtn.setTitleColor(YC_FontColor_45Dark, for: .normal)
            
            
            tagBtn.backgroundColor = YCBackground_LightColor
            tagBtn.titleLabel?.font = YC_FONT_PFSC_Medium(14)
            tagBtn.tag = indext + 100
            tagBtn.addTarget(self, action: #selector(tagBtnAction(btn:)), for: .touchUpInside)
            backvc.addSubview(tagBtn)
            xx = xx + sizeW + 10
        }
        
        let lins : UILabel = UILabel()
        backvc.addSubview(lins)
        lins.backgroundColor = UIColor.yellow
        lins.snp.makeConstraints { (make) in
            make.top.equalTo(heights)
            make.left.right.equalTo(0)
            make.height.equalTo(0)
            make.bottom.equalTo(0)
        }
        
//        upDataLayouts()
    }
    
    
    @objc func tagBtnAction(btn:UIButton){
        if (tempBtn == btn) {
            //不做处理
        } else {
            btn.backgroundColor = YC_Color_DarkBlue
            btn.setTitleColor(YCColorWhite, for: .normal)
            tempBtn.backgroundColor = YCBackground_LightColor
            tempBtn.setTitleColor(YC_FontColor_45Dark, for: .normal)

        }
        tempBtn = btn;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubViews(){
        self.addSubview(self.titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.left.equalTo(15)
            make.width.equalTo(160)
            make.height.equalTo(35)
        }
        
        self.addSubview(self.backvc)
        backvc.snp.makeConstraints { (make) in
            make.top.equalTo(titleLable.snp.bottom).offset(5)
            make.left.right.equalTo(0)
        }
        
        self.addSubview(self.lin)
        lin.snp.makeConstraints { (make) in
            make.top.equalTo(backvc.snp.bottom).offset(10)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(1)
            make.bottom.equalTo(-0)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
