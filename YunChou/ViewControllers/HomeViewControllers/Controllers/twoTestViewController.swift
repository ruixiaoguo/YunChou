//
//  twoTestViewController.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/26.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class twoTestViewController: BaseController {

    private lazy var scrollViews : UIScrollView={
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        scrollView.backgroundColor = UIColor.yellow
        scrollView.contentSize = CGSize(width: 0, height: self.view.bounds.height)

        return scrollView
    }()
    
    private lazy var lable : UILabel = {
       let lable = UILabel(frame: CGRect(x: 0, y: self.view.bounds.height - 20, width: 100, height: 20))
        lable.text = "asdfasfasfsdgasgdsa"
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollViews)
        glt_scrollView = scrollViews
        scrollViews.addSubview(lable)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
