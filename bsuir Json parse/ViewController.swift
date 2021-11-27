//
//  ViewController.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 22.11.21.
//

import UIKit

class ViewController: UIViewController {
    var result: ScheduleModel?
    
    var resultMemory = DataBase.shared.schedules?[0]
    

    @IBOutlet weak var tableView: UITableView!
    let GroupSection = ["Понедельник","Вторник","Среда", "Четверг","Пятница","Суббота"]
   // var schedules = [ExamScheduleElement]()
//    var subjs = [TodayScheduleElement]()
    
    
    
    private func fetchSchedule(groupNumber: String){
        let urlString = "https://journal.bsuir.by/api/v1/studentGroup/schedule?studentGroup=\(groupNumber)"
        
        NetworkDataFetch.shared.FetchSchedule(urlString: urlString) { [weak self]scheduleModel, error in
            if error == nil{
                guard let scheduleModel = scheduleModel else {return}
                self?.result = scheduleModel
                //MARK:save data to UseDefaults
                
                DataBase.shared.saveSchedule(result: self?.result)
                ///
                print(self?.result)
                self?.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
        
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CellTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        // Do any additional setup after loading the view.
        fetchSchedule(groupNumber: "920605")
        if resultMemory != nil{
            tableView.reloadData()
        }
        print("🥰:\(resultMemory):😘")
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
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! CellTableViewCell
     
        
        var subjtext = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].subject)
        if subjtext == nil{
            subjtext = (result?.schedules[indexPath.section].schedule[indexPath.row].subject)!
        }
           
        
        
        
        
      //  let subjtext = (result?.schedules[indexPath.section].schedule[indexPath.row].subject)!
        
        
        
        
        
       ///////
        let sttimetxt = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].startLessonTime)!
        let endTimeTxt = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].endLessonTime)!
        let lessonTypeTxt = (resultMemory?.schedules[indexPath.section].schedule[indexPath.row].lessonType.rawValue)!
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
        cell.configureCell(subjtext: subjtext!, sttimetxt: sttimetxt, endtimetxt: endTimeTxt, classRoomTxt: classRoomTxt, teacherTxt: teacherTxt, lessonType: lessonTypeTxt )
       
       
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



