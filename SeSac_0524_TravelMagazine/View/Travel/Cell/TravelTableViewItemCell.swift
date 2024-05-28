//
//  TravelTableViewItemCell.swift
//  SeSac_0524_TravelMagazine
//
//  Created by gnksbm on 5/27/24.
//

import UIKit

import Kingfisher

class TravelTableViewItemCell: UITableViewCell, TravelTableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var starStackView: UIStackView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureCell(data: Travel) {
        titleLabel.text = data.title
        subtitleLabel.text = data.description
        if let saveCount = data.save {
            let saveStr = saveCount.formatted()
            descriptionLabel.text = "(\(saveStr)) · 저장 \(saveStr)"
        }
        if let imageUrlString = data.travel_image {
            mainImageView.kf.setImage(with: URL(string: imageUrlString))
        }
        if let like = data.like {
            let imageName = like ? "heart.fill" : "heart"
            likeButton.setImage(.init(systemName: imageName), for: .normal)
        }
        if let grade = data.grade {
            let starViewArr = starStackView.arrangedSubviews
            evaluteGrade(value: grade, maximum: 5) { index, isFullValue in
                if isFullValue {
                    starViewArr[index].tintColor = .systemYellow
                } else {
                    starViewArr[index].tintColor = .systemGray5
                }
            }
        }
    }
    
    func evaluteGrade(
        value: Double,
        maximum: Int,
        closure: (_ index: Int, _ isFullValue: Bool) -> Void
    ) {
        let filledRange = Int(value)
        (0..<filledRange).forEach { index in
            closure(index, true)
        }
        (filledRange..<maximum).forEach { index in
            closure(index, false)
        }
    }
    
    private func configureUI() {
        titleLabel.font = .boldSystemFont(ofSize: 15)
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.textColor = .darkGray
        subtitleLabel.numberOfLines = 0
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.layer.cornerRadius = 8
        mainImageView.clipsToBounds = true
        descriptionLabel.font = .boldSystemFont(ofSize: 12)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0
    }
}