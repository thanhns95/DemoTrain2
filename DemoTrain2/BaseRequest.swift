//
//  BaseRequest.swift
//  DemoTrain2
//
//  Created by Nguyễn Thành on 11/16/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseRequest {
    let baseUrl = "https://mockapi.superoffice.vn/api/baitap2/thanhns"
    static let shared = BaseRequest()
    
    func request<T: BaseBO>(successCompletion: @escaping (T) -> Void,
                                   failCompletion: (() -> Void)? = nil) {
        guard let url = URL(string: "\(baseUrl)") else {
            failCompletion?()
            return
        }
        URLSession.shared.dataTask(with: url,
                                   completionHandler:
            { (data, response, error) in
                guard let data = data,
                    error == nil,
                    let jsonDict = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let object = Mapper<T>().map(JSON: jsonDict) else {
                    failCompletion?()
                    return
                }
                successCompletion(object)
        }).resume()
    }
}
