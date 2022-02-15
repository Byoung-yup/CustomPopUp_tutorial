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
    @IBOutlet weak var subscribeBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
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
}
