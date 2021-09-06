//
//  LoginViewController.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/9/6.
//

import UIKit

class LoginViewController: BaseViewController {
    
//    MARK: 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        defineLayout()
    }
    
    func addSubviews() -> Void {
        view.addSubview(titleLabel)
        view.addSubview(introduceLabel)
        view.addSubview(errorLabel)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextField)
        view.addSubview(codeLabel)
        view.addSubview(codeTextField)
        view.addSubview(codeButton)
        view.addSubview(loginButton)
    }
    func defineLayout() -> Void {
        
        titleLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.top.equalTo(view).offset(110)
            ConstraintMaker.left.equalTo(view).offset(24)
        }
        introduceLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(titleLabel)
            ConstraintMaker.top.equalTo(view).offset(155)
        }
        errorLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(titleLabel)
            ConstraintMaker.top.equalTo(view).offset(186)
        }
        phoneLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(titleLabel)
            ConstraintMaker.top.equalTo(view).offset(235)
        }
        
        phoneTextField.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(titleLabel)
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.right.equalTo(view).offset(-24)
            ConstraintMaker.centerY.equalTo(view.snp.top).offset(290)
        }
        
        codeLabel.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(titleLabel)
            ConstraintMaker.top.equalTo(view).offset(357)
        }
        
        codeTextField.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.height.equalTo(phoneTextField)
            ConstraintMaker.centerY.equalTo(view.snp.top).offset(412)
            ConstraintMaker.right.equalTo(codeButton.snp.left).offset(-30)
        }
        
        codeButton.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.width.equalTo(85)
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.right.equalTo(view).offset(-24)
            ConstraintMaker.centerY.equalTo(codeTextField)
        }
        loginButton.snp.makeConstraints { ConstraintMaker in
            ConstraintMaker.left.equalTo(view).offset(24)
            ConstraintMaker.height.equalTo(52)
            ConstraintMaker.right.equalTo(view).offset(-24)
            ConstraintMaker.top.equalTo(view).offset(485)
        }
    }

//MARK: lazy init
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "云检BD端"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor(hex: "#303133")
        return label
    }()
    
    lazy var introduceLabel:UILabel = {
        let label = UILabel()
        label.text = "请使用药师帮云检业务BD账号登录"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(hex: "#95989F")
        return label
    }()
    
    lazy var errorLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#FF142B")
        return label
    }()
    
    lazy var phoneTextField:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString.init(string:"请输入手机号", attributes: [NSAttributedString.Key.foregroundColor:UIColor(hex: "#DDE0E6"),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)])
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.textColor = UIColor(hex: "#303133")
        textField.delegate = self
        return textField
    }()
    
    lazy var codeTextField:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString.init(string:"请输入收到的短信验证码", attributes: [NSAttributedString.Key.foregroundColor:UIColor(hex: "#DDE0E6"),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)])
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = UIColor(hex: "#303133")
        textField.delegate = self
        return textField
    }()
    
    lazy var codeLabel:UILabel = {
        let label = UILabel()
        label.text = "短信验证码"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(hex: "#303133")
        return label
    }()
    
    lazy var phoneLabel:UILabel = {
        let label = UILabel()
        label.text = "手机号"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(hex: "#303133")
        return label
    }()
    
    lazy var codeButton:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("获取验证码", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(UIColor(hex: "#6487DA"), for: .normal)
        btn.addTarget(self, action: #selector(codeButtonDidAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var loginButton:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("登录", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
        let bgImage = getGradientImageColorWithSize(CGSize(width: UIScreen.main.bounds.size.width - 24 * 2, height: 52))
        btn.addTarget(self, action: #selector(loginButtonDidAction), for: .touchUpInside)
        btn.setBackgroundImage(bgImage, for: .normal)
        btn.setBackgroundImage(bgImage, for: .highlighted)
        btn.layer.cornerRadius = 26.0
        btn.clipsToBounds = true
        return btn
    }()
    
    func getGradientImageColorWithSize(_ size:CGSize) -> UIImage {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(hex: "#C9CCD2").cgColor,UIColor(hex: "#E4E6EA").cgColor]
        layer.locations = [0.0,1.0]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1.0, y: 0)
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
        
    }

}
//    MARK: 事件 代理
extension LoginViewController : UITextFieldDelegate{
    @objc func codeButtonDidAction() -> Void {
        
    }
    
    @objc func loginButtonDidAction() -> Void {
        
        guard let phone = phoneTextField.text else {
            return
        }
        guard let code = codeTextField.text else {
            return
        }
        if phone.count < 1 {
            print("手机号为空")
            return
        }
        if code.count < 1 {
            print("验证码不能为空")
            return
        }
        if !validateMobile(phoneNum:phone) {
            print("手机号无效")
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let delegat:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            delegat.loginSuccess()
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //限制只能输入数字，不能输入特殊字符
        let length = string.lengthOfBytes(using: String.Encoding.utf8)
       for loopIndex in 0..<length {
        let char = (string as NSString).character(at: loopIndex)
           if char < 48 {return false }
           if char > 57 {return false }
        }

       //限制长度
        let proposeLength = (textField.text?.lengthOfBytes(using: String.Encoding.utf8))! - range.length + string.lengthOfBytes(using: String.Encoding.utf8)

        if phoneTextField == textField {
            if proposeLength > 11 { return false }
        }
        if codeTextField == textField {
            if proposeLength > 4 { return false }
        }
        
        return true
    }
    
    func validateMobile(phoneNum:String)-> Bool {

        // 手机号以 13 14 15 18 开头   八个 \d 数字字符

        let phoneRegex = "^1(3\\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\\d|9[0-35-9])\\d{8}$";

        let phoneTest = NSPredicate(format: "SELF MATCHES %@" , phoneRegex)

        return (phoneTest.evaluate(with: phoneNum));

    }
}
