import UIKit

final class DailyTabBarViewController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        configureVC()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension DailyTabBarViewController {
    func configureVC() {
        tabBar.tintColor = UIColor.mainColor
        tabBar.unselectedItemTintColor = UIColor.dailyLight
        tabBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.98)
    }
}
