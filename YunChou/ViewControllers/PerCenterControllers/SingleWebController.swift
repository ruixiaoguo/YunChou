//
//  SingleWebController.swift
//  YunChou
//
//  Created by grx on 2018/9/20.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class SingleWebController: BaseHtmlController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorWhite
        self.leftView.isHidden = false
        self.startLoadWithTitle(title: "新浪新闻", url: "http://www.sina.com")
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
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
