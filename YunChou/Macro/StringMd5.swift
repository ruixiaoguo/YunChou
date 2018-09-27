//
//  StringMd5.swift
//  YunChou
//
//  Created by grx on 2018/9/20.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation

extension String {
    func md5() ->String!{
    let cStrl = cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue));
    let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16);
    CC_MD5(cStrl, CC_LONG(strlen(cStrl!)), buffer);
    var md5String = "";
    for idx in 0...15 {
        let obcStrl = String.init(format: "%02x", buffer[idx]);
        md5String.append(obcStrl);
    }
    free(buffer);
    return md5String;
    }
}
