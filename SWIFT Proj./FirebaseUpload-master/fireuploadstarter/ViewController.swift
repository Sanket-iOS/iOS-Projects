
import UIKit
import FirebaseStorage
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func uploadBtnAction(_ sender: UIButton) {
        
       
        let imagePickerController = UIImagePickerController()
        
       
        imagePickerController.delegate = self
        
        
        let imagePickerAlertController = UIAlertController(title: "Upload", message: "Upload images from PHOTOS or Camera!", preferredStyle: .actionSheet)
        
       
        let imageFromLibAction = UIAlertAction(title: "Photo Gallery", style: .default) { (Void) in
            
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        let imageFromCameraAction = UIAlertAction(title: "Take Photo", style: .default) { (Void) in
            
            
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (Void) in
            
            imagePickerAlertController.dismiss(animated: true, completion: nil)
        }
        
        
        imagePickerAlertController.addAction(imageFromLibAction)
        imagePickerAlertController.addAction(imageFromCameraAction)
        imagePickerAlertController.addAction(cancelAction)
        
        
        present(imagePickerAlertController, animated: true, completion: nil)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
       
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectedImageFromPicker = pickedImage
        }
        
       
        let uniqueString = NSUUID().uuidString
        
        
        if let selectedImage = selectedImageFromPicker {
            
            let storageRef = FIRStorage.storage().reference().child("UploadedIMG").child("\(uniqueString).png")
            
            if let uploadData = UIImagePNGRepresentation(selectedImage) {
              
                storageRef.put(uploadData, metadata: nil, completion: { (data, error) in
                    
                    if error != nil {
                        
                       
                        print("Error: \(error!.localizedDescription)")
                        return
                    }
                    
                   
                    if let uploadImageUrl = data?.downloadURL()?.absoluteString {
                        
                       
                        print("Photo Url: \(uploadImageUrl)")
                        
                        let databaseRef = FIRDatabase.database().reference().child("UploadedIMG").child(uniqueString)
                        
                        databaseRef.setValue(uploadImageUrl, withCompletionBlock: { (error, dataRef) in
                            
                            if error != nil {
                                
                                print("Database Error: \(error!.localizedDescription)")
                            }
                           
                            
                        })
                    }
                })
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
}
