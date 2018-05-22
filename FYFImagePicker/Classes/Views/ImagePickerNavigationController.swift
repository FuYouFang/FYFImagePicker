//
//  ImagePickerNavigationController.swift
//  FYFImagePicker
//
//  Created by fuyoufang on 2018/5/19.
//  Copyright © 2018 fuyoufang. All rights reserved.
//

import UIKit

open class ImagePickerNavigationController: UINavigationController, ImagePicker {
    
    public var maxImagesCount: Int = 9
    
    public var minImagesConnt: Int = 0
    
    public var alwaysEnableFinish: Bool = true
    
    public var sortAscendingByModificationDate: Bool = true
    
    public var photoWidth: Float = 828.0
    
    public var photoPreviewMaxWidth: Float = 600
    
    public var timeout: Int = 15
    
    public var allowPickingOriginalPhoto: Bool = true
    
    public var allowPickingVideo: Bool = true
    
    public var allowPickingMultipleVideo: Bool = false
    
    public var allowPickingGif: Bool = false
    
    public var allowPickingImage: Bool = true
    
    public var allowTakePicture: Bool = false
    
    public var allowTakeVideo: Bool = false
    
    public var videoMaximumDuration: Int = 10
    
    public var settingImagePickerController: ((UIImagePickerController) -> Void)?
    
    public var allowPreview: Bool = true
    
    public var autoDismiss: Bool = true
    
    public var onlyReturnAsset: Bool = false
    
    public var showSelectedIndex: Bool = true
    
    public var showPhotoCannotSelectLayer: Bool = false
    
    public var minWidthOfSelectablePhoto: Int?
    
    public var maxWidthOfSelectablePhoto: Int?
    
    public var hideCanNotSelectPhoto: Bool = false
    
    public var statusBarStyle: UIStatusBarStyle = .default
    
    public var showSelectButton: Bool = false

    public var allowCrop: Bool = true
    
    public var cropRect: CGRect?
    
    public var cropRectPortrait: CGRect?
    
    public var cropRectLandscape: CGRect?
    
    public var needCircleCrop: Bool = false
    
    public var circleCropRadius: Int?
    

    public init(maxImageCount: Int) {
        let albumPickerController = AlbumPickerController()
        super.init(rootViewController: albumPickerController)
//        let imagePickerController = ImagePickerController()
//        pushViewController(imagePickerController, animated: false)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
    }
}
