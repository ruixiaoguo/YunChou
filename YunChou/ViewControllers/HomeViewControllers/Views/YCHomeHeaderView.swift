//
//  YCHomeHeaderView.swift
//  YunChou
//
//  Created by yy on 2018/9/29.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import FSPagerView

class YCHomeHeaderView: UIView {

    typealias bonnerPageClickBlok = () ->Void
    var bonnerPageBlok:bonnerPageClickBlok?
    
    private var datas:NSArray?
    
    private lazy var pagerView : FSPagerView = {
        let pagerView = FSPagerView()
        pagerView.isUserInteractionEnabled = true
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.automaticSlidingInterval =  10000
        pagerView.isInfinite = true
        pagerView.interitemSpacing = 0
        //        pagerView.transformer = FSPagerViewTransformer(type: .crossFading)
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        return pagerView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubViews(){
        
        datas = ["yc_home_ad"]
        
        self.addSubview(self.pagerView)
        self.pagerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(170)
        }
        
        
        //        self.pagerView.itemSize = CGSize.init(width: YYScreenWidth-60, height: 140)
        
        
    }
    
    //MARK: 暂用，待优化。
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for tempView in self.subviews {
            if tempView.isKind(of: FSPagerView.self) {
                let button = tempView as! FSPagerView
                let newPoint = self.convert(point, to: button)
                if button.bounds.contains(newPoint) {
                    return true
                }
            }
        }
        return false
    }
}

extension YCHomeHeaderView:FSPagerViewDelegate,FSPagerViewDataSource{
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.datas?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage.init(named: self.datas?[index] as! String)
        //        cell.imageView?.kf.setImage(with: URL(string:(self.focus?.data?[index].cover)!))
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
        self.bonnerPageBlok?()
        
        print(index)
    }
    
}

