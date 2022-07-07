//
//  ViewController.swift
//  ModallyPresentedSplitVCIPadOS16Bug
//
//  Created by Geoff Hackworth on 07/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sizeLabel: UILabel!

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let iPadOSVersion = UIDevice.current.systemVersion

        // The primary view controller in a double/triple column split view controller
        // is wider than it appears on screen to provide a bit of over-scroll when swiping
        // right. To calculate the true width on screen we can use the layoutMarginsGuide
        // layout frame (the bit between the margins) and add two lots of the right margin
        // (the left margin is 100pt wider to provide the over-scroll)
        let width = Int(view.layoutMarginsGuide.layoutFrame.width + 2 * view.layoutMargins.right)
        let height = Int(view.bounds.height)

        sizeLabel.text = """
            iPadOS: \(iPadOSVersion)

            Width: \(width)pt
            Height: \(height)pt
            """
    }

    // This is only used by the secondary view controller in a modally-presented split view controller
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

