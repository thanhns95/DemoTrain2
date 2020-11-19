//
//  BaseBO.swift
//  DemoTrain2
//
//  Created by Nguyễn Thành on 11/16/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseBO: Mappable {
    required init?(map: Map) {}
    func mapping(map: Map) {}
}
