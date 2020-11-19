//
//  ViewModel.swift
//  DemoTrain2
//
//  Created by Nguyễn Thành on 11/16/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    var disposeBag = DisposeBag()
    let homeModel = HomeModel()
    var isShowLoan = BehaviorRelay<Bool>(value: true)
    var isExpand = BehaviorRelay<Bool>(value: true)
    let listObject = BehaviorRelay<[LoanBO]>(value: [])
    let listLoan = BehaviorRelay<[LoanBO]>(value: [])
    let listLoaned = BehaviorRelay<[LoanBO]>(value: [])

    func switchLoanMode(isLoan: Bool) {
        if isLoan {
            listLoan.bind(to: listObject).disposed(by: disposeBag)
        } else {
            listLoaned.bind(to: listObject).disposed(by: disposeBag)
        }
    }
    
    func getLoanData() {
        homeModel.request { [weak self] response in
            self?.listLoan.accept(response.loanData)
            self?.listLoaned.accept(response.loanedData)
        }
    }
}
