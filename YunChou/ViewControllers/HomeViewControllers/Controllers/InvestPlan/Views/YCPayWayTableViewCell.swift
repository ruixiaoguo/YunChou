//
//  YCPayWayTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCPayWayTableViewCell: UITableViewCell {

    private lazy var iconImage : UIImageView = {
       let img = UIImageView()
        return img
    }()
    private lazy var titleLB : UILabel = {
        let lb = UILabel()
        lb.textColor = YC_FontColor_45Dark
        lb.font = YC_FONT_PFSC_Medium(14)
        return lb
    }()
    private lazy var selectBtn : UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(named: "yc_order_normal"), for: .normal)
        btn.isUserInteractionEnabled = false
        return btn
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    var dataDic:NSDictionary?{
        didSet{
            guard let dic = dataDic else {return}
            titleLB.text = (dic.object(forKey: "title") as! String)
            iconImage.image = UIImage(named: (dic.object(forKey: "icon") as! String))
        }
    }
    
    func changeIconImage(bol : Bool){
        if bol {
            selectBtn.setImage(UIImage(named: "yc_order_select"), for: .normal)
        }else{
            selectBtn.setImage(UIImage(named: "yc_order_normal"), for: .normal)

        }
    }
    
    func createSubViews(){
        self.addSubview(self.iconImage)
        iconImage.snp.makeConstraints { (make) in
            make.top.equalTo(11)
            make.left.equalTo(15)
            make.width.height.equalTo(30)
        }
        self.addSubview(self.titleLB)
        titleLB.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(iconImage.snp.right).offset(15)
            make.width.equalTo(160)
        }
        self.addSubview(self.selectBtn)
        selectBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.width.height.equalTo(19)
            make.centerY.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
