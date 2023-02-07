//
//  TextFieldTableViewCell.swift
//  UITextFieldFocusWithKeyboardExample
//
//  Created by cano on 2023/02/07.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    var tableView : UITableView? = nil
    var scrollView : UIScrollView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TextFieldTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let scrollView = self.scrollView {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let y = textField.superview!.convert(textField.frame.origin, to: scrollView).y + textField.frame.size.height
            let margin = scrollView.frame.size.height - window.frame.size.height / 2.0 - 40.0
            scrollView.setContentOffset(CGPoint(x: 0.0, y: y - margin), animated: true)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        scrollView!.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        return true
    }
}
