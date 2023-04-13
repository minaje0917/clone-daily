//
//  DailyTextField.swift
//  daily
//
//  Created by 선민재 on 2023/04/06.
//

import UIKit

public enum DailyTextFieldType {
    case icon
    case simple
}

public final class DailyTextField: UITextField {
    required public init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    init(){
        super.init(frame: CGRect.zero)
    }
    
    convenience init(
        type: DailyTextFieldType,
        placeholder: String = ""
    ) {
        self.init()
        self.placeholder = placeholder
        switch type {
        case .icon:
            self.setBackGroundColor()
            self.layer.cornerRadius = 20
            self.textColor = .black
            
        case .simple:
            self.setBackGroundColor()
            self.layer.cornerRadius = 20
            self.textColor = .black
            self.isSecureTextEntry = true
            self.leftPadding(width: 20)
        }
    }
    
    public override func becomeFirstResponder() -> Bool {
        let didBecomeFirstResponder = super.becomeFirstResponder()
        if didBecomeFirstResponder {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.mainColor?.cgColor
        }
        return didBecomeFirstResponder
    }

    public override func resignFirstResponder() -> Bool {
        let didResignFirstResponder = super.resignFirstResponder()
        if didResignFirstResponder {
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
        }
        return didResignFirstResponder
    }
}
