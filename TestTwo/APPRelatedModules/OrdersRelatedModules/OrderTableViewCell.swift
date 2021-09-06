//
//  OrderTableViewCell.swift
//  TestTwo
//
//  Created by lichao on 2021/9/6.
//

import UIKit
import SnapKit

class OrderTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(hex: "#F5F5F5")
        addSubviews()
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() -> Void {
        contentView.addSubview(containView)
        containView.addSubview(orderTitle)
        containView.addSubview(statusBgView)
        statusBgView.addSubview(orderStatusLabel)
        containView.addSubview(bgView)
        bgView.addSubview(orderTimeLabel)
        bgView.addSubview(patientNameLabel)
        containView.addSubview(orderAmountLabel)
    }
    func defineLayout() -> Void {
        containView.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(contentView).offset(15.0)
            ConstraintMaker.right.equalTo(contentView).offset(-15.0)
            ConstraintMaker.top.equalTo(contentView.snp.top).offset(10.0)
            ConstraintMaker.bottom.equalTo(contentView).offset(0.0)
        }
        orderTitle.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(containView).offset(15.0)
            ConstraintMaker.top.equalTo(containView).offset(18.0)
            ConstraintMaker.height.equalTo(20)
        }
        statusBgView.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.height.equalTo(20.0)
            ConstraintMaker.right.equalTo(containView).offset(-15.0)
            ConstraintMaker.centerY.equalTo(orderTitle)
            ConstraintMaker.left.equalTo(orderStatusLabel).offset(-10.0)
        }
        orderStatusLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.right.equalTo(statusBgView).offset(-10.0)
            ConstraintMaker.centerY.equalTo(orderTitle)
        }
        bgView.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(containView).offset(15.0)
            ConstraintMaker.right.equalTo(containView).offset(-15.0)
            ConstraintMaker.top.equalTo(orderTitle.snp.bottom).offset(18.0)
            ConstraintMaker.bottom.equalTo(patientNameLabel.snp.bottom).offset(10)
        }
        orderTimeLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(bgView).offset(10.0)
            ConstraintMaker.top.equalTo(bgView).offset(10.0)
            ConstraintMaker.height.equalTo(20)
        }
        patientNameLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(orderTimeLabel)
            ConstraintMaker.top.equalTo(orderTimeLabel.snp.bottom).offset(15.0)
            ConstraintMaker.height.equalTo(20)
        }
        
        orderAmountLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(containView).offset(15.0)
            ConstraintMaker.top.equalTo(bgView.snp.bottom).offset(12.0)
            ConstraintMaker.bottom.equalTo(containView).offset(-20.0)
            ConstraintMaker.height.equalTo(20)
        }
        
    }
    

//    MARK: lazy init
    
    lazy var containView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        return view
    }()
    
    lazy var orderTitle:UILabel = {
        let label = UILabel()
        label.text = "订单号CTL37548645745700"
        label.textColor = UIColor(hex: "#303133")
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var statusBgView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFF4E4")
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        return view
    }()
    
    lazy var orderStatusLabel:UILabel = {
        let label = UILabel()
        label.text = "退款中"
        label.textColor = UIColor(hex: "#FF7A00")
        label.font = UIFont.systemFont(ofSize: 11.5)
        return label
    }()
    
    lazy var bgView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F9FBFF")
        return view
    }()
    
    lazy var orderTimeLabel:UILabel = {
        let label = UILabel()
        label.text = "下单时间：2021-06-12 13:54:09"
        label.textColor = UIColor(hex: "#303133")
        label.font = UIFont.systemFont(ofSize: 13.5)
        return label
    }()
    lazy var patientNameLabel:UILabel = {
        let label = UILabel()
        label.text = "患者名称：罗杰斯"
        label.textColor = UIColor(hex: "#303133")
        label.font = UIFont.systemFont(ofSize: 13.5)
        return label
    }()
    
    lazy var orderAmountLabel:UILabel = {
        let label = UILabel()
        label.text = "订单金额：￥8456.20"
        label.textColor = UIColor(hex: "#303133")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

}
