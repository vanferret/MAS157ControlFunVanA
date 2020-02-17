//
//  ViewController.swift
//  MAS157ControlFunVanA
//
//  Created by student on 2/16/20.
//  Copyright © 2020 vanderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))"
    }
    

    
    @IBAction func textFieldDoneEditing(sender:UITextField){
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting,animated: true)
        rightSwitch.setOn(setting,animated: true)
    }
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomethingButton.isHidden = true
        } else {
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomethingButton.isHidden = false
        }
    }
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?",message:nil, preferredStyle:.actionSheet)
        let yesAction = UIAlertAction(title: "Yes, I'm Sure!",style: .destructive,handler:{action in
            let msg = self.nameField.text!.isEmpty
             ?"You can breathe easy, everything went OK."
             :"You can breathe easy, \(self.nameField.text!)," + "everything went OK."
            let controller2 = UIAlertController(
                title: "Something Was Done", message: msg, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Phew!", style: .cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.present(controller2,animated: true,completion: nil)
        })
        let noAction = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController{
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        present(controller,animated: true,completion: nil)
    }
}

