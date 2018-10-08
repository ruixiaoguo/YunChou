//
//  YCHomeViewController.swift
//  YunChou
//
//  Created by yy on 2018/9/29.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCHomeViewController: BaseController {

    private lazy var topNavBarView : YCHomeNavBarView = {
        let topNavBarView = YCHomeNavBarView.init(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: NaviBarHeight))
        topNavBarView.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
        return topNavBarView
    }()
    
    private lazy var viewControllers:[UIViewController] = {
        let oneVC = OneTestViewController()
        let twoVC = twoTestViewController()
        let threeVC = OneTestViewController()
        let fourVC = OneTestViewController()
        let fiveVC = OneTestViewController()
        
        return [oneVC, twoVC, threeVC, fourVC ,fiveVC]
    }()
    
    private lazy var titles: [String] = {
        return ["最新","预告","酒店","民宿","公寓"]
    }()
    
    private lazy var titleLayout:LTLayout = {
        let titleLayout = LTLayout()
        titleLayout.sliderWidth = 15.0
        titleLayout.isShowBackImage = true
        return titleLayout
    }()
    
    
    private func managerReact() -> CGRect{
//        let BarH = UIApplication.shared.statusBarFrame.size.height + 44
//
//        let H: CGFloat = iPhoneXS ? (view.bounds.height - BarH - 34) : view.bounds.height - BarH
//        return CGRect(x: 0, y: 0, width: view.bounds.width, height: H)
        
        return CGRect(x: 0, y: 0, width: Main_Screen_Width, height: Main_Screen_Height - YC_TabbarHeight)
    }
    
    
    private lazy var advancedManager:LTAdvancedManager = {
        let advancedManager = LTAdvancedManager(frame: managerReact(), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: titleLayout, headerViewHandle: {[weak self] in
            guard let strongSelf = self else {return UIView()}
            
            let headerView = strongSelf.headerView
            return headerView
        })
        
        advancedManager.delegate = self
        advancedManager.hoverY = NaviBarHeight
        advancedManager.isClickScrollAnimation = true
        
        return advancedManager
    }()
    
    
    lazy var headerView : YCHomeHeaderView = {
        let headerView = YCHomeHeaderView.init(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: 170))
        headerView.backgroundColor = UIColor.white
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "投资"
        self.view.backgroundColor = UIColor.white
        view.addSubview(advancedManager)
        advancedManagerConfig()
        
        view.addSubview(topNavBarView)
        
        someBlokHandel()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    func someBlokHandel(){
        topNavBarView.searchBlock = {
            print("souzuo")
            
            
            
            let vc = YCSearchViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        topNavBarView.messageBlock = {
            print("xiaoxi")
            let vc = YCMessageViewController()
            vc.hidesBottomBarWhenPushed = true
         self.navigationController?.setNavigationBarHidden(false, animated: true)

            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        headerView.bonnerPageBlok = {
            let vc = YCInvestPlanViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   
    
}

extension YCHomeViewController:LTAdvancedScrollViewDelegate{
    
    //MARK: 具体使用请参考以下
    private func advancedManagerConfig() {
        //MARK: 选中事件
        advancedManager.advancedDidSelectIndexHandle = {
            print("选中了 -> \($0)")
            
        }
        
    }
    
    func glt_scrollViewOffsetY(_ offsetY: CGFloat) {
        if (offsetY > NaviBarHeight) {
            let alpha = (offsetY - NaviBarHeight) / NaviBarHeight
            topNavBarView.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: alpha)
        } else {
            topNavBarView.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
        }
    }
    
}
//extension YCHomeViewController {
//    private func testLabel() -> YCHomeHeaderView {
//        let headerView = YCHomeHeaderView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 170))
//        headerView.backgroundColor = UIColor.white
//        return headerView
//
//    }
//}

