
import UIKit



class ChangeColorVC: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var redSliderOut: UISlider!
    @IBOutlet weak var greenSliderOut: UISlider!
    @IBOutlet weak var blueSliderOut: UISlider!
    
    var delegate: ChangeColorVCDelegate!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = colorView.frame.size.height / 10
        textFieldValue()
        viewRGB()
        addDoneButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    @IBAction func redSlider(_ sender: UISlider) {
        let red:Int = Int(redSliderOut.value)
        redTextField.text = String(red)
        viewRGB()
        
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        let green:Int = Int(greenSliderOut.value)
        greenTextField.text = String(green)
        viewRGB()
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        let blue:Int = Int(blueSliderOut.value)
        blueTextField.text = String(blue)
        viewRGB()
    }
    
    @IBAction func redTextAction(_ sender: UITextField) {
        if let red = redTextField.text {
            self.redSliderOut.value = (red as NSString).floatValue
            }
        viewRGB()
    }
    
    @IBAction func greenTextAction(_ sender: UITextField) {
        if let green = greenTextField.text {
            self.greenSliderOut.value = (green as NSString).floatValue
            }
        viewRGB()
}
    
    @IBAction func blueTextAction(_ sender: UITextField) {
        if let blue = blueTextField.text {
            self.blueSliderOut.value = (blue as NSString).floatValue
            }
        viewRGB()
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        delegate.chageColor(colorView.backgroundColor!)
        dismiss(animated: true)
    }
    
    func addDoneButton()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done",
                                                    style: .done,
                                                    target: self,
                                                    action: #selector(self.doneButtonAction))
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        redTextField.inputAccessoryView = doneToolbar
        greenTextField.inputAccessoryView = doneToolbar
        blueTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        view.endEditing(true)
        viewRGB()
    }
    
    private func textFieldValue() {
        let red = Int(redSliderOut.value)
        let green = Int(greenSliderOut.value)
        let blue = Int(blueSliderOut.value)
            
        redTextField.text = String(red)
        greenTextField.text = String(green)
        blueTextField.text = String(blue)
    }
    
    private func viewRGB() {
        colorView.backgroundColor = UIColor(red: (CGFloat(redSliderOut.value)/255),
                                            green: (CGFloat(greenSliderOut.value)/255),
                                            blue: (CGFloat(blueSliderOut.value)/255),
                                            alpha: 1.0)
    }
}

