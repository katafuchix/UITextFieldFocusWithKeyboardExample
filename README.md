# UITextFieldFocusWithKeyboardExample
### focus textfield in tableview with keyboard and scroll
<div>
<img width="250" alt="スクリーンショット 2023-02-07 23 05 40" src="https://user-images.githubusercontent.com/6063541/217267136-c27f777c-6c9c-468d-8b8d-b4c9b8fa477e.png">
  　　
<img width="250" alt="スクリーンショット 2023-02-07 23 05 44" src="https://user-images.githubusercontent.com/6063541/217267145-6300a951-118e-478c-a271-8633b8435fe8.png">
</div>

- Place UITableView inside UIScrollView

<img width="600" alt="スクリーンショット 2023-02-07 22 59 49" src="https://user-images.githubusercontent.com/6063541/217267547-53d4cf53-8840-4f93-8bee-10a7fb1044e5.png">

- Custom UItableViewCell With UITextFieldDelegate like this

```
class TextFieldTableViewCell: UITableViewCell {

    var scrollView : UIScrollView? = nil

```

```
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
```
