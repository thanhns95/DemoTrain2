//
//  ViewController.swift
//  DemoTrain2
//
//  Created by Nguyễn Thành on 11/12/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var infoTbv: UITableView!
    
    @IBOutlet weak var chovayBtn: UIButton!
    @IBOutlet weak var vayBtn: UIButton!
    
    var isExpand = BehaviorRelay<Bool>(value: true)
    let disposeBag = DisposeBag()
    lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTbv.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
        setupBindings()
        viewModel.getLoanData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func chovayOnclick(_ sender: UIButton) {
         viewModel.isShowLoan.accept(sender == chovayBtn)
    }
    
    
    @IBAction func switchOnclick(_ sender: UISwitch) {
        viewModel.isExpand.accept(sender.isOn)
    }
    
    

    func setupBindings() {
        viewModel.isExpand.bind(to: isExpand).disposed(by: disposeBag)
        viewModel.listObject.subscribe(onNext: { [weak self] _ in
            DispatchQueue.main.async {
                self?.infoTbv.reloadData()
            }
        }).disposed(by: disposeBag)
        viewModel.isShowLoan.subscribe(onNext: { [weak self] value in
            self?.chovayBtn.isSelected = value
            self?.vayBtn.isSelected = !value
            self?.viewModel.switchLoanMode(isLoan: value)
        }).disposed(by: disposeBag)
        viewModel.isExpand.subscribe(onNext: { [weak self] _ in
            self?.infoTbv.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listObject.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        cell.bindData(viewModel.listObject.value[indexPath.row], isExpand: isExpand.value)
        return cell
    }
}

