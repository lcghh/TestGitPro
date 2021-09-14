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
        self.backgroundColor = UIColor(hex: "#F5F5F5")
        addSubviews()
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() -> Void {
        contentView.addSubview(dashLine)
        contentView.addSubview(containView)
        containView.addSubview(clinicNameTitle)
        containView.addSubview(rightArrow)
        containView.addSubview(orderCountBgView)
        orderCountBgView.addSubview(orderCountLabel)
        containView.addSubview(bgView)
        bgView.addSubview(addressLabel)
        bgView.addSubview(takeOrderLabel)
        containView.addSubview(line)
        containView.addSubview(orderAmountLabel)
    }
    func defineLayout() -> Void {
        dashLine.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(contentView).offset(10.0)
            ConstraintMaker.width.equalTo(contentView).offset(5.0)
            ConstraintMaker.top.equalTo(contentView.snp.top)
            ConstraintMaker.bottom.equalTo(contentView)
        }
        containView.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(contentView).offset(25.0)
            ConstraintMaker.right.equalTo(contentView).offset(-15.0)
            ConstraintMaker.top.equalTo(contentView.snp.top).offset(0.0)
            ConstraintMaker.bottom.equalTo(contentView).offset(-10.0)
        }
        clinicNameTitle.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(containView).offset(15.0)
            ConstraintMaker.top.equalTo(containView).offset(18.0)
            ConstraintMaker.height.equalTo(20)
        }
        rightArrow.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.height.equalTo(30.0)
            ConstraintMaker.right.equalTo(containView).offset(-15.0)
            ConstraintMaker.centerY.equalTo(clinicNameTitle)
            ConstraintMaker.width.equalTo(30.0)
        }
        
        bgView.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(containView).offset(15.0)
            ConstraintMaker.right.equalTo(containView).offset(-15.0)
            ConstraintMaker.top.equalTo(clinicNameTitle.snp.bottom).offset(18.0)
            ConstraintMaker.bottom.equalTo(addressLabel.snp.bottom).offset(10)
        }
        addressLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(bgView).offset(10.0)
            ConstraintMaker.right.equalTo(bgView).offset(-10.0)
            ConstraintMaker.top.equalTo(bgView).offset(10.0)
        }

        orderCountBgView.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.height.equalTo(20.0)
            ConstraintMaker.right.equalTo(orderCountLabel).offset(10.0)
            ConstraintMaker.top.equalTo(bgView.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(clinicNameTitle)
        }
        orderCountLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(orderCountBgView).offset(10.0)
            ConstraintMaker.centerY.equalTo(orderCountBgView)
        }
        
        orderAmountLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.right.equalTo(containView).offset(-15.0)
            ConstraintMaker.centerY.equalTo(orderCountBgView)
            ConstraintMaker.height.equalTo(20)
        }
        
        line.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(clinicNameTitle)
            ConstraintMaker.right.equalTo(rightArrow)
            ConstraintMaker.top.equalTo(orderCountBgView.snp.bottom).offset(15.0)
            ConstraintMaker.height.equalTo(0.5)
        }
        
        takeOrderLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(addressLabel)
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(15.0)
            ConstraintMaker.bottom.equalTo(containView.snp.bottom).offset(-15.0)
            ConstraintMaker.height.equalTo(20)
        }
        
    }
    

//    MARK: lazy init
    
    lazy var dashLine: DashLine = {
        let line = DashLine()
        return line
    }()
    
    lazy var containView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        return view
    }()
    
    lazy var clinicNameTitle:UILabel = {
        let label = UILabel()
        label.text = "江记内科诊所"
        label.textColor = UIColor(hex: "#303133")
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var orderCountBgView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(hex: "#6487DA").cgColor
        return view
    }()
    
    lazy var orderCountLabel:UILabel = {
        let label = UILabel()
        label.text = "待接单 10"
        label.textColor = UIColor(hex: "#6487DA")
        label.font = UIFont.systemFont(ofSize: 13.5)
        return label
    }()
    
    lazy var bgView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F9FBFF")
        return view
    }()
    
    lazy var addressLabel:UILabel = {
        let label = UILabel()
        label.text = "下单时间：2021-06-12 13:54:09下单时间：2021-06-12 13:54:09下单时间：2021-06-12 13:54:09下单时间：2021-06-12 13:54:09"
        label.textColor = UIColor(hex: "#95989F")
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.numberOfLines = 0
        return label
    }()
    lazy var takeOrderLabel:UILabel = {
        let label = UILabel()
        label.text = "默认接单人:张快递 1523686654"
        label.textColor = UIColor(hex: "#303133")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var orderAmountLabel:UILabel = {
        let label = UILabel()
        label.text = "订单金额：￥8456.20"
        label.textColor = UIColor(hex: "#303133")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var rightArrow:UIImageView = {
        let rightArrow = UIImageView()
        rightArrow.backgroundColor = .blue
        return rightArrow
    }()
    
    lazy var line:UIImageView = {
        let line = UIImageView()
        line.backgroundColor = UIColor(hex: "#DDE0E6")
        return line
    }()

}
