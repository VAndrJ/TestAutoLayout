//
//  StackViewExampleScreen.swift
//  TestAutoLayout
//
//  Created by VAndrJ on 10.06.2024.
//

import UIKit

final class StackViewExampleScreenView: BaseScreenView {
    private let scrollView = UIScrollView()
    private let containerView = UIStackView().apply {
        $0.axis = .vertical
    }
    private let tileViews = (0..<800).map(StackTileView.init(index:))

    override func addElements() {
        addAutolayoutSubview(scrollView)
        scrollView
            .toSuperEdges(isSafe: true)
        scrollView.addAutolayoutSubview(containerView)
        containerView
            .toSuperEdges()
            .toSuper(.width)
        // Comment out this line to get rough init time.
        containerView.addArrangedSubviewsArray(tileViews)
    }

    override func configure() {
        backgroundColor = .systemBackground
    }
}

final class StackTileView: UIStackView {
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

    override init(frame: CGRect) {
        super.init(frame: frame)

        addElements()
        configure()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addElements() {
//        addSubviews(titleLabel, descriptionLabel, numberLabel)
        addArrangedSubviews(titleLabel, descriptionLabel, numberLabel)
    }

    func configure() {
        axis = .horizontal
        distribution = .fillEqually
    }
}

let hundredStackTilesInitTimes = [
    0.03339207172393799,
    0.03209102153778076,
    0.030482053756713867,
    0.031478047370910645,
    0.030267000198364258,
]

let hundredStackTilesTimes = [
    0.14326894283294678,
    0.14128398895263672,
    0.1380530595779419,
    0.13599002361297607,
    0.13578402996063232,
] // average layout: 0.10733397006988525, per tile: 0.0010733397006988524

let fourHundredStackTilesInitTimes = [
    0.05449402332305908,
    0.05231904983520508,
    0.053009033203125,
    0.05113792419433594,
    0.05258595943450928,
]

let fourHundredStackTilesTimes = [
    1.7109529972076416,
    1.7330299615859985,
    1.7381389141082764,
    1.7351770401000977,
    1.743124008178711,
] // average layout: 1.6793753862380982, per tile: 0.004198438465595245

let eightHundredStackTilesInitTimes = [
    0.08208096027374268,
    0.07708501815795898,
    0.07638299465179443,
    0.07811295986175537,
    0.07748305797576904
]

let eightHundredStackTilesTimes = [
    11.582114100456238,
    11.546649932861328,
    11.576059937477112,
    11.6039400100708,
] // average layout: 9.183523797988892, per tile: 0.011479404747486115
