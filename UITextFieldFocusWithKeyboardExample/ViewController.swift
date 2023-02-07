//
//  ViewController.swift
//  UITextFieldFocusWithKeyboardExample
//
//  Created by cano on 2023/02/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    
    enum RowNumber: Int, CaseIterable{
        // プラン
        case plan12_1
        case plan6_1
        case plan3_1
        case input
        
        var identifier: String {
            switch self {
            case .plan12_1: return "PaidMemberItemCell"
            case .plan6_1:  return "PaidMemberItemCell"
            case .plan3_1:  return "PaidMemberItemCell"
            case .input:    return "TextFieldTableViewCell"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setUpViews()
    }

    private func setUpViews() {
        // セル登録
        RowNumber.allCases.filter{ $0.identifier != "" }.forEach {
            let nibHeader = UINib(nibName: $0.identifier, bundle: nil)
            self.tableView.register(nibHeader, forCellReuseIdentifier: $0.identifier)
        }
        self.tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RowNumber.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch(indexPath.row) {
        // 12ヶ月プラン
        case RowNumber.plan12_1.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
            cell.monthLabel.text = "12"
            cell.priceLabel.text = "2,900"
            cell.priceTextLabel.text = "（一括支払い：34,800円）"
            cell.copyLabel.text = "一番おすすめ！"
            
            cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

            }).disposed(by: cell.disposeBag)
            
            return cell
        
        // 6ヶ月プラン
        case RowNumber.plan6_1.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
            cell.monthLabel.text = "6"
            cell.priceLabel.text = "4,133"
            cell.priceTextLabel.text = "（一括支払い：24,800円）"
            cell.copyLabel.text = "おすすめ！"
            
            cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

            }).disposed(by: cell.disposeBag)
            
            return cell
            
        // 3ヶ月プラン
        case RowNumber.plan3_1.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
            cell.monthLabel.text = "3"
            cell.priceLabel.text = "4,933"
            cell.priceTextLabel.text = "（一括支払い：14,800円）"
            cell.copyLabel.text = "まずはお試し！"
            cell.copyLabel.sizeToFit()
            
            cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

            }).disposed(by: cell.disposeBag)
            
            return cell
            
        // TextField
        case RowNumber.input.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier(), for: indexPath) as! TextFieldTableViewCell
            cell.scrollView = self.scrollView
            return cell
            
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)  {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row) {
            
        case RowNumber.plan12_1.rawValue, RowNumber.plan6_1.rawValue, RowNumber.plan3_1.rawValue:
            return PaidMemberItemCell.height

        default:
            return UITableView.automaticDimension
        }
    }
    
}


