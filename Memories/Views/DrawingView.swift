//
//  DrawingView.swift
//  Memories
//
//  Created by Nikola Popovic on 3/9/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    
//     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 80, y: 50))
        path.addLine(to: CGPoint(x: 140, y: 150))
        path.addLine(to: CGPoint(x: 10, y: 150))
        path.close()
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.lineWidth = 3.0
        path.fill()
        path.stroke()
    }
}
