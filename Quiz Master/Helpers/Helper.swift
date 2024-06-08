//
//  Helper.swift
//  Quiz Master
//
//  Created by Afnan Ahmed on 18/12/2023.
//

import Foundation
import UIKit
extension UIButton {
  func addDashedBorder() {
    let color = UIColor.red.cgColor

    let shapeLayer:CAShapeLayer = CAShapeLayer()
    let frameSize = self.frame.size
    let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

    shapeLayer.bounds = shapeRect
    shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = color
    shapeLayer.lineWidth = 2
    shapeLayer.lineJoin = CAShapeLayerLineJoin.round
    shapeLayer.lineDashPattern = [6,3]
    shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

    self.layer.addSublayer(shapeLayer)
    }
}

extension Array {
    func Shuffled() -> [Element] {
        var array = self
        for i in 0..<(array.count - 1) {
            let j = Int(arc4random_uniform(UInt32(array.count - i))) + i
            array.swapAt(i, j)
        }
        return array
    }
}
