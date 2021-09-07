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
            ConstraintMaker.edges.equalToSuperview()
        }
        bottomLine.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.right.bottom.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
    }
    func configData() -> Void {
        let array = ["接单送样","报告未出","报告已出","已完成","退款"]
        var lastView:UIButton?
        
        var btnArray:[UIButton] = []
        
        for str in array {
            
            let btn = UIButton(type: .custom)
            btn.setTitle(str, for: .normal)
            btn.setTitleColor(.red, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.backgroundColor = .blue
            btnArray.append(btn)

        }
        
        
        
        for btn in btnArray {
            containView.addSubview(btn)
            if let lastBtn = lastView {
                btn.snp.makeConstraints { ConstraintMaker in
                    ConstraintMaker.top.bottom.width.equalTo(lastBtn)
                    ConstraintMaker.left.equalTo(lastBtn.snp.right)
                }
            }else{
                btn.snp.makeConstraints { ConstraintMaker in
                    ConstraintMaker.top.bottom.equalTo(containView)
                    ConstraintMaker.left.equalTo(containView)
                    ConstraintMaker.width.equalTo(60)
                }
            }
            lastView = btn
        }
//        lastView?.snp.updateConstraints({ ConstraintMaker in
//            ConstraintMaker.right.equalTo(containView)
//        })
    }

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
        
        return view
    }()
    

}
