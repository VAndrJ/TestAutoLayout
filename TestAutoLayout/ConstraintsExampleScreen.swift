//
//  ConstraintsExampleScreen.swift
//  TestAutoLayout
//
//  Created by VAndrJ on 10.06.2024.
//

import UIKit

final class ConstraintsExampleScreenView: BaseScreenView {
    private let scrollView = UIScrollView()
    private let containerView = UIStackView().apply {
        $0.axis = .vertical
    }
    private let tileViews = (0..<800).map(ConstraintsTileView.init(index:))

    override func addElements() {
        addAutolayoutSubview(scrollView)
        scrollView
            .toSuperEdges(isSafe: true)
        scrollView.addAutolayoutSubview(containerView)
        containerView
            .toSuperEdges()
            .toSuper(.width)
        containerView.addArrangedSubviewsArray(tileViews)
    }

    override func configure() {
        backgroundColor = .systemBackground
    }
}

final class ConstraintsTileView: BaseView {
    private let titleLabel = UILabel().apply {
        $0.text = "Title"
    }
    private let descriptionLabel = UILabel().apply {
        $0.text = "Description"
        $0.textAlignment = .center
    }
    private let numberLabel = UILabel().apply {
        $0.textAlignment = .right
    }

    convenience init(index: Int) {
        self.init()

        numberLabel.text = index.formatted()
    }

    override func addElements() {
        addAutolayoutSubviews(titleLabel, descriptionLabel, numberLabel)
        // Comment out constraints to get rough init time.
        // v1: slowest
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: topAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
//            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3),
//
//            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
//            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
//            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3),
//
//            numberLabel.topAnchor.constraint(equalTo: topAnchor),
//            numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
//            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            numberLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3),
//        ])
        // v2: layout priorities
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3).apply {
                $0.priority = .priority999
            },

            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3).apply {
                $0.priority = .priority999
            },

            numberLabel.topAnchor.constraint(equalTo: topAnchor),
            numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            numberLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3).apply {
                $0.priority = .priority999
            },
        ])
        // v3: 2 of 3 labels vertical centering
//        NSLayoutConstraint.activate([
//            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3).apply {
//                $0.priority = .priority999
//            },
//
//            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
//            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
//            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3).apply {
//                $0.priority = .priority999
//            },
//
//            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            numberLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3).apply {
//                $0.priority = .priority999
//            },
//        ])
    }
}

extension UILayoutPriority {
    static let priority999 = UILayoutPriority(999)
}

let hundredConstraintsTilesInitTimes = [
    0.03260791301727295,
    0.03699004650115967,
    0.03316700458526611,
    0.032711029052734375,
    0.03415799140930176
]

let hundredConstraintsTilesTimes = [
    0.1078939437866211,
    0.0966329574584961,
    0.0976250171661377,
    0.10264897346496582,
    0.09925699234008789,
] // average layout: 0.06688477993011474, per tile: 0.0006688477993011474

let hundredConstraintsTilesV2Times = [
    0.08751296997070312,
    0.08485007286071777,
    0.08661198616027832,
    0.08694100379943848,
    0.08704996109008789,
] // average layout: 0.05266640186309814, per tile: 0.0005266640186309815

let fourHundredConstraintsTilesInitTimes = [
    0.05716598033905029,
    0.060266971588134766,
    0.056001901626586914,
    0.05537891387939453,
    0.06290304660797119,
]

let fourHundredConstraintsTilesTimes = [
    0.9362050294876099,
    0.9330120086669922,
    0.9409810304641724,
    0.9331440925598145,
    0.9428720474243164,
] // average layout: 0.8788994789123535, per tile: 0.002197248697280884

let fourHundredConstraintsTilesV2Times = [
    0.8643279075622559,
    0.8247320652008057,
    0.8232569694519043,
    0.8143110275268555,
    0.8466930389404297,
] // average layout: 0.7763208389282227, per tile: 0.0019408020973205567

let eightHundredConstraintsTilesInitTimes = [
    0.08492398262023926,
    0.08572602272033691,
    0.0862499475479126,
    0.08381998538970947,
    0.08872401714324951,
]

let eightHundredConstraintsTilesTimes = [
    4.9881409883499146,
    4.930417060852051,
    4.884824991226196,
    4.947707033157349,
    4.860504984855652,
] // average layout: 4.836430220603943, per tile: 0.006045537775754929

let eightHundredConstraintsTilesV2Times = [
    4.511709928512573,
    4.533610105514526,
    4.466424942016602,
    4.530685901641846,
    4.5165029764175415,
] // average layout: 4.4258979797363285, per tile: 0.00553237247467041
