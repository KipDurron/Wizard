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
    let navController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    func setupView() {
        navController.modalPresentationStyle = .fullScreen
        
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
        contentBuilder.addTextField(placeHolder: "Введите имя")
        contentBuilder.addTextField(placeHolder: "Введите фамилию")
        contentBuilder.setPageTitle(title: "Page 1")
       
        //Создаём вторую страницу
        let controllerBuilder2 = wizard.createWizardPageController()
        let contentBuilder2 = controllerBuilder2.createWizardContent()
        contentBuilder2.addButtonCheckExist()
        contentBuilder2.addTextField(placeHolder: "Серия паспорта")
        contentBuilder2.setPageTitle(title: "Page 2")
       
        let wizardVie2 = contentBuilder2.endAddContent()
        let page2 = controllerBuilder2.endCreateController(wizardView: wizardVie2)
        
        
        //Создаём 3 страницу
        let controllerBuilder3 = wizard.createWizardPageController()
        let contentBuilder3 = controllerBuilder3.createWizardContent()
        contentBuilder3.addButtonCheckExist()
        contentBuilder3.addTextField(placeHolder: "Улица")
        contentBuilder3.addTextField(placeHolder: "Город")
        contentBuilder3.addTextField(placeHolder: "Дом")
        contentBuilder3.addTextField(placeHolder: "Квартира")
        contentBuilder3.setPageTitle(title: "Page 3")
        let wizardVie3 = contentBuilder3.endAddContent()
        let page3 = controllerBuilder3.endCreateController(wizardView: wizardVie3)
        
        // добавляем на первую ссылку на вторую страницу
        contentBuilder.addLinkButton(name: "to page 2", page: page2)
        contentBuilder.addLinkButton(name: "to page 3", page: page3)
        let wizardView = contentBuilder.endAddContent()
        let page1 = controllerBuilder.endCreateController(wizardView: wizardView)

//        page1.title = "Hellow world"
        self.navController.viewControllers = [page1]
        
    }
    
    @objc func buttonAction() {
        self.present(self.navController, animated: true)
    }

}

