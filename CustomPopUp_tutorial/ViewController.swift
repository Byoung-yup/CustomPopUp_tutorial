//
//  ViewController.swift
//  CustomPopUp_tutorial
//
//  Created by 김병엽 on 2022/02/15.
//

import UIKit
import SnapKit
import WebKit

class ViewController: UIViewController {
    
    var popUpBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("팝업띄우기", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.tintColor = .blue
        btn.backgroundColor = .yellow
        btn.contentVerticalAlignment = .center
        btn.addTarget(self, action: #selector(onCreatePopUpBtnClicked(_:)), for: .touchUpInside)
        btn.sizeToFit()
        //self.view.addSubview(btn)
        return btn
    }()
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpUI()
    }

    func setUpUI() {
        self.view.addSubview(popUpBtn)
        popUpBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
            make.centerX.equalTo(self.view.snp.centerX)
            
        }
        
        self.view.addSubview(self.popUpBtn)
    }
    
    // MARK: - objc methods
    @objc func onCreatePopUpBtnClicked(_ sender: UIButton) {
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        // 스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        // 뷰컨트롤러가 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        // 뷰컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve
    
        customPopUpVC.subscribeBtnCompletionClosure = {
            let channelURL = URL(string: "https://www.youtube.com")
            self.webView.load(URLRequest(url: channelURL!))
            self.popUpBtn.isHidden = true
        }
        
        self.present(customPopUpVC, animated: true)
    }
}

