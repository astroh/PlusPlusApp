//
//  ViewController2.swift
//  Camera
//
//  Created by Izzy Rael on 2/11/16.
//  Copyright © 2016 Izzy Rael. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var cameraView: UIView!
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput? // to export photo
    var previewLayer : AVCaptureVideoPreviewLayer? // layer onto view to see camera
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080 // resolution
        
        var backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        //var error : NSError?
        var input = try! AVCaptureDeviceInput(device: backCamera)
        
        //if error == nil && captureSession?.canAddInput(input){
        if ((captureSession?.canAddInput(input)) != nil){
            captureSession?.addInput(input)
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings[AVVideoCodecJPEG]
            
            if ((captureSession?.canAddOutput(stillImageOutput)) != nil){
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) // live camera feed
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect // preserve aspect ratio
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                
                cameraView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
            
        }
    
        
    }
    
    @IBOutlet var tempImageView: UIImageView!
    
    func didPressTakePhoto(){
        if let videoConnection = stillImageOutput!.connectionWithMediaType(AVMediaTypeVideo){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {
            (sampleBuffer, error) in
                
                if sampleBuffer != nil {
                    
                    
                    var imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    var dataProvider  = CGDataProviderCreateWithCFData(imageData)
                    let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, .RenderingIntentDefault)
                    
                    var image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                    
                    self.tempImageView.image = image
                    self.tempImageView.hidden = false
                    
                }
                
                
            })
        }
        
        
    }
    
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother(){
        if didTakePhoto == true{
            tempImageView.hidden = true
            didTakePhoto = false
            
        }
        else{
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
            
        }
        
    }
    
    
    
    
    
    
    
    
    
}
