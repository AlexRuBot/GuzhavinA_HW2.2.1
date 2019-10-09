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
    }
    
    @IBAction func clearButton(_ sender: UIBarButtonItem) {
        view.backgroundColor = .white
    }
}

extension ColorVC: ChangeColorVCDelegate {
    func chageColor (_ color: UIColor) {
        view.backgroundColor = color
    }
}
