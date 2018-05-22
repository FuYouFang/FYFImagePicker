//
//  AlbumPickerCell.swift
//  FYFImagePicker
//
//  Created by fuyoufang on 2018/5/19.
//  Copyright © 2018 fuyoufang. All rights reserved.
//

import UIKit

class AlbumPickerCell: UITableViewCell {

    var album: Album? {
        didSet {
            self.textLabel?.text = album?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    static func cell(tableView: UITableView) -> AlbumPickerCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumPickerCell") as? AlbumPickerCell
        if cell != nil {
            return cell!
        } else {
            return AlbumPickerCell.init(style: .default, reuseIdentifier: "AlbumPickerCell")
        }
    }
}
