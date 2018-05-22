//
//  AlbumPickerController.swift
//  FYFImagePicker
//
//  Created by fuyoufang on 2018/5/19.
//  Copyright © 2018 fuyoufang. All rights reserved.
//

import UIKit
import SnapKit

class AlbumPickerController: UIViewController {

    var albums = [Album]()
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var imagePickerNavigationController: ImagePickerNavigationController? = {
        return self.navigationController as? ImagePickerNavigationController
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "FYFImagePicker.Navigation.Back".fyf_localize(fallback: "Back"), style: .plain, target: nil, action: nil)

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "FYFImagePicker.Navigation.Cancel".fyf_localize(fallback: "Cancel"), style: .plain, target: self, action: #selector(cancel))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if imagePickerNavigationController?.allowPickingVideo ?? false {
            title = "FYFImagePicker.Navigation.Videos".fyf_localize(fallback: "Videos")
        } else {
            title = "FYFImagePicker.Navigation.Images".fyf_localize(fallback: "Images")
        }
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if ImageHelper.authorizationStatusAuthorized() {
            albums = ImageHelper.get(needFetchAssets: true)
            tableView.reloadData()
        }
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    

    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
}

extension AlbumPickerController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

extension AlbumPickerController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AlbumPickerCell.cell(tableView: tableView)
        cell.album = albums[indexPath.row]
        return cell
    }
    
}
