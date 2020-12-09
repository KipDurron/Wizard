//
//  WizardPage.swift
//  Wizard
//
//  Created by Илья Кадыров on 24.11.2020.
//

import UIKit

class WizardPageController: UIViewController {
    
    var nextPageList: [WizardPageController] = []
    var currentWizardView = WizardView()
    
    override func loadView() {
//        let uiVew = UIView()
//        uiVew.backgroundColor = .blue
        currentWizardView.buttonBack.addTarget(self, action: #selector(buttonBackAction), for: .touchUpInside)
        currentWizardView.buttonNext.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)
        self.view = currentWizardView
        
    }

    
    init() {
        super.init(nibName: nil, bundle: nil)
        //рабочий
        
        }
    
     init(currentWizardView: WizardView){
        //рабочий
        self.currentWizardView = currentWizardView
        super.init(nibName: nil, bundle: nil)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @objc func buttonBackAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonNextAction() {
        if nextPageList.count > 0 {
            let newPage = nextPageList[0]
            newPage.nextPageList = Array(nextPageList[1..<nextPageList.count])
            self.present(newPage, animated: true)
        } else {
            debugPrint("End")
        }
   
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
