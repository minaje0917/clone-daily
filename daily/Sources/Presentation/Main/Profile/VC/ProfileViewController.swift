//
//  ProfileViewController.swift
//  daily
//
//  Created by 선민재 on 2023/03/09.
//

import UIKit
import Then
import SnapKit

class ProfileViewController: BaseViewController<ProfileViewModel> {
    private var diaryContentList = [String]()
    private var diaryDateList = [String]()
    private var refreshControl = UIRefreshControl()


    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
        Task {
            await bindViewModel()
        }
        diaryList.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        view.backgroundColor = UIColor(
            red: 249/255,
            green: 249/255,
            blue: 249/255,
            alpha: 1
        )
    }
    
    @objc func refresh() {
        DispatchQueue.main.async() { [self] in
            bindData { [unowned self] in
                diaryList.refreshControl?.endRefreshing()
            }
        }
    }
    
    private func bindData(completion: @escaping () -> Void) {
        viewModel.getDiaryList {
            self.diaryContentList = [String]()
            self.diaryDateList = [String]()
            self.diaryList.reloadData()
            self.bindListData2()
        }
        completion()
    }
    
    private func bindListData2() {
        if viewModel.listData.isEmpty {
            print("empty")
        }
        else {
            for index in 0...viewModel.listData.endIndex - 1 {
                diaryContentList.insert(viewModel.listData[index].content, at: index)
                diaryDateList.insert(viewModel.listData[index].date, at: index)
                print(viewModel.listData[index].content)
            }
            diaryList.dataSource = self
            diaryList.delegate = self
            diaryList.register(
                ProfileCollectionCell.self,
                forCellWithReuseIdentifier: ProfileCollectionCell.identifier
            )
        }
    }

    
    private func bindViewModel() async {
        viewModel.getDiaryList { [weak self] in
            self?.bindListData()
        }
    }
    
    private func bindListData() {
        if viewModel.listData.isEmpty {
            print("empty")
        }
        else {
            for index in 0...viewModel.listData.endIndex - 1 {
                diaryContentList.insert(viewModel.listData[index].content, at: index)
                diaryDateList.insert(viewModel.listData[index].date, at: index)
                print(viewModel.listData[index].content)
            }
            diaryList.dataSource = self
            diaryList.delegate = self
            diaryList.register(
                ProfileCollectionCell.self,
                forCellWithReuseIdentifier: ProfileCollectionCell.identifier
            )
        }
    }
    
    private let dailyUserImage = UIImageView().then {
        $0.image = UIImage(named: "DailyUserImage.svg")
    }
    
    private let userName = UILabel().then {
        $0.text = "데일리_선"
        $0.font = UIFont.systemFont(
            ofSize: 16,
            weight: .bold
        )
        $0.textColor = .black
    }
    
    private let userEmail = UILabel().then {
        $0.text = "s21023@gsm.hs.kr"
        $0.font = UIFont.systemFont(
            ofSize: 12,
            weight: .regular
        )
        $0.textColor = UIColor.dailyLight
    }
    
    private let topStackView = UIStackView().then {
        $0.spacing = 8
        $0.axis = .vertical
        $0.alignment = .leading
    }
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(
            width: (
                (UIScreen.main.bounds.width) - 32
            ),
            height: (
                49
            )
        )
        $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0) //아이템 상하좌우 사이값 초기화
    }
    
    private let diaryList = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.isScrollEnabled = true
        $0.backgroundColor = UIColor(
            red: 249/255,
            green: 249/255,
            blue: 249/255,
            alpha: 1
        )
    }

    override func addView() {
        [dailyUserImage, topStackView, diaryList].forEach {
            view.addSubview($0)
        }
        [userName, userEmail].forEach {
            topStackView.addArrangedSubview($0)
        }
    }
    
    override func setLayout() {
        dailyUserImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92)
            $0.leading.equalToSuperview().offset(20)
        }
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(112)
            $0.leading.equalTo(dailyUserImage.snp.trailing).offset(16)
        }
        diaryList.snp.makeConstraints {
            $0.top.equalTo(dailyUserImage.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}

extension ProfileViewController:
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diaryContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionCell.identifier, for: indexPath) as? ProfileCollectionCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.applySketchShadow(
            color: UIColor.black,
            alpha: 0.1,
            x: 0,
            y: 2,
            blur: 8,
            spread: 0
        )
        cell.diaryText.text = "\(diaryContentList[indexPath.row])"
        cell.dateText.text = "\(diaryDateList[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (
                (UIScreen.main.bounds.width) - 32
            ),
            height: (
                49
            )
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let date = diaryDateList[indexPath.row]
        viewModel.getDiaryDetail(date: date, completion: { [self] in
            viewModel.steps.accept(
                DailyStep.dailyIsRequired(
                    date: date,
                    content: viewModel.diaryData?.content ?? ""
                )
            )
        })
        self.navigationItem.backButton(title: date)
    }
}
