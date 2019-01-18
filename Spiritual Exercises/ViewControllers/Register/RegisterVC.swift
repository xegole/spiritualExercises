import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    let pickerGender = UIPickerView()
    let genderData = [String](arrayLiteral: "Other", "Male", "Female")
    
    let pickerCountry = UIPickerView()
    let countriesData = [String](arrayLiteral: "Argentina", "Colombia" , "Mexico", "Brasil", "Panama")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        self.setUpNavBar()
    
        pickerGender.delegate = self
        pickerCountry.delegate = self
        
        pickerGender.backgroundColor = .white
        
        pickerGender.showsSelectionIndicator = true
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        txtGender.inputView = pickerGender
        txtGender.inputAccessoryView = toolBar
        
        txtCountry.inputView = pickerCountry
        
        txtAge.delegate = self
    }
    
    
    @objc func donePicker(){
        txtGender.resignFirstResponder()
    }
    
    
    private func setUpNavBar(){
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onDoneRegister))
        navigationItem.rightBarButtonItem = btnDone
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func onDoneRegister(){
        if self.validateForm() {
            
        }
    }
    
    private func validateForm() -> Bool{
        var validateForm = true;
        validateForm = txtName.isValid(errorText: "Please enter your name")
        validateForm = txtLastName.isValid(errorText: "Please enter your last name")
        validateForm = txtAge.isValid(errorText: "Please enter your age")
        return validateForm
    }

}

extension RegisterVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 2
    }
}

extension RegisterVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pickerGender:
            return genderData.count
        case pickerCountry:
            return countriesData.count
        default:
            return 0
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case pickerGender:
            return genderData[row]
        case pickerCountry:
            return countriesData[row]
        default:
            return ""
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case pickerGender:
            txtGender.text = genderData[row]
        case pickerCountry:
            txtCountry.text = countriesData[row]
        default:
            txtGender.text = ""
        }
    }
}
