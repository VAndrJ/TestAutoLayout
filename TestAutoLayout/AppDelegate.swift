//
//  AppDelegate.swift
//  TestAutoLayout
//
//  Created by VAndrJ on 10.06.2024.
//

import UIKit

var initialTime: CFAbsoluteTime?

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        initialTime = CFAbsoluteTimeGetCurrent()

        window = UIWindow()
        window?.rootViewController = BaseViewController(contentView: StackViewExampleScreenView())
//        window?.rootViewController = BaseViewController(contentView: ConstraintsExampleScreenView())
//        window?.rootViewController = BaseViewController(contentView: YogaExampleScreenView())
//        window?.rootViewController = BaseViewController(contentView: FlexlayoutExampleScreenView())
        window?.makeKeyAndVisible()

        return true
    }
}
