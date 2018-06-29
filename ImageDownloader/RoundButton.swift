//
//  RoundButton.swift
//  ImageDownloader
//
//  Created by 탁은주 on 2018. 4. 11..
//  Copyright © 2018년 TEJ. All rights reserved.
//

import UIKit
@IBDesignable

class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false{
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton{
            layer.cornerRadius = frame.height / 2
        }
    }
}
