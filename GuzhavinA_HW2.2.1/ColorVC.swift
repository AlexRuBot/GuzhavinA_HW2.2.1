//
//  ColorVC.swift
//  GuzhavinA_HW2.2.1
//
//  Created by Саша Гужавин on 09/10/2019.
//  Copyright © 2019 Саша Гужавин. All rights reserved.
//

import UIKit

protocol ChangeColorVCDelegate {
    func chageColor (_ color: UIColor)
}

class ColorVC: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let changeColor = segue.destination as! ChangeColorVC
        changeColor.delegate = self
        changeColor.redRGB = Float(view.backgroundColor!.rgb().red)
        changeColor.greenRGB = Float(view.backgroundColor!.rgb().green)
        changeColor.blueRGB = Float(view.backgroundColor!.rgb().blue)
    }
    
    @IBAction func clearButton(_ sender: UIBarButtonItem) {
        view.backgroundColor = .white
        print(Float(view.backgroundColor!.rgb().red))
    }
}

extension ColorVC: ChangeColorVCDelegate {
    func chageColor (_ color: UIColor) {
        view.backgroundColor = color
    }
}

extension UIColor {
    func rgb() -> (red:Int, green:Int, blue:Int) {
        var fRed:CGFloat = 0
        var fGreen:CGFloat = 0
        var fBlue:CGFloat = 0
        var fAlfa:CGFloat = 0
        
        getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlfa)
            let iRed = Int(fRed * 255)
            let iGreen = Int(fGreen * 255)
            let iBlue = Int(fBlue * 255)
        
        return (red:iRed, green:iGreen, blue:iBlue)
    }
}

