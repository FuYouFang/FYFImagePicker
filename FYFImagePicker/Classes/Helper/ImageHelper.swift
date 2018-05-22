//
//  ImageHelper.swift
//  FYFImagePicker
//
//  Created by fuyoufang on 2018/5/19.
//  Copyright © 2018 fuyoufang. All rights reserved.
//

import UIKit
import AssetsLibrary
import Photos


class ImageHelper {
    
    static func authorizationStatusAuthorized() -> Bool {
        if #available(iOS 8.0, *) {
            let status = PHPhotoLibrary.authorizationStatus()
            if status == .notDetermined {
                requestAuthorization()
            }
            return status == .authorized
        } else {
            let status = ALAssetsLibrary.authorizationStatus()
            if status == .notDetermined {
                requestAuthorization()
            }
            return status == .authorized
        }
    }
    
    static func get(allowPickImage: Bool = true, allowPickVideo: Bool = false, needFetchAssets: Bool = false, sortAscendingByModificationDate: Bool = false) -> [Album] {
        var albumModels = [Album]()
        
        if #available(iOS 8.0, *) {
            let option = PHFetchOptions.init()
            if allowPickImage {
                option.predicate = NSPredicate.init(format: "mediaType == %ld", PHAssetMediaType.image.rawValue)
            }
            
            if allowPickVideo {
                option.predicate = NSPredicate.init(format: "mediaType == %ld", PHAssetMediaType.video.rawValue)
            }
            
            if sortAscendingByModificationDate {
                option.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: sortAscendingByModificationDate)]
            }
            
            typealias CollectionsHandler = ((PHCollection, Int, UnsafeMutablePointer<ObjCBool>) -> Void)
    
            let collectionsHandler: CollectionsHandler = { collection, i, u in
                guard let assertCollection: PHAssetCollection = collection as? PHAssetCollection else {
                    return
                }
                guard assertCollection.assetCollectionSubtype != .smartAlbumAllHidden else  {
                    return
                }
                
                let fetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(in: assertCollection, options: option)
                guard fetchResult.count > 0 else {
                    return
                }
                let album = Album()
                album.name = assertCollection.localizedTitle
                album.result = fetchResult
                //                    album.result = album
                albumModels.append(album)
            }
            
            let myPhotoStreamAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumMyPhotoStream, options: nil)
            myPhotoStreamAlbums.enumerateObjects(collectionsHandler)
            let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
            smartAlbums.enumerateObjects(collectionsHandler)
            // PHFetchResult<PHCollection>
            let topLevelUserAlbums = PHCollectionList.fetchTopLevelUserCollections(with: nil)
            topLevelUserAlbums.enumerateObjects(collectionsHandler)
            let syncedAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumSyncedAlbum, options: nil)
            syncedAlbums.enumerateObjects(collectionsHandler)
            let sharedAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumCloudShared, options: nil)
            sharedAlbums.enumerateObjects(collectionsHandler)
        }
        return albumModels
    }
    
    private static func requestAuthorization() {
        if #available(iOS 8.0, *) {
            PHPhotoLibrary.requestAuthorization { (status) in
                
            }                
            DispatchQueue.global(qos: .background).async {
            }
        } else {
            ALAssetsLibrary.init().enumerateGroups(withTypes: 0, using: { (group, result) in
                
            }) { (error) in
                
            }
        }
    }
    

}
