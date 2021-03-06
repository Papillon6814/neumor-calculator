//
//  NeumorCircleButton.swift
//  NeumorCalculator
//
//  Created by takuma ozawa on 2020/02/13.
//  Copyright © 2020 Papillon. All rights reserved.
//

import Foundation
import UIKit

// TODO: set in params
let FONT_SIZE = 16

class NeumorSquareButton: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        button()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        button()
    }
    private let params = Params()
    
    let highlightLayer = CALayer(),
        shadowLayer = CALayer(),
        textLayer = CATextLayer()
    
    func button() {
        setTitleColor(UIColor.clear, for: .normal)
        textLayer.string = currentTitle
        textLayer.foregroundColor = UIColor.gray.cgColor
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.fontSize = CGFloat(FONT_SIZE)
        textLayer.alignmentMode = .center
        
        [highlightLayer, shadowLayer, textLayer].forEach {
            $0.masksToBounds = false
            $0.frame = layer.bounds
        }
        
        textLayer.frame = CGRect(
            x: CGFloat(0),
            y: self.bounds.height/2 - CGFloat(FONT_SIZE/2),
            width: self.bounds.width,
            height: CGFloat(FONT_SIZE)
        )
        
        putHighlight()
        putShadow()

        layer.addSublayer(shadowLayer)
        layer.addSublayer(highlightLayer)
        layer.addSublayer(textLayer)
    }

    private func putHighlight() {
        highlightLayer.backgroundColor = params.NORMAL_BUTTON_BGCOLOR.cgColor
        highlightLayer.shadowColor = params.BACKGROUND_COLOR.brighter().cgColor
        highlightLayer.cornerRadius = layer.frame.size.height * 0.15
        highlightLayer.shadowOpacity = 1
        highlightLayer.shadowOffset = CGSize(width: -6, height: -6)
        highlightLayer.shadowRadius = 10
    }
    private func putShadow() {
        shadowLayer.backgroundColor = UIColor.white.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.cornerRadius = layer.frame.size.height * 0.15
        shadowLayer.shadowOpacity = 0.15
        shadowLayer.shadowOffset = CGSize(width: 6, height: 6)
        shadowLayer.shadowRadius = 10
    }
    
    func buttonPush() {
        highlightLayer.shadowOpacity = 0
        shadowLayer.shadowOpacity = 0

        let frame = CGRect(x: 0, y: 0, width: layer.frame.size.width, height: layer.frame.size.height)
        let gradColors = [
            params.BACKGROUND_COLOR.darker().cgColor,
            params.NORMAL_BUTTON_BGCOLOR.cgColor,
            params.NORMAL_BUTTON_BGCOLOR.cgColor,
            params.BACKGROUND_COLOR.brighter().cgColor
        ]
        let gradLocations = [0, 0.15, 0.85, 1]
        let shadowOpacity: Float = 0.5
        let cornerRadius = layer.frame.size.height * 0.15
        
        let virticalGradLayer = CAGradientLayer()
            virticalGradLayer.opacity = shadowOpacity
            virticalGradLayer.frame = frame
            virticalGradLayer.colors = gradColors
            virticalGradLayer.locations = gradLocations as [NSNumber]
            virticalGradLayer.cornerRadius = cornerRadius
        let horizonGradLayer = CAGradientLayer()
            horizonGradLayer.opacity = shadowOpacity
            horizonGradLayer.frame = frame
            horizonGradLayer.startPoint = CGPoint(x: 0, y: 0)
            horizonGradLayer.endPoint = CGPoint(x: 1, y: 0)
            horizonGradLayer.colors = gradColors
            horizonGradLayer.locations = gradLocations as [NSNumber]
            horizonGradLayer.cornerRadius = cornerRadius
        
        layer.addSublayer(horizonGradLayer)
        layer.addSublayer(virticalGradLayer)
        layer.addSublayer(textLayer)
        

    }
}

