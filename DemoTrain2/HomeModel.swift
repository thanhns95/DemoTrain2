//
//  HomeModel.swift
//  DemoTrain2
//
//  Created by Nguyễn Thành on 11/16/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import Foundation
class HomeModel {
    func request(completion: @escaping (LoanContainerBO) -> Void) {
        BaseRequest.shared.request(successCompletion: { (response: LoanContainerBO) in
            completion(response)
        })
    }
}
