//
//  WizardView.swift
//  Wizard
//
//  Created by Илья Кадыров on 24.11.2020.
//

import UIKit

class WizardView: UIView {

    let buttonNext = UIButton()
    let buttonBack = UIButton()
    var contentView = ContentView()
    
    func setupView() {
        self.backgroundColor = .gray
        self.buttonNext.translatesAutoresizingMaskIntoConstraints = false
        self.buttonNext.setTitle("Next", for: .normal)
        self.buttonNext.backgroundColor = .systemYellow
        self.buttonNext.setTitleColor(.black, for: .normal)
        self.addSubview(buttonNext)
        self.buttonBack.translatesAutoresizingMaskIntoConstraints = false
        self.buttonBack.setTitle("Back", for: .normal)
        self.buttonBack.backgroundColor = .systemYellow
        self.buttonBack.setTitleColor(.black, for: .normal)
        self.addSubview(buttonBack)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.backgroundColor = .red
        self.addSubview(contentView)
        self.setNeedsUpdateConstraints()
    }
    
    func setContentView (contentView: ContentView) {
        self.contentView = contentView
        setupView()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            self.buttonNext.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.buttonNext.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            self.buttonBack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.buttonBack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            self.contentView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            self.contentView.bottomAnchor.constraint(equalTo: buttonBack.topAnchor, constant: -10),
            self.contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            self.contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
    }

    required init(contentView: ContentView){
        self.contentView = contentView
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
