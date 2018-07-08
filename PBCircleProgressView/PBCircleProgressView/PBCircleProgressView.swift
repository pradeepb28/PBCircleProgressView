//
//  PBCircleProgressView.swift
//  PBCircleProgressView
//
//  Created by pradeep burugu on 7/8/18.
//  Copyright © 2018 pradeep. All rights reserved.
//

import UIKit

class PBCircleProgressView: UIView {
    
    
    internal var trackStrokeColor: UIColor = .clear {
        didSet {
            trackedLayer.strokeColor = trackStrokeColor.cgColor
        }
    }
    
    
    internal var progressStrokeColor: UIColor = .clear {
        didSet {
            progressLayer.strokeColor = progressStrokeColor.cgColor
        }
    }
    
    
    internal var trackFillColor: UIColor = .clear {
        didSet {
            trackedLayer.fillColor = trackFillColor.cgColor
        }
    }
    
    
    internal var progressFillColor: UIColor = .clear {
        didSet {
            progressLayer.fillColor = progressFillColor.cgColor
        }
    }
    
    
    internal var lineWidth: CGFloat = 0.0 {
        didSet {
            trackedLayer.lineWidth = lineWidth
            progressLayer.lineWidth = lineWidth
        }
    }
    
    internal var progressValue: CGFloat = 0.0 {
        didSet {
            progressLayer.strokeEnd = progressValue
        }
    }
    
    
    
    private var trackedLayer: CAShapeLayer!
    private var progressLayer: CAShapeLayer!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    
    private func initialSetup() {
        // Tracked Layer
        trackedLayer = CAShapeLayer()
        trackedLayer.strokeEnd = 1.0
        trackedLayer.fillColor = trackFillColor.cgColor
        
        // Progress Layer
        progressLayer = CAShapeLayer()
        progressLayer.strokeEnd = progressValue
        progressLayer.lineCap = kCALineCapRound
        progressLayer.fillColor = progressFillColor.cgColor
        
        // Create path
        let bezierPath = UIBezierPath(arcCenter: .zero, radius: bounds.width / 2, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        // set path to layers
        trackedLayer.path = bezierPath.cgPath
        progressLayer.path = bezierPath.cgPath
        
        // add layer
        layer.addSublayer(trackedLayer)
        layer.addSublayer(progressLayer)
    }
}
