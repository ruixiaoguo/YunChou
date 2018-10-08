//
//  FileCacheManager.swift
//  YunChou
//
//  Created by grx on 2018/9/30.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class FileCacheManager: NSObject {

    class func fileSizeOfCache()-> String {
        // 取出cache文件夹目录 缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        //缓存目录路径
        printLog(message: cachePath)
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        //快速枚举出所有文件名 计算文件大小
        var size = 0
        for file in fileArr! {
            // 把文件名拼接到路径中
            let path = cachePath?.appendingFormat("/\(file)")
            // 取出文件属性
            let floder = try! FileManager.default.attributesOfItem(atPath: path!)
            // 用元组取出文件大小属性
            for (abc, bcd) in floder {
                // 累加文件大小
                if abc == FileAttributeKey.size {
                    size += (bcd as AnyObject).integerValue
                }
            }
        }
        let mm:CGFloat = CGFloat(CGFloat(size) / 1024 / 1024)
        return String.init(format:"%.2f M", mm)
    }
    class func clearCache() {
        // 取出cache文件夹目录 缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        // 遍历删除
        for file in fileArr! {
            let path = cachePath?.appendingFormat("/\(file)")
            if FileManager.default.fileExists(atPath: path!) {
                do {
                    try FileManager.default.removeItem(atPath: path!)
                } catch {
                }
            }
        }
    }
}
