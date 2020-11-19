//
//  LoanBO.swift
//  DemoTrain2
//
//  Created by Nguyễn Thành on 11/16/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import Foundation
import ObjectMapper

class LoanContainerBO: BaseBO {
    var loanData: [LoanBO] = []
    var loanedData: [LoanBO] = []
    
    override func mapping(map: Map) {
        loanData <- map["loanData"]
        loanedData <- map["loanedData"]
    }
}

class LoanBO: BaseBO {
    var name = ""
    var money = ""
    var content = ""
    var time = ""
    
    override func mapping(map: Map) {
        name <- map["name"]
        money <- map["money"]
        content <- map["content"]
        time <- map["time"]
    }
}
