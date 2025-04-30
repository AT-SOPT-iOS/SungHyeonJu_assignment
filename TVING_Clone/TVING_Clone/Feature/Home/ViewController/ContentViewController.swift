//
//  ContentViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit
import SnapKit

final class ContentViewController: UIViewController {

    // MARK: - Properties
    private let titleText: String

    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()

    // MARK: - Init
    init(title: String) {
        self.titleText = title
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        populateDummyContent()
    }

    // MARK: - Setup
    private func setupUI() {
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)

        contentStackView.axis = .vertical
        contentStackView.spacing = 16
        scrollView.addSubview(contentStackView)
    }

    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width).inset(40)
        }
    }

    // MARK: - Dummy Content
    private func populateDummyContent() {
        for i in 1...20 {
            let label = UILabel()
            label.text = "\(titleText) 콘텐츠 \(i)"
            label.textColor = .white
            label.font = .systemFont(ofSize: 18)
            contentStackView.addArrangedSubview(label)
        }
    }
}
