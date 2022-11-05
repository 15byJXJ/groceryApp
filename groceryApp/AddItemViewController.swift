//
//  AddItemViewController.swift
//  groceryApp
//
//  Created by Jo on 11/4/22.
//

import UIKit
import Parse
import AlamofireImage

class AddItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var productNameTextField: UITextField!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var bestByDatePicker: UIDatePicker!
    
    @IBOutlet weak var categoryPicker: UISegmentedControl!
    
    @IBOutlet weak var productNotesTexField: UITextView!
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let product = PFObject(className: "Products")
        
        product["name"] = productNameTextField.text
        product["bestByDate"] = bestByDatePicker.date
        product["category"] = categoryPicker.selectedSegmentIndex
        product["notes"] = productNotesTexField.text
        
        let imageData = productImage.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        product["image"] = file
        
        product.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("error")
            }
        }
        
    }
    
    @IBAction func onCamera(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .photoLibrary
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        
        productImage.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
