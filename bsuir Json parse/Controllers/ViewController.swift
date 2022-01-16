//
//  ViewController.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 22.11.21.
//
import UIKit


class ViewController: UIViewController {
    
    var mainViewController: UIViewController!
    var infoViewController: UIViewController!
    var isMove = false
    
    var result: ScheduleModel?
    
    var resultMemoryArray = DataBase.shared.schedules
    var resultMemory: ScheduleModel?
    var groupNumber:String = ""
    
   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTextLabel: UILabel!
   
    private func fetchSchedule(groupNumber: String){
        //activityIndicator.startAnimating()
        refreshButtonOutlet.rotate()
        let urlString = "https://journal.bsuir.by/api/v1/studentGroup/schedule?studentGroup=\(groupNumber)"
        tableView.reloadData()
        NetworkDataFetch.shared.FetchSchedule(urlString: urlString) { [weak self]scheduleModel, error in
            if error == nil{
                guard let scheduleModel = scheduleModel else {return}
                self?.result = scheduleModel
                //MARK:save data to UseDefaults
                self?.refreshButtonOutlet.endRotate()
                self!.tableView.reloadData()
                DataBase.shared.saveSchedule(result: self?.result)
                print("🌎\(self?.result)")
               
                self?.resultMemory = self?.result
                self!.tableView.reloadData()
                //self?.activityIndicator.stopAnimating()
                
            } else {
                self?.errorArlert(title: "Ошибка соединения!", message: "Проверьте подкрлючение к инернету и попробуйте еще раз.")
                print("❌\(error?.localizedDescription)")
            }
        }
    }
    @objc func alertRefresh(_ notification: Notification){
        fetchSchedule(groupNumber: groupNumber)
    }
    @objc func setGroupNumberValue(_ notification: Notification){
        let groupNumberLL = notification.object as! String
        groupNumber = groupNumberLL
        groupTextLabel.text = "    группа \(groupNumberLL)"
        
    }
    
    @IBOutlet weak var refreshButtonOutlet: UIButton!
    
    @IBAction func refreshButtonAction(_ sender: UIButton) {
        fetchSchedule(groupNumber: groupNumber)
    }
    
