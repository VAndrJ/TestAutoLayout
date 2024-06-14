//
//  FlexlayoutExampleScreen.swift
//  TestAutoLayout
//
//  Created by VAndrJ on 10.06.2024.
//

import UIKit
import FlexLayout
import PinLayout

final class FlexlayoutExampleScreenView: BaseScreenView {
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let tileViews = (0..<800).map(FlexLayoutTileView.init(index:))

    override func addElements() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        // Comment out to get rough init time.
        containerView.flex.direction(.column).define { flex in
            tileViews.forEach {
                flex.addItem($0)
            }
        }
    }

    override func configure() {
        backgroundColor = .systemBackground
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        scrollView.pin.top().left().bottom().right()
        containerView.pin.top().left().bottom().right()
        containerView.flex.layout(mode: .adjustHeight)
        scrollView.contentSize = containerView.frame.size
    }
}

final class FlexLayoutTileView: BaseView {
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
        // uncomment `addSubviews` and comment out the rest to get the approximate init time with adding subviews.
//        addSubviews(titleLabel, descriptionLabel, numberLabel)
        flex.direction(.row).define {
            $0.addItem(titleLabel).basis(1).grow(1)
            $0.addItem(descriptionLabel).basis(1).grow(1)
            $0.addItem(numberLabel).basis(1).grow(1)
        }
    }
}

let hundredFlexTilesInitTimes = [
    0.031861066818237305,
    0.03209793567657471,
    0.030713915824890137,
    0.03268897533416748,
    0.031093955039978027,
]

let hundredFlexTilesTimes = [
    0.05162501335144043,
    0.04813098907470703,
    0.0504450798034668,
    0.051953911781311035,
    0.05053699016571045,
] // average layout: 0.018847227096557617, per tile: 0.00018847227096557617

let fourHundredFlexTilesInitTimes = [
    0.04621291160583496,
    0.05197501182556152,
    0.04713797569274902,
    0.047624945640563965,
    0.049139976501464844,
]

let fourHundredFlexTilesTimes = [
    0.12253594398498535,
    0.12377691268920898,
    0.12189102172851562,
    0.12602901458740234,
    0.12462306022644043,
] // average layout: 0.07535302639007568, per tile: 0.0001883825659751892

let eightHundredFlexTilesInitTimes = [
    0.07047104835510254,
    0.06813406944274902,
    0.07016503810882568,
    0.06745707988739014,
    0.06999599933624268,
]

let eightHundredFlexTilesTimes = [
    0.22435295581817627,
    0.2196650505065918,
    0.2101680040359497,
    0.23116004467010498,
    0.21473908424377441,
] // average layout: 0.1507723808288574, per tile: 0.00018846547603607177
