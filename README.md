# VDropDown in Swift 4.0 and compatible with legacy Swift

# Requirements
Xcode 8+          
Swift 3.0,Swift 4.0                   
iOS 8+                        
ARC                   

# Basic usage 

## Add the **VDropDownClass** folder in your project.

**Declare variable global in class**
```
    var objDropDown:VDropDownViewController!
    var arr:NSMutableOrderedSet = NSMutableOrderedSet()
    var SelectedData = Array<String>()
```
**Show Dropdown on Button OR textField With multiple Selection and Single selection**
```
func ShowDropDown(isMultipleSelectionAllow:Bool, vc:UIViewController, OnView:UIView, ArrData:NSMutableOrderedSet, ArrSelectedData:Array<String>) -> Void {
        objDropDown = VDropDownViewController.init(nibName: "DropDownListView", bundle: nil)
        objDropDown.view.frame = CGRect.init(x: 0, y: 20, width: self.view.frame.size.width, height: self.view.frame.size.height)
        objDropDown.isMultipleSelectionAllow = isMultipleSelectionAllow
        objDropDown.mAryPassedData = ArrData
        objDropDown.delegate = vc as? VDropDown
        objDropDown.selectedData = ArrSelectedData
        objDropDown.ShowDropDown(self, OnView:OnView);
}
```
**Call above function in Button & textField**                             

**Button**
```
@IBAction func Dropdown2Action(_ sender: UIButton) {
    ShowDropDown(isMultipleSelectionAllow: false, vc: self, OnView: sender, ArrData:arr,ArrSelectedData:Array<String>())
}
```
**TextField**
```
func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
   self.view.endEditing(true)
   if textField == txtField {
      ShowDropDown(isMultipleSelectionAllow: false, vc: self, OnView: textField, ArrData: arr, ArrSelectedData: Array<String>())
      return false
   }else if textField == txtField2{
      ShowDropDown(isMultipleSelectionAllow: false, vc: self, OnView: textField, ArrData: arr, ArrSelectedData: Array<String>())
      return false   
   }else{
     return true
   }
}
```
**Get the Selection of Dropdown cell either single value or multiple value in below method & Also get the dropdown close event**
```
func VDropDownDidSelect(_ tableView: UITableView, View:UIView, Index: IndexPath, SelectedItem:String, MultipleSelectedItems:Array<String>, isMulple:Bool) {
    
}
    
func VDropDownHide() {
    
}
  ```
