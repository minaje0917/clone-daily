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
import Gifu

class ThemeViewController: BaseViewController<ThemeViewModel> {

    override func viewDidLoad() {
        viewModel.getDiaryCount()
        self.tabBarController?.tabBar.isHidden = true
        super.viewDidLoad()
        self.navigationItem.addLeftBarButtonItem()
        bindViewModel()
        gifImageView.animate(withGIFNamed: "ezgif 4")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func bindViewModel() {
        let input = ThemeViewModel.Input(
            xmarkButtonDidTap: navigationItem.leftBarButtonItem!.rx.tap.asObservable()
        )
        viewModel.transVC(input: input)
    }
    
    private let gifImageView = GIFImageView().then {
        $0.isHidden = false
    }

    private let theme = UIImageView().then {
        $0.image = UIImage(named: "grassland.svg")
        $0.contentMode = .scaleAspectFill
    }
    
//    private var xmarkButton = UIButton().then {
//        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
//        $0.tintColor = .black
//    }
    
    override func addView() {
        [theme, gifImageView].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        theme.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
//        xmarkButton.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(50)
//            $0.leading.equalToSuperview().offset(30)
//            $0.height.width.equalTo(50)
//        }
        gifImageView.snp.makeConstraints {
            $0.height.equalTo(470)
            $0.width.equalTo(481)
            $0.bottom.equalToSuperview().inset(92)
            $0.trailing.equalToSuperview().offset(70)
        }
    }
}
