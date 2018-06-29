//
//  ViewController.swift
//  ImageDownloader
//
//  Created by 탁은주 on 2018. 4. 11..
//  Copyright © 2018년 TEJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var downloadTask: URLSessionDownloadTask!
    
    @IBAction func downloadAction(_ sender: RoundButton) {
        imgView.image = nil
        indicatorView.startAnimating()
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
//        downloadTask = session.downloadTask(with: URL(string: "https://images.pexels.com/photos/859892/pexels-photo-859892.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")!)

        downloadTask = session.downloadTask(with: URL(string: "https://images.pexels.com/photos/859892/pexels-photo-859892.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")!, completionHandler: {(data, reponse, error)-> Void in
            let dataTemp:Data = try! Data(contentsOf: data!)
            self.imgView.image = UIImage(data:dataTemp)
            self.indicatorView.stopAnimating()
        })
        downloadTask.resume()
        progressView.setProgress(1, animated: true)
    }
    
    @IBAction func suspendAction(_ sender: RoundButton) {
        downloadTask.suspend()
    }
    @IBAction func rewumeAction(_ sender: RoundButton) {
        downloadTask.resume()
    }
    @IBAction func cancleAction(_ sender: RoundButton) {
        downloadTask.cancel()
        progressView.setProgress(0.0, animated: false)
        indicatorView.stopAnimating()
        imgView.image = nil
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress:Float = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        progressView.setProgress(progress, animated: true)
        
        //        print("bytesWritten : \(bytesWritten)")
        //        print("totalBytesWritten : \(totalBytesWritten)")
        //        print("totalBytesExpectedToWrite : \(totalBytesExpectedToWrite)")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        // print("location : \(location)")
        let dataTemp:Data = try! Data(contentsOf: location)
        self.imgView.image = UIImage(data:dataTemp)
        indicatorView.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

