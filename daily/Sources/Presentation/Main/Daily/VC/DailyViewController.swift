//
//  DailyViewController.swift
//  daily
//
//  Created by 선민재 on 2022/11/18.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class DailyViewController: BaseViewController<DailyViewModel>, UITextViewDelegate{
    var date: String
    var content: String
    var vm = DailyViewModel()

    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: .none, action: nil)
        placeholderSetting()
        textViewDidBeginEditing(dailyTextView)
        textViewDidEndEditing(dailyTextView)
        saveButtonDidTap()
        contentIsNotNil()
    }
    
    private func contentIsNotNil() {
        if self.content != "" {
            dailyTextView.textColor = UIColor.black
            dailyTextView.text = content
        }
    }
    
    init(date: String, content: String) {
        self.date = date
        self.content = content
        super.init(vm)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func saveButtonDidTap() {
        navigationItem.rightBarButtonItem!.rx.tap
            .bind { [self] in
                viewModel.diaryWrite(date: date, content: dailyTextView.text) {
                    self.navigationController?.popViewController(animated: true)
                }
            }
    }
    
    private let dailyBackground = UIImageView().then {
        $0.image = UIImage(named: "DailyBackground.svg")
    }
    
    private let dailyTextView = UITextView().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.00)
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    private func placeholderSetting() {
        dailyTextView.delegate = self
        dailyTextView.text = "설명"
        dailyTextView.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if dailyTextView.textColor == UIColor.lightGray {
            dailyTextView.text = nil
            dailyTextView.textColor = UIColor.black
        }
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if dailyTextView.text.isEmpty {
            dailyTextView.text = "일기를 작성해 주세요"
            dailyTextView.textColor = UIColor.lightGray
        }
    }
    
    override func addView() {
        [dailyBackground,dailyTextView].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        dailyBackground.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(0)
            $0.top.bottom.equalToSuperview().inset(0)
        }
        dailyTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 7.58)
            $0.bottom.equalTo(view.snp.bottom).inset(24)
        }
    }

}
