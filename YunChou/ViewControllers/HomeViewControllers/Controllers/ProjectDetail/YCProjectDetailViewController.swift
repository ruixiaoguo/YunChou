//
//  YCProjectDetailViewController.swift
//  YunChou
//
//  Created by yy on 2018/9/29.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCProjectDetailViewController: UIViewController {
    
    var projectID : String = ""
    
    private lazy var titles: [String] = {
        return ["项目介绍", "投资方案", "信息披露"]
    }()
    
    private lazy var viewControllers: [UIViewController] = [TwoTestViewController(),TwoTestViewController(),YCInfoOpenViewController()]
    
//    private lazy var projectHeader : YCProjectHeaderView = {
//       let project = YCProjectHeaderView.init(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: 548))
//        return project
//    }()
    
    
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.bottomLineHeight = 4.0
        layout.bottomLineCornerRadius = 2.0
        layout.isShowBackImage = false
        
        layout.titleViewBgColor = UIColor.white
        layout.scale = 1.1
        layout.titleColor = YC_FontColor_LightGray
        layout.titleSelectColor = YC_Color_DarkBlue
        layout.titleFont = YC_FONT_PFSC_Medium(15)
        layout.bottomLineColor = YC_Color_DarkBlue
        layout.isAverage = true
        layout.lrMargin = 30
        layout.sliderWidth = 18
        layout.toBottomHeight = 5
        layout.sliderHeight = 50
        /* 更多属性设置请参考 LTLayout 中 public 属性说明 */
        return layout
    }()

    private func managerReact() -> CGRect {
        return CGRect(x: 0, y: 0, width: Main_Screen_Width, height: Main_Screen_Height - 50-SafeBottomMargin)
    }
    
    private lazy var simpleManager: LTSimpleManager = {
        let simpleManager = LTSimpleManager(frame: managerReact(), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: self.layout)
        /* 设置代理 监听滚动 */
        simpleManager.delegate = self
        simpleManager.hoverY = StatusBarHeight
        return simpleManager
    }()
    
    
    private lazy var bottomView : YCProjectBottomView = {
       let bottom = YCProjectBottomView()
        return bottom
    }()
    
    private lazy var viewModel : YCHomeViewModel = {
       let vm = YCHomeViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(self.simpleManager)
        simpleManagerConfig()
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(50+SafeBottomMargin)
            make.bottom.equalTo(0)
        }
        
        loadDatas()
        
    }
    
    func loadDatas(){
        
        viewModel.requestHomePrjectDetail(pid: projectID, success: {
            
        }, failure: {
            
        }, error: {_ in 
            
        })
    }
    
    func setStatusBarBackgroundColor(color : UIColor) {
        let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
        let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }
}

extension YCProjectDetailViewController {
    
    //MARK: 具体使用请参考以下
    private func simpleManagerConfig() {
        //MARK: headerView设置
        simpleManager.configHeaderView {[weak self] in
            guard let strongSelf = self else { return nil }
            let headerView = strongSelf.headerView()
            return headerView
        }
        
        //MARK: pageView点击事件
        simpleManager.didSelectIndexHandle { (index) in
            print("点击了 \(index) 😆")
        }
        
    }
    
    @objc private func tapLabel(_ gesture: UITapGestureRecognizer)  {
        print("tapLabel☄")
    }
}

extension YCProjectDetailViewController: LTSimpleScrollViewDelegate {
    
    //MARK: 滚动代理方法
    func glt_scrollViewDidScroll(_ scrollView: UIScrollView) {
//                print("offset -> ", scrollView.contentOffset.y)
        if scrollView.contentOffset.y >= 548-StatusBarHeight{
            setStatusBarBackgroundColor(color: UIColor.white)
        }else{
            setStatusBarBackgroundColor(color: UIColor.clear)
        }
    }
    
    //MARK: 控制器刷新事件代理方法
    func glt_refreshScrollView(_ scrollView: UIScrollView, _ index: Int) {
        //注意这里循环引用问题。
//        scrollView.mj_header = MJRefreshNormalHeader {[weak scrollView] in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//                print("对应控制器的刷新自己玩吧，这里就不做处理了🙂-----\(index)")
//                scrollView?.mj_header.endRefreshing()
//            })
//        }
    }
}

extension YCProjectDetailViewController {
    private func headerView() -> YCProjectHeaderView {
        let project = YCProjectHeaderView.init(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: 328+kWidth(R: 220)))
        return project
    }
}
