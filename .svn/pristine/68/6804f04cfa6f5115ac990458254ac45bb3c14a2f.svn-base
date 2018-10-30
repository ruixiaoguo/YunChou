//
//  YCSearchViewController.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/27.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCSearchViewController: BaseController {

    
    private lazy var searchBox : YCSearchBoxView = {
       let serachBox = YCSearchBoxView()
        return serachBox
    }()
    
    private lazy var searchResult : YCSearchResultView = {
       let searchResult = YCSearchResultView()
        return searchResult
    }()
    
    private lazy var tagsView : YCTagsView = {
        let tagsView = YCTagsView()
        return tagsView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createSubViews()
        // Do any additional setup after loading the view.
    }
    
    
     func createSubViews(){
        view.backgroundColor = UIColor.white
        view.addSubview(self.searchBox)
        searchBox.myDelegate = self
        searchBox.snp.makeConstraints { (make) in
            make.top.equalTo(StatusBarHeight)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        
        view.addSubview(searchResult)
        searchResult.snp.makeConstraints { (make) in
            make.top.equalTo(searchBox.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(SafeBottomMargin)
        }
        
        view.addSubview(tagsView)
        tagsView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBox.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(SafeBottomMargin)
        }
        
      }
    
}

extension YCSearchViewController : YCSearchBoxViewDelegate{
    
    func searchBoxText(str: String) {
        print("searchText  " + str)
        UIView.animate(withDuration: 0.4) {
            self.tagsView.alpha = 0
            self.searchResult.alpha = 1
        }
    }
    
    func searchTextFieldDidBeginEditing() {
        UIView.animate(withDuration: 0.4) {
            self.tagsView.alpha = 1
            self.searchResult.alpha = 0
        }
    }
    
    func searchBoxCancelBtnClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
