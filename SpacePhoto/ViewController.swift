//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Thiago Martins on 23/10/18.
//  Copyright © 2018 Thiago Martins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Properties:
    @IBOutlet weak var spaceImageView: UIImageView!
    @IBOutlet weak var imageDescriptionLabel: UILabel!
    @IBOutlet weak var imageCopyrightLabel: UILabel!
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDescriptionLabel.text = ""
        imageCopyrightLabel.text = ""
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
    }
    
    func updateUI(with photoInfo : PhotoInfo) {        
        photoInfoController.fetchImage(from: photoInfo.url) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.spaceImageView.image = image
                    self.imageDescriptionLabel.text = photoInfo.description
                    if let copyright = photoInfo.copyright {
                        self.imageCopyrightLabel.text = copyright
                    } else {
                        self.imageCopyrightLabel.isHidden = true
                    }
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }

}

