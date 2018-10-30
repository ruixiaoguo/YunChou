//
//  YCNewsHeaderView.swift
//  YunChou
//
//  Created by yy on 2018/10/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import FSPagerView

class YCNewsHeaderView: UIView {
    typealias bonnerPageClickBlok = () ->Void
    var bonnerPageBlok:bonnerPageClickBlok?
    
    
    private var datas:NSArray?
    
    private lazy var pagerView : FSPagerView = {
        let pagerView = FSPagerView()
        pagerView.isUserInteractionEnabled = true
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.automaticSlidingInterval =  5
        pagerView.isInfinite = true
        pagerView.interitemSpacing = 5
        //        pagerView.transformer = FSPagerViewTransformer(type: .crossFading)
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        return pagerView
    }()
    
    private lazy var pageControl : FSPageControl = {
        let pageControl = FSPageControl()
        // 设置下标的个数
        pageControl.interitemSpacing = 9
        //设置下标位置
        pageControl.contentHorizontalAlignment = .right
        //设置下标指示器颜色（选中状态和普通状态）
        pageControl.setFillColor(.white, for: .normal)
        pageControl.setFillColor(.gray, for: .selected)
      
        return pageControl
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubViews(){
        
//        datas = ["yc_home_ad","yc_infoImage"]
        
        self.addSubview(self.pagerView)
        pagerView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
        self.addSubview(self.pageControl)
//        pageControl.backgroundColor = UIColor.yellow
        pageControl.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.bottom.equalTo(0)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        pageControl.contentInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    func reloadBanner(arr : NSArray){
        datas = arr
        pageControl.numberOfPages = datas?.count ?? 0
        pagerView.reloadData()

    }
    

}


extension YCNewsHeaderView:FSPagerViewDelegate,FSPagerViewDataSource{
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.datas?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let model:YCNewsBannerDataModel = self.datas?[index] as! YCNewsBannerDataModel
        cell.imageView?.sd_setImage(with: URL.init(string: model.img!), placeholderImage: placeholderImg(), options: [], context: nil)
        cell.textLabel?.text = model.title
        cell.textLabel?.font = YC_FONT_PFSC_Semibold(15)

        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: false)
        pagerView.scrollToItem(at: index, animated: false)
        self.bonnerPageBlok?()
//        pageControl.currentPage = index
        print(index)
    }
    
    
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
       pageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
    }
    
  
    
    
}

