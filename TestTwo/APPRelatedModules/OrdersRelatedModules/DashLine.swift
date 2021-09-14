//
//  DashLine.swift
//  TestTwo
//
//  Created by lichao on 2021/9/14.
//

import UIKit

class DashLine: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: "#F5F5F5")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        let context = UIGraphicsGetCurrentContext()
        UIColor.blue.set()
        context?.saveGState()
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setLineDash(phase: 0, lengths: [10,10])
        context?.move(to: CGPoint(x: 0, y: 0))
        context?.addLine(to: CGPoint(x: 0, y: rect.height))

        context?.strokePath()
        context?.closePath()
        context?.restoreGState()
    }

}
