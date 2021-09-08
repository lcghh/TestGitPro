//
//  TopOrderOperateView.swift
//  TestTwo
//
//  Created by lichao on 2021/9/7.
//

import UIKit
import SnapKit

class TopOrderOperateView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        defineLayout()
        configData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() -> Void {
        addSubview(scrollview)
        scrollview.addSubview(containView)
        scrollview.addSubview(bottomLine)
    }
    
    func defineLayout() -> Void {
        scrollview.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.edges.equalToSuperview()
        }
        containView.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.top.bottom.equalTo(self)
            ConstraintMaker.right.equalTo(self)
        }
        
    }
    func configData() -> Void {
        let array = ["接单送样","报告未出","报告已出","已完成","退款"]
        var lastView:UIButton?
        
        var btnArray:[UIButton] = []
        
        for str in array {
            
            let btn = UIButton(type: .custom)
            btn.setTitle(str, for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.addTarget(self, action: #selector(didTapButton(btn:)), for: .touchUpInside)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//            btn.backgroundColor = .blue
            
            let badgeLable = UILabel()
            
            badgeLable.text = " 22 "
            badgeLable.textColor = .red
            badgeLable.font = UIFont.systemFont(ofSize: 10)
            badgeLable.layer.borderWidth = 1.0
            badgeLable.layer.borderColor = UIColor.black.cgColor
            badgeLable.layer.cornerRadius = 8.0
            
            badgeLable.tag = 1000
            
            btn.addSubview(badgeLable)
            
            
            btnArray.append(btn)

        }
        
        let reverSec:UIButton = btnArray[btnArray.count - 2]
        
        for btn in btnArray {
            containView.addSubview(btn)
            if lastView != nil {
                btn.snp.makeConstraints { ConstraintMaker in
                    ConstraintMaker.top.bottom.width.equalTo(lastView!)
                    ConstraintMaker.left.equalTo(lastView!.snp.right)
                }
            }else{
                btn.snp.makeConstraints { ConstraintMaker in
                    ConstraintMaker.top.bottom.equalTo(containView)
                    ConstraintMaker.left.equalTo(containView).offset(10)
                }
                bottomLine.snp.makeConstraints { ConstraintMaker in
                    ConstraintMaker.bottom.equalTo(containView)
                    ConstraintMaker.centerX.equalTo(btn)
                    ConstraintMaker.width.equalTo(25)
                    ConstraintMaker.height.equalTo(2)
                }
            }
            let badge = btn.viewWithTag(1000)
            badge?.snp.makeConstraints({ ConstraintMaker in
                btn.titleLabel?.sizeToFit()
                let size = btn.titleLabel?.bounds.size
                ConstraintMaker.centerX.equalTo(btn).offset(size!.width / 2)
                ConstraintMaker.centerY.equalTo(btn).offset(-15)
                ConstraintMaker.height.equalTo(16)
            })
            
            lastView = btn
        }
        lastView!.snp.remakeConstraints { ConstraintMaker in
            ConstraintMaker.top.bottom.equalTo(containView)
            ConstraintMaker.right.equalTo(containView).offset(0)
            ConstraintMaker.left.equalTo(reverSec.snp.right)
            ConstraintMaker.width.equalTo(reverSec.snp.width).multipliedBy(0.85)
        }
    }
    
    @objc func didTapButton(btn:UIButton) -> Void {
        bottomLine.snp.remakeConstraints { ConstraintMaker in
            ConstraintMaker.bottom.equalTo(containView)
            ConstraintMaker.centerX.equalTo(btn)
            ConstraintMaker.width.equalTo(25)
            ConstraintMaker.height.equalTo(2)
        }
    }
    
    
    // MARK:lazy init
    lazy var scrollview:UIScrollView = {
        let scrollview = UIScrollView()
        return scrollview
    }()
    
    lazy var bottomLine:UIImageView = {
        let line = UIImageView()
        line.backgroundColor = .red
        return line
    }()
    
    lazy var containView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    

}
