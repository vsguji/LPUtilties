//
//  UIButton+Adjust.swift
//  HeartRetail
//
//  Created by lipeng on 2020/4/7.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation

extension UIButton {
    
    /// MARK : - 图片、富文本
    
    @objc func set(image anImage: UIImage?, attribute: NSAttributedString,
                      titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        self.titleLabel?.attributedText = attribute
        positionLabelRespectToImage(title: attribute.string, position: titlePosition, spacing: additionalSpacing)
    }
    
    /// MARK :  -  图片、纯文本
    
    @objc func set(image anImage: UIImage?, title: String,
                      titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
           self.imageView?.contentMode = .center
           self.setImage(anImage, for: state)
            
           positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
            
           self.titleLabel?.contentMode = .center
           self.setTitle(title, for: state)
       }
        
       private func positionLabelRespectToImage(title: String, position: UIView.ContentMode,
           spacing: CGFloat) {
           let imageSize = self.imageRect(forContentRect: self.frame)
           let titleFont = self.titleLabel?.font!
           let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
            
           var titleInsets: UIEdgeInsets
           var imageInsets: UIEdgeInsets
            
           switch (position){
           case .top:
               titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                   left: -(imageSize.width), bottom: 0, right: 0)
               imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
           case .bottom:
               titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                   left: -(imageSize.width), bottom: 0, right: 0)
               imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
           case .left:
               titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
               imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                   right: -(titleSize.width * 2 + spacing))
           case .right:
               titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
               imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
           default:
               titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
               imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
           }
            
           self.titleEdgeInsets = titleInsets
           self.imageEdgeInsets = imageInsets
       }
}
