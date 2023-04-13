//
//  SelectThemeCell.swift
//  daily
//
//  Created by 선민재 on 2023/03/23.
//

import Foundation
import UIKit
import SnapKit
import Then

final class SelectThemeCell: UICollectionViewCell {
    static let id = "SelectThemeCell"
    
<<<<<<< HEAD
    private let themeView = UIView().then {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

    @available(*, unavailable)
        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.themeView)
        NSLayoutConstraint.activate([
            self.themeView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.themeView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.themeView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.themeView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
        ])
    }
    
=======
//    private let themeImage = UIImageView().then {
////        $0.image = UIImage
//    }
>>>>>>> 9f6e64afdc483e40cab2e968a099e3fcc8991021
}
