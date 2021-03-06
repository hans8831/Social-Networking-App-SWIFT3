//
//  SearchWorldViewController.swift
//  My-Mo
//
//  Created by iDeveloper on 11/14/16.
//  Copyright © 2016 iDeveloper. All rights reserved.
//

import UIKit

class SearchWorldViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var view_Navigation: UIView!
    @IBOutlet weak var view_Main: UIView!
    @IBOutlet weak var view_Title: UIView!
    @IBOutlet weak var lbl_Title: UILabel!
    
    @IBOutlet weak var view_Input: UIView!
    @IBOutlet weak var lbl_Numbers: UILabel!
    @IBOutlet weak var txt_Country: UITextField!
    @IBOutlet weak var txt_City: UITextField!
    
    @IBOutlet weak var view_Table: UIView!
    @IBOutlet weak var tbl_List: UITableView!

    @IBOutlet weak var view_Button: UIView!
    @IBOutlet weak var btn_Search: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    //MARK: - Buttons' Events
    @IBAction func click_btn_BAck(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func click_btn_Search(_ sender: AnyObject) {
    }
    
    //MARK: - UITableView delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tbl_List.dequeueReusableCell(withIdentifier: "SearchMapCell")! as UITableViewCell
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let img_Avatar = cell.viewWithTag(100) as? UIImageView
        img_Avatar?.image = UIImage.init(named: "Home_img_Sample.png")
        img_Avatar?.layer.cornerRadius = (img_Avatar?.frame.size.height)! / 2
        img_Avatar?.layer.masksToBounds = true
        img_Avatar?.layer.borderWidth = 0
        img_Avatar?.layer.borderColor = UIColor.gray.cgColor
        
        var btn_Likes: UIButton! = nil
        for subview in cell.contentView.subviews {
            if subview is UIButton {
                btn_Likes = subview as! UIButton
                
                btn_Likes?.addTarget(self, action: #selector(pressedLikesButton), for: .touchUpInside)
                btn_Likes?.tag = 10000 + indexPath.row
                btn_Likes.frame = CGRect(x: COMMON.X(view: btn_Likes),
                                         y: COMMON.Y(view: btn_Likes),
                                         width: COMMON.HEIGHT(view: btn_Likes),
                                         height: COMMON.HEIGHT(view: btn_Likes))
                
                break
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func pressedLikesButton(sender: UIButton){
        print(sender.tag)
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txt_Country.resignFirstResponder()
        self.txt_City.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
