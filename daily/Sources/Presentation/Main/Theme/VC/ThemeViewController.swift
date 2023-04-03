//
//  ThemeViewController.swift
//  daily
//
//  Created by 선민재 on 2023/03/09.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class ThemeViewController: BaseViewController<ThemeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private let theme = UIImageView().then {
        $0.image = UIImage(named: "oceanFirstTheme.svg")
        $0.contentMode = .scaleAspectFill
    }
    
    override func addView() {
        [theme].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        theme.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
    }
}
