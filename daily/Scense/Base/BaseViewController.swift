//
//  BaseViewController.swift
//  daily
//
//  Created by 선민재 on 2022/10/27.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController<T>: UIViewController {
    let viewModel: T
    var disposeBag = DisposeBag()
    let bounds = UIScreen.main.bounds

    
    init(_ viewModel: T) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }
    
    func addView() {
        
    }
    
    func setLayout() {
        
    }

}
