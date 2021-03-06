//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 김병엽 on 2022/02/15.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var openDaumBtn: UIButton!
    @IBOutlet weak var openNaverOpen: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    var myPopUpDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openNaverOpen.layer.cornerRadius = 10
        openDaumBtn.layer.cornerRadius = 10
        
    }
    
    // MARK: - Action methods
    
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubcribeBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure {
            // 메인에 알린다.
            subscribeBtnCompletionClosure()
        }
    }
    @IBAction func gotoNaverBtnClicked(_ sender: UIButton) {
        myPopUpDelegate?.openNaverBtnClicked()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gotoDaumBtnClicked(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName), object: nil)
        self.dismiss(animated: true, completion: nil)
        
    }
}
