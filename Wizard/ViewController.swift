//
//  ViewController.swift
//  Wizard
//
//  Created by Илья Кадыров on 24.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startWizard: UIButton!
     
    
    var testWizardPageList :[WizardPageController] = []
    let wizard = Wizard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    func setupView() {

        
//        let contentView = ContentView()
//        contentView.addTextField(placeHolder: "Введите имя")
//        contentView.addTextField(placeHolder: "Введите фамилию")
//        contentView.addTextField(placeHolder: "Введите номер телефона")
//        contentView.addButtonCheckExist()
//        contentView.addButtonCheckExist()
//        contentView.addButtonCheckExist()
//        let wizardView = WizardView(contentView: contentView)
//        let wizzardController = WizardPageController(currentWizardView: wizardView)
//        testWizardPageList.append(wizzardController)
            
        //[25.11.2020, 20:12:55] Рословцев Владимир Владимирович: page = wizard.createPage(..)
        //[25.11.2020, 20:13:10] Рословцев Владимир Владимирович: content = page.createContent(..)
        //content.addProperty(..)
        //    .addProperty(..)
        //    .addProperty(..)
        //   .addProperty(..)
        //wizardPage = page.endCreatePage
        //page -> pageBuilder
        
        //Рабочая версия
//        let wizzardController1 = WizardPageController()
//        let wizardView1 = WizardView()
//        let contentView = ContentView()
//
//        contentView.addTextField(placeHolder: "Введите имя")
//        contentView.addTextField(placeHolder: "Введите фамилию")
//        contentView.addTextField(placeHolder: "Введите номер телефона")
//        contentView.addButtonCheckExist()
//        contentView.addButtonCheckExist()
//        contentView.addButtonCheckExist()
//        contentView.wizardPageController = wizzardController1
//        wizardView1.setContentView(contentView: contentView)
//
//        wizzardController1.currentWizardView = wizardView1
//        testWizardPageList.append(wizzardController1)
        
        startWizard.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let controllerBuilder = wizard.createWizardPageController()
        let contentBuilder = controllerBuilder.createWizardContent()
        contentBuilder.addButtonCheckExist()
        contentBuilder.addButtonCheckExist()
        contentBuilder.addTextField(placeHolder: "Введите имя")
        contentBuilder.addTextField(placeHolder: "Введите фамилию")
        let wizardView = contentBuilder.endAddContent()
        let page1 = controllerBuilder.endCreateController(wizardView: wizardView)
        testWizardPageList.append(page1)
        
        let controllerBuilder2 = wizard.createWizardPageController()
        let contentBuilder2 = controllerBuilder2.createWizardContent()
        contentBuilder2.addButtonCheckExist()
        contentBuilder2.addTextField(placeHolder: "Серия паспорта")
        contentBuilder2.addTextField(placeHolder: "Номер паспорта")
        let wizardVie2 = contentBuilder2.endAddContent()
        let page2 = controllerBuilder2.endCreateController(wizardView: wizardVie2)
        testWizardPageList.append(page2)
        
    }
    
    @objc func buttonAction() {
        let newPage = testWizardPageList[0]
        newPage.nextPageList = Array(testWizardPageList[1..<testWizardPageList.count])
        self.present(newPage, animated: true)
    }

}

