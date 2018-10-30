//
//  YCRefresh.swift
//  YunChou
//
//  Created by yy on 2018/10/23.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

extension UIScrollView {
    var YCHead: MJRefreshHeader {
        get { return mj_header }
        set { mj_header = newValue }
    }
    
    var YCFoot: MJRefreshFooter {
        get { return mj_footer }
        set { mj_footer = newValue }
    }
    
    func endRefresh(){
        YCHead.endRefreshing()
        YCFoot.endRefreshing()
    }
}



class YCRefreshHeader: MJRefreshNormalHeader {
    override func prepare() {
        super.prepare()
        
    }
}


class YCRefreshFooter: MJRefreshAutoNormalFooter {
    override func prepare() {
        super.prepare()
//        stateLabel.text = ""
//        triggerAutomaticallyRefreshPercent = -10
//        isRefreshingTitleHidden = true
//        isAutomaticallyRefresh = false
//        isAutomaticallyChangeAlpha = true
        setTitle("暂无更多数据", for: .noMoreData)

        
    }
}



