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
        self.tabBarController?.tabBar.isHidden = true
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    private let theme = UIImageView().then {
        $0.image = UIImage(named: "oceanFirstTheme.svg")
        $0.contentMode = .scaleAspectFill
    }
    
    private var xmarkButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
    }
    
    override func addView() {
        [theme, xmarkButton].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        theme.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        xmarkButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(30)
        }
    }
}
