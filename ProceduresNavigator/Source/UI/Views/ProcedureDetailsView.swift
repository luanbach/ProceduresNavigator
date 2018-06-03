//
//  ProcedureDetailsView.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import RxSwift
import RxCocoa
import Kingfisher

class ProcedureDetailsView: UIView {
    // MARK: - Output
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .background
        tableView.registerReusableElement(ProceduresTableViewCell.self)
        tableView.tableFooterView = UIView()
        return tableView
    }()

    // MARK: - Private
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .detailImageViewBackground
        return imageView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .detailTitle
        titleLabel.font = .detailTitle
        titleLabel.textAlignment = .center
        return titleLabel
    }()

    private var constraintsConfigured: Bool = false

    // MARK: - View Setup
    @available(iOS, unavailable, message: "init(coder:) is unavailable, use init() instead")
    required init?(coder aDecoder: NSCoder) { fatalError() }

    @available(iOS, unavailable, message: "init(frame:) is unavailable, use init() instead")
    override init(frame: CGRect) { fatalError() }

    init() {
        super.init(frame: .zero)

        self.backgroundColor = .background
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(tableView)
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        guard constraintsConfigured == false else {
            return
        }

        setupConstaints()
        constraintsConfigured = true
    }

    private func setupConstaints() {
        // Image view pinned to top and kept at a 16:9 ratio
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 9 / 16)
            ])

        // Title label is centered just below image
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
            ])

        // Table view takes up the remaining space
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.lastBaselineAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
