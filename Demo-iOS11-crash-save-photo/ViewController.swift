//
//  ViewController.swift
//  Demo-iOS11-crash-save-photo
//
//  Created by 孙继刚 on 2017/9/29.
//  Copyright © 2017年 madordie. All rights reserved.
//

import UIKit
import AssetsLibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        crash()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func crash() {
        let img = UIImage(named: "278.jpg")
        let library = ALAssetsLibrary()
        guard ALAssetsLibrary.authorizationStatus() == .authorized else { return }
        guard let orientation = ALAssetOrientation(rawValue: img?.imageOrientation.rawValue ?? 0) else { return }
        library.writeImage(toSavedPhotosAlbum: img?.cgImage, orientation: orientation) { (url, error) in
            guard error != nil else { print("no crash"); return }
        }
    }
}