    @IBAction func groupButtonAction(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setGroupNumberValue(_:)), name: Notification.Name("data"), object: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CellTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        // Do any additional setup after loading the view
        if resultMemoryArray?.isEmpty == false{
            resultMemory = DataBase.shared.schedules?[0]
        }
        NotificationCenter.default.addObserver(self, selector: #selector(alertRefresh(_:)), name: Notification.Name("ref"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideInfoView(_:)), name: Notification.Name("Hide"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeViewStatus(_:)), name: Notification.Name("appear"), object: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if resultMemoryArray?.isEmpty == false{
                  resultMemory = DataBase.shared.schedules?[0]
              } else {

                  fetchSchedule(groupNumber: groupNumber)
              }
        print("📍:\(resultMemory):📍")
    }
    func configureInfoViewController(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoViewController")
        let vcView = vc?.view
        vcView?.layer.cornerRadius = 41
        vcView?.layer.borderWidth = 1
        vcView?.layer.borderColor = UIColor.systemBlue.cgColor
        vcView?.frame = CGRect(x: 1, y: 0, width: 412, height: 495)
        infoViewController = vc
        
        addChild(infoViewController)
        view.insertSubview(infoViewController.view, at: 1)
        infoViewController.didMove(toParent: self)
        
    }
    func showInfoViewController(shouldMove: Bool) {
        if shouldMove {
            // показываем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut, animations: {
                            self.infoViewController.view.frame.origin.y = self.infoViewController.view.frame.origin.y + 400
                           })
        } else {
//            // убираем menu
//            UIView.animate(withDuration: 0.5,
//                           delay: 0,
//                           usingSpringWithDamping: 0.8,
//                           initialSpringVelocity: 0,
//                           options: .curveEaseInOut,
//                           animations: {
//                            self.infoViewController.view.frame.origin.y = 0
//            }) { (finished) in
//
////                self.menuViewController.willMove(toParent: nil)
////                self.menuViewController.view.removeFromSuperview()
////                self.menuViewController.removeFromParent()
                self.infoViewController.remove()
                print("Удалили menuViewController")
            isMove = false
            //}
        }
    }
    @objc func changeViewStatus(_ notification: Notification){
        isMove = true
    }
    @objc func hideInfoView(_ notification: Notification){
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        self.infoViewController.view.frame.origin.y = self.infoViewController.view.frame.origin.y + 600
        }) { (finished) in

//                self.menuViewController.willMove(toParent: nil)
//                self.menuViewController.view.removeFromSuperview()
//                self.menuViewController.removeFromParent()
            self.infoViewController.remove()
            print("Удалили menuViewController")
            self.isMove = false
        }
    }
    
    func toggleMenu() {
        
        if !isMove {
            configureInfoViewController()
//        } else {
//            UIView.animate(withDuration: 0.5,
//                                      delay: 0,
//                                      usingSpringWithDamping: 0.8,
//                                      initialSpringVelocity: 0,
//                                      options: .curveEaseInOut,
//                                      animations: {
//                                       self.infoViewController.view.frame.origin.y = 0
//                       }) { (finished) in
//
//           //                self.menuViewController.willMove(toParent: nil)
//           //                self.menuViewController.view.removeFromSuperview()
//           //                self.menuViewController.removeFromParent()
            //self.infoViewController.remove()
                           //print("Удалили menuViewController")
//                       }
        } 
        isMove = !isMove
        showInfoViewController(shouldMove: isMove)

    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = resultMemory{
            return result.schedules[section].schedule.count ?? 0
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return resultMemory?.schedules.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! CellTableViewCell
     //secure subjtext
        var subjtext = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].subject)
        if subjtext == nil{
            subjtext = (result?.schedules[indexPath.section].schedule[indexPath.row].subject)
        }
    //secure sttimetext
        
        var sttimetxt = resultMemory?.schedules[indexPath.section].schedule[indexPath.row].startLessonTime
        if sttimetxt == nil{
            sttimetxt = (result?.schedules[indexPath.section].schedule[indexPath.row].startLessonTime)!
        }
        
     //secure endtimetext
        
        var endTimeTxt = resultMemory?.schedules[indexPath.section].schedule[indexPath.row].endLessonTime
        if endTimeTxt == nil{
            endTimeTxt = result?.schedules[indexPath.section].schedule[indexPath.row].endLessonTime
        }
        
    // secure lessontype
        
        var lessonTypeTxt = resultMemory?.schedules[indexPath.section].schedule[indexPath.row].lessonType.rawValue
        if lessonTypeTxt == nil{
            lessonTypeTxt = result?.schedules[indexPath.section].schedule[indexPath.row].lessonType.rawValue
        }
       var teacherTxt = ""
        if resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee.indices.contains(0) == true {
            teacherTxt =  (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee[0].fio)!
            
        }
        var classRoomTxt = ""
//        classRoomTxt = (result?.schedules[indexPath.section].schedule[indexPath.row].auditory[0])!
        
        if resultMemory?.schedules[indexPath.section].schedule[indexPath.row].auditory.indices.contains(0) == true{
            classRoomTxt = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].auditory[0])!
        }
        
        print("😠\(subjtext)")
        cell.configureCell(subjtext: subjtext!, sttimetxt: sttimetxt!, endtimetxt: endTimeTxt!, classRoomTxt: classRoomTxt, teacherTxt: teacherTxt, lessonType: lessonTypeTxt! )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return resultMemory?.schedules[section].weekDay
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
       
        let empArray = resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee
        let objectSubj:String = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].subject)!
        let objectSubjType:String = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].lessonType)!.rawValue
        if empArray?.isEmpty == false{
            let objectEmpID:Int = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee[0].id)!
                  
            let objectEmpFN:String = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee[0].firstName)!
            let objectEmpLN:String = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee[0].lastName)!
            let objectEmpMN:String = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee[0].middleName)!
            let objectEmpD:String = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee[0].degree)!
            let objectEmpPhoto:String = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].employee[0].photoLink)!
            let objectArray:[Any] = [objectEmpID ?? "",objectSubj ?? "",objectSubjType ?? "",objectEmpFN ?? "",objectEmpLN ?? "",objectEmpMN ?? "",objectEmpD ?? "",objectEmpPhoto ?? ""]
            toggleMenu()
            NotificationCenter.default.post(name: Notification.Name("extra"), object: objectArray)
            
        } else {
            return
        }
    }
}



