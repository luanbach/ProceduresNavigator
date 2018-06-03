//
//  ProceduresTableViewCell.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import UIKit

class ProceduresTableViewCell: UITableViewCell {
    // MARK: - Public
    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .procedureName
        return nameLabel
    }()

    // MARK: - View Setup
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            iconImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

            // Set a fixed width and height
            iconImageView.heightAnchor.constraint(equalToConstant: 64),
            iconImageView.widthAnchor.constraint(equalToConstant: 64)
            ])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor)
            ])
    }
}
