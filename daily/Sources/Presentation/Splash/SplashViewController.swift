//
//  SplashViewController.swift
//  daily
//
//  Created by 선민재 on 2023/03/28.
//

import UIKit
import Foundation
import SnapKit
import Then
import ViewAnimator

final class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        setAnimation()
    }
    
    private let splashLogo = UIImageView().then {
        $0.image = UIImage(named: "LaunchScreen.svg")
    }
    
    private let splashSunImage = UIImageView().then {
        $0.image = UIImage(named: "SplashSunImage.svg")
    }
    
    private func setAnimation() {
        UIView.animate(views: [
            splashSunImage
        ], animations: [
            AnimationType.from(direction: .bottom, offset: 100)
        ], initialAlpha: 0, finalAlpha: 1, delay: 0.3, duration: 1.25, options: .curveEaseInOut)
    }
        
    private func addView() {
        [splashLogo,splashSunImage].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        splashLogo.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        splashSunImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(splashLogo.snp.top).inset(12.82)
        }
    }
}
