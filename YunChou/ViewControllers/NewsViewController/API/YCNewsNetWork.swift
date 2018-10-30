//
//  YCNewsNetWork.swift
//  YunChou
//
//  Created by yy on 2018/10/24.
//  Copyright © 2018年 grx. All rights reserved.
//

import Moya
import SwiftyJSON

//MARK:=========定义一个枚举，存放我们的网络请求k接口
enum newsApiManager {
    //获取新闻头部轮播
    case getNewsBanner(parModel:YCNewsBannerParModel)
    //获取新闻列表
    case getNewsList(parModel:YCNewsListParModel)

}

extension newsApiManager:TargetType{
    //MARK:=========设置不同接口的请求路径
    var path: String {
        switch self {
        case .getNewsBanner(parModel: _):
            return SERVERAPI
        case .getNewsList(parModel: _):
            return SERVERAPI
            
        }
    }
    //MARK:=========配置不同接口参数
    var task: Task {
        switch self {
        case let .getNewsBanner(parModel):
            parModel.methodCode = "basics/USGP000005"
            let paramet = parModel.toJSON()
            return .requestParameters(parameters: paramet!, encoding: URLEncoding.default)

        case let .getNewsList(parModel): // 带有参数,注意前面的let
            parModel.methodCode = "basics/GA000006"

            let paramet = parModel.toJSON()
            
            print("paramet===\(String(describing: paramet))")
            
            return .requestParameters(parameters: paramet!,
                                      encoding: URLEncoding.default)
            
        }
    }
    
    var baseURL: URL {
        return URL(string: YCBASEURL)!
    }
    //MARK:=========设置不同接口的请求方式，get或post
    var method: Moya.Method {
        return .post
    }
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    var validate: Bool {
        return false
    }
    var headers: [String : String]? {
        return nil
    }
}

// 网络请求结构体
struct  YCNewsNetWork{
    // 请求成功的回调
    typealias successCallback = (_ result: JSON) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    // 单例
    static let provider = MoyaProvider<newsApiManager>()
    // 发送网络请求
    static func request(
        target: newsApiManager,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {
//        YCLoadingView.show()
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    
                    try success(JSON(moyaResponse.mapJSON())) // JSON字符串
                } catch {
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
                YCLoadingView.hide()
            case let .failure(error):
                YCLoadingView.hide()
                failure(error)
            }
        }
    }
}

