//
//  BaseViewController.swift
//  TestAutoLayout
//
//  Created by VAndrJ on 10.06.2024.
//

import UIKit

protocol ScreenView: UIView {

    func viewDidAppear(_ animated: Bool)
}

class BaseViewController<V: UIView & ScreenView>: UIViewController {
    let contentView: V

    init(contentView: V) {
        self.contentView = contentView

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        contentView.viewDidAppear(animated)
    }
}
