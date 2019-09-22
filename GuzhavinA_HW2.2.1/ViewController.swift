
import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var greenTextField: UITextField!
    
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var redSliderOut: UISlider!
    
    @IBOutlet weak var greenSliderOut: UISlider!
    
    @IBOutlet weak var blueSliderOut: UISlider!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = colorView.frame.size.height / 10
        
        textFieldValue()
        
        viewRGB()
        
    }

    @IBAction func redSlider(_ sender: UISlider) {
        
        redTextField.text = String(Int(redSliderOut.value))
        
        viewRGB()
        
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        
        greenTextField.text = String(Int(greenSliderOut.value))
        
        viewRGB()
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        
        blueTextField.text = String(Int(blueSliderOut.value))
        
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

    private func textFieldValue() {

        redTextField.text = String(Int(redSliderOut.value))

        greenTextField.text = String(Int(greenSliderOut.value))

        blueTextField.text = String(Int(blueSliderOut.value))
    }
    
    private func viewRGB() {
        colorView.backgroundColor = UIColor(red: (CGFloat(redSliderOut.value)/255), green: (CGFloat(greenSliderOut.value)/255), blue: (CGFloat(blueSliderOut.value)/255), alpha: 1.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
}

