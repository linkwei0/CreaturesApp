//
//  CreatureCell.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import UIKit

class CreatureCell: UITableViewCell, TableCell {
    // MARK: - Properties
    private let containerView = UIView()
    private let emojiContainerView = UIView()
    private let emojiLabel = Label(textStyle: .body)
    private let textStackView = UIStackView()
    private let statusLabel = Label(textStyle: .bodyBold)
    private let descriptionLabel = Label(textStyle: .body)
        
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = emojiContainerView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = emojiContainerView.bounds
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configure
    func configure(with viewModel: TableCellViewModel) {
        guard let viewModel = viewModel as? CreatureCellViewModel else { return }
        
        let colors = viewModel.backgroundGradient.colors
        emojiContainerView.setGradientBackground(colorOne: colors[0], colorTwo: colors[1])
        
        emojiLabel.text = viewModel.emojiText
        statusLabel.text = viewModel.status
        descriptionLabel.text = viewModel.descriptionInfo
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupContainerView()
        setupEmojiContainerView()
        setupEmojiLabel()
        setupTextStackView()
        setupStatusLabel()
        setupDescriptionLabel()
    }
    
    private func setupBackground() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setupContainerView() {
        contentView.addSubview(containerView)
        containerView.backgroundColor = .baseWhite
        containerView.layer.cornerRadius = 8
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupEmojiContainerView() {
        containerView.addSubview(emojiContainerView)
        emojiContainerView.layer.cornerRadius = 40 / 2
        emojiContainerView.clipsToBounds = true
        emojiContainerView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(16)
            make.size.equalTo(40)
        }
    }
    
    private func setupEmojiLabel() {
        emojiContainerView.addSubview(emojiLabel)
        emojiLabel.textAlignment = .center
        emojiLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupTextStackView() {
        containerView.addSubview(textStackView)
        textStackView.axis = .vertical
        textStackView.spacing = 1
        textStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(emojiContainerView.snp.trailing).offset(12)
        }
    }
    
    private func setupStatusLabel() {
        textStackView.addArrangedSubview(statusLabel)
        statusLabel.textAlignment = .left
    }
    
    private func setupDescriptionLabel() {
        textStackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.textAlignment = .left
    }
}
