//
//  Album.swift
//  FYFImagePicker
//
//  Created by fuyoufang on 2018/5/19.
//  Copyright © 2018 fuyoufang. All rights reserved.
//

import Foundation
import AssetsLibrary
import Photos

class Album {
    var name: String?
    var count: Int = 0
    var result: PHFetchResult<PHAsset>?             ///< PHFetchResult<PHAsset> or ALAssetsGroup<ALAsset>
    
//    @property (nonatomic, strong) NSArray *models;
//    @property (nonatomic, strong) NSArray *selectedModels;
//    @property (nonatomic, assign) NSUInteger selectedCount;
//
    var isCameraRoll: Bool = false

}
