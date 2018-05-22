//
//  FYFImagePicker.swift
//  FYFImagePicker
//
//  Created by fuyoufang on 2018/5/19.
//  Copyright © 2018 fuyoufang. All rights reserved.
//

import UIKit

public protocol ImagePicker: class {
    var maxImagesCount: Int { get set }
    var minImagesConnt: Int { get set }
    
    var alwaysEnableFinish: Bool { get set }
    var sortAscendingByModificationDate: Bool { get set }
    
    var photoWidth: Float { get set }
    var photoPreviewMaxWidth: Float { get set }
    var timeout: Int { get set }
    
    var allowPickingOriginalPhoto: Bool { get set }
    var allowPickingVideo: Bool { get set }
    var allowPickingMultipleVideo: Bool { get set }
    var allowPickingGif: Bool { get set }
    var allowPickingImage: Bool { get set }
    var allowTakePicture: Bool { get set }
    var allowTakeVideo: Bool { get set }
    var videoMaximumDuration: Int { get set }
    var settingImagePickerController: ((_ imagePickerController: UIImagePickerController) -> Void)? { get set }
    var allowPreview: Bool { get set }
    
    var autoDismiss: Bool { get set }
    var onlyReturnAsset: Bool { get set }
    var showSelectedIndex: Bool { get set }
    var showPhotoCannotSelectLayer: Bool { get set }
    
//    var preSelectedAssets: ;
    var minWidthOfSelectablePhoto: Int? { get set }
    var maxWidthOfSelectablePhoto: Int? { get set }
    
    var hideCanNotSelectPhoto: Bool { get set }
    var statusBarStyle: UIStatusBarStyle { get set }
    
    ///< 在单选模式下，照片列表页中，显示选择按钮,默认为NO
    var showSelectButton: Bool { get set }
    ///< 允许裁剪,默认为YES，showSelectBtn为NO才生效
    var allowCrop: Bool { get set }
    ///< 裁剪框的尺寸
    var cropRect: CGRect? { get set }
    ///< 裁剪框的尺寸(竖屏)
    var cropRectPortrait: CGRect? { get set }
    var cropRectLandscape: CGRect?  { get set } ///< 裁剪框的尺寸(横屏)
    ///< 需要圆形裁剪框
    var needCircleCrop: Bool { get set }
    ///< 圆形裁剪框半径大小
    var circleCropRadius: Int? { get set }
    
}
