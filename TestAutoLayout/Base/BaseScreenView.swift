//
//  BaseScreenView.swift
//  TestAutoLayout
//
//  Created by VAndrJ on 10.06.2024.
//

import UIKit

class BaseScreenView: BaseView, ScreenView {
    @Published var appearTime = ""

    func viewDidAppear(_ animated: Bool) {
        let currentTime = CFAbsoluteTimeGetCurrent()
        let appearTime = currentTime - (initialTime ?? 0)
        self.appearTime = appearTime.formatted()

        print(appearTime)
    }
}
