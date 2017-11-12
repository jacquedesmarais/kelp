//
//  KelpViewController.swift
//  coffee tracker
//
//  Created by Jacque on 10/4/16.
//  Copyright © 2016 jacquedes. All rights reserved.
//

import UIKit

class KelpViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK : Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var familyTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var aquariumTextField: UITextField!
    @IBOutlet weak var fishDescriptionTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    /* This value is either passed by 'KelpTableViewController" in 'prepareForSeuge(_:sender:)' or constructed as a part of adding a new fish */
    var fish: Fish?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        // Handle the text fields user imput through delagates callback
        nameTextField.delegate = self
        
        // Set up views if editing an existing meal
        if let fish = fish {
            navigationItem.title = fish.name
            nameTextField.text = fish.name
            photoImageView.image = fish.photo
            familyTextField.text = fish.family
            colorTextField.text = fish.color
            aquariumTextField.text = fish.aquarium
            fishDescriptionTextField.text = fish.fishDescription
            
        }
        // Enable the save button only if the text field has a valid fish name
        checkValidFishName()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK : UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField){
        checkValidFishName()
        navigationItem.title = textField.text
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable save button when editing
        saveButton.isEnabled = false
    }
    
    func checkValidFishName() {
        // Disable the Save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    // MARK : UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
            // The info dictionary contains multiple representations of the image, and this uses the original
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            // Set photoImageView to display the selected image
            photoImageView.image = selectedImage
            
        dismiss(animated: true, completion: nil)
    }
 
    // MARK : Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {

        // Depending on style of presentation (modal or push presentation) this view controller needs to be dismissed in two different ways
        let isPresentingInAddFishMode = presentingViewController is UINavigationController
       
        if isPresentingInAddFishMode {
            dismiss(animated: true, completion: nil)
        } else  {
            navigationController! .popViewController(animated: true)
        }
    }
    
    // This method lets you configure a view controller before it's presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let barButton = sender as? UIBarButtonItem {
        if saveButton === barButton {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let family = familyTextField.text ?? ""
            let color = colorTextField.text ?? ""
            let aquarium = aquariumTextField.text ?? ""
            let fishDescription = fishDescriptionTextField.text ?? ""

            // Set the fish to be passed to KelpTableViewController after the unwind segue
            fish = Fish(name: name, photo: photo, family: family, color: color, aquarium: aquarium, fishDescription: fishDescription)
            }
        }
    }
    
    // MARK : Actions

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    // Hide the keyboard
        nameTextField.resignFirstResponder()
        
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks and image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)

    }
    
}

