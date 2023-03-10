//
//  ViewController.swift
//  lab1_3
//
//  Created by student on 07/03/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dzienWynik: UILabel!
    @IBOutlet weak var textLBL: UILabel!
    @IBOutlet weak var dzien: UITextField!
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var ilorazwynik: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func wybor(_ sender: Any) {
        dzienWynik.text = "Wybrano: \(dzien.text!)"
    }
    @IBAction func iloraz(_ sender: Any) {
        if (Double(b.text!)==0){
            ilorazwynik.text="Dzielenie przez 0"
        }else{
            ilorazwynik.text = String((Double(a.text!)!/Double(b.text!)!))
        }}
    

}

