//
//  ViewController.swift
//  VDropDown
//
//  Created by Vishal Kalola on 04/07/17.
//  Copyright © 2017 Vishal Kalola. All rights reserved.
//

import UIKit

class ViewController: UIViewController,VDropDown,UITextFieldDelegate {
    
    //Property
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var btnDropDown2: UIButton!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    
    //DropDown Variable
    var objDropDown:VDropDownViewController!
    var arr:NSMutableOrderedSet = NSMutableOrderedSet()
    var SelectedData = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = ["one","two","three","four","five"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: textfield Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if textField == txtField {
            ShowDropDown(isMultipleSelectionAllow: false, vc: self, OnView: textField, ArrData: arr, ArrSelectedData: Array<String>())
            return false
        }else if textField == txtField2{
            ShowDropDown(isMultipleSelectionAllow: true, vc: self, OnView: textField, ArrData: arr, ArrSelectedData: SelectedData)
            return false
            
        }else{
            return true
        }
    }
    
    //MARK: Delegate method DropDown
    func VDropDownDidSelect(_ tableView: UITableView, View:UIView, Index: IndexPath, SelectedItem:String, MultipleSelectedItems:Array<String>, isMulple:Bool) {
        
        if View is UITextField {
            if View == txtField
            {
                txtField.text = SelectedItem
            }
            else{
                var strJoinValue = MultipleSelectedItems.joined(separator: ",")
                SelectedData = MultipleSelectedItems
                if MultipleSelectedItems.count == 0
                {
                    strJoinValue = ""
                }
                txtField2.text = strJoinValue
            }
        }else{
            if isMulple == false {
                if View == btnDropDown2{
                    btnDropDown2.setTitle(SelectedItem, for: .normal)
                }
            }else{
                var strJoinValue = MultipleSelectedItems.joined(separator: ",")
                SelectedData = MultipleSelectedItems
                if MultipleSelectedItems.count == 0
                {
                    strJoinValue = "DropDown 1"
                }
                if View == btnDropDown {
                    btnDropDown.setTitle(strJoinValue, for: .normal)
                }
            }
        }
    }
    
    func VDropDownHide() {
        print("Hide DropDown")
    }
    
    // MARK: show dropdown on View
    func ShowDropDown(isMultipleSelectionAllow:Bool, vc:UIViewController, OnView:UIView, ArrData:NSMutableOrderedSet, ArrSelectedData:Array<String>) -> Void {
        
        objDropDown = VDropDownViewController.init(nibName: "DropDownListView", bundle: nil)
        objDropDown.view.frame = CGRect.init(x: 0, y: 20, width: self.view.frame.size.width, height: self.view.frame.size.height)
        objDropDown.isMultipleSelectionAllow = isMultipleSelectionAllow
        objDropDown.mAryPassedData = ArrData
        objDropDown.delegate = vc as? VDropDown
        objDropDown.selectedData = ArrSelectedData
        objDropDown.ShowDropDown(self, OnView:OnView);
    }
    
    //MARK: Button Action
    @IBAction func DropDownAction(_ sender: UIButton) {
        ShowDropDown(isMultipleSelectionAllow: true, vc: self, OnView: sender, ArrData:arr,ArrSelectedData:SelectedData)
    }
    
    @IBAction func Dropdown2Action(_ sender: UIButton) {
        ShowDropDown(isMultipleSelectionAllow: false, vc: self, OnView: sender, ArrData:arr,ArrSelectedData:Array<String>())
    }
}

