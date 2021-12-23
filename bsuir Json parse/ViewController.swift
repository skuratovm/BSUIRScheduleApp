//
//  ViewController.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 22.11.21.
//

import UIKit

class ViewController: UIViewController {
    var result: ScheduleModel?
    
    var resultMemoryArray = DataBase.shared.schedules
    var resultMemory: ScheduleModel?
    var groupNumber:String = ""
   
    
        
  
    
   
    //var resultMemoryIsExist = DataBase.shared.schedules?.indices.contains(0)
    
    
    
    

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTextLabel: UILabel!
    
    let GroupSection = ["Понедельник","Вторник","Среда", "Четверг","Пятница","Суббота"]
   // var schedules = [ExamScheduleElement]()
//    var subjs = [TodayScheduleElement]()
    
    
    
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
                self!.tableView.reloadData()
                DataBase.shared.saveSchedule(result: self?.result)
                print("🌎\(self?.result)")
               
                self?.resultMemory = self?.result
                self!.tableView.reloadData()
                //self?.activityIndicator.stopAnimating()
                self?.refreshButtonOutlet.endRotate()
            } else {
                print(error?.localizedDescription)
            }
        }
        
        
      
    }
    @objc func setGroupNumberValue(_ notification: Notification){
        let groupNumberLL = notification.object as! String
        groupNumber = groupNumberLL
        groupTextLabel.text = "    группа \(groupNumberLL)"
        
    }
    
    @IBOutlet weak var refreshButtonOutlet: UIButton!
    
    @IBAction func refreshButtonAction(_ sender: UIButton) {
        fetchSchedule(groupNumber: groupNumber)
        //refreshButtonOutlet.rotate()
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //var groupNumber = 920605
        
        NotificationCenter.default.addObserver(self, selector: #selector(setGroupNumberValue(_:)), name: Notification.Name("data"), object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CellTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        // Do any additional setup after loading the view
        
       
        if resultMemoryArray?.isEmpty == false{
            resultMemory = DataBase.shared.schedules?[0]
            
        } else if resultMemoryArray?.isEmpty == true{
        
            fetchSchedule(groupNumber: groupNumber)
            
        }
    
       
        print("🥰:\(resultMemory):😘")
        //print("🍄\(groupNumber)")
    }
    


}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = resultMemory{
            return result.schedules[section].schedule.count
            
        }
        return 0
    }
    
    
   
    
    
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return resultMemory?.schedules.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if resultMemoryIsExist == true {
//            var resultMemory = DataBase.shared.schedules?[0]
//            tableView.reloadData()
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! CellTableViewCell
     //secure subjtext
        var subjtext = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].subject)
        if subjtext == nil{
            subjtext = (result?.schedules[indexPath.section].schedule[indexPath.row].subject)!
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
        
        
       
      
       
        //let weekDayTxt = (result?.schedules[indexPath.section].weekDay)!
        
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
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true,completion: nil)
    }
    
   

    
    
}



