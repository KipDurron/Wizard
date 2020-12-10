//
//  ContentView.swift
//  Wizard
//
//  Created by Илья Кадыров on 24.11.2020.
//

import UIKit

class ContentView: UIView {


    var titleName  = ""
    var viewStack = UIStackView()
    var actionStack = UIStackView()
    var actionPresentMessage : [String] = []
    var wizardPageController:WizardPageController? = nil
    
    func setupView() {
        viewStack.backgroundColor = .gray
        viewStack.axis = .vertical
        viewStack.alignment = .fill
        viewStack.spacing = 10
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(viewStack)
        actionStack.axis = .vertical
        actionStack.alignment = .fill
        actionStack.spacing = 10
        actionStack.translatesAutoresizingMaskIntoConstraints = false
        actionStack.backgroundColor = .gray
        self.addSubview(actionStack)
        self.setNeedsUpdateConstraints()
    }
    
    func setPageTitle(title: String) {
        self.titleName = title
    }
    
    func addTextField (placeHolder: String) {
        let newTextField = UITextField()
        newTextField.backgroundColor = .white
        newTextField.placeholder = placeHolder
        viewStack.addArrangedSubview(newTextField)
    }
    
    func addLinkButton(name: String, page: WizardPageController) {
        let newButton = UIButton()
        newButton.backgroundColor = .clear
        newButton.layer.cornerRadius = 5
        newButton.layer.borderWidth = 3
        newButton.layer.borderColor = UIColor.blue.cgColor
        newButton.setTitle(name, for: .normal)
        newButton.setTitleColor(.blue, for: .normal)
        newButton.addAction(for: .touchUpInside) { [unowned self] in
            if textFieldNotEmpty() {
                self.wizardPageController?.navigationController?.pushViewController(page, animated: true)
            } else {
                showLoginError(errorText: "не все поля заполнены")
            }
        }
        actionStack.addArrangedSubview(newButton)
    }
    
    func addButtonCheckExist () {
        
        let newButton = UIButton()
        newButton.backgroundColor = .systemYellow
        newButton.setTitle("Проверка заполнености полей", for: .normal)
        newButton.setTitleColor(.black, for: .normal)
        newButton.addTarget(self, action: #selector(actionCheckExist), for: .touchUpInside)
        actionStack.addArrangedSubview(newButton)
    }
    
    func textFieldNotEmpty() -> Bool{
        let stackElems = viewStack.arrangedSubviews
        for elem in stackElems {
            if let textField = elem as? UITextField {
                if textField.text! == "" {
                return false
                }
            }
        }
        return true
    }
    
    @objc func actionCheckExist() {
        // get the array of arranged subviews
        if !textFieldNotEmpty() {
            showLoginError(errorText: "не все поля заполнены")
        }
    }
    
    func showLoginError(errorText: String) {
        // Создаем контроллер
        let alert = UIAlertController(title: "Ошибка", message: errorText, preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alert.addAction(action)
        // Показываем UIAlertController
        self.wizardPageController!.present(alert, animated: true, completion: nil)
    }
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            self.viewStack.topAnchor.constraint(equalTo: topAnchor, constant: 60),
//            self.viewStack.bottomAnchor.constraint(equalTo: actionStack.topAnchor, constant: -10),
            self.viewStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            self.viewStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            self.actionStack.topAnchor.constraint(equalTo: viewStack.bottomAnchor, constant: 10),
            self.actionStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            self.actionStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            self.actionStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        ])
        
    }

    required init(contentView: UIView){
//        self.contentView = contentView
        super.init(frame: CGRect.zero)
        setupView()
       }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
