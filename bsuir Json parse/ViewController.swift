//
//  ViewController.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 22.11.21.
//

import UIKit

class ViewController: UIViewController {
    var result: ScheduleModel?

    @IBOutlet weak var tableView: UITableView!
    let GroupSection = ["Понедельник","Вторник","Среда", "Четверг","Пятница","Суббота"]
    var schedules = [ExamScheduleElement]()
//    var subjs = [TodayScheduleElement]()
    
    
    
    private func fetchSchedule(groupNumber: String){
        let urlString = "https://journal.bsuir.by/api/v1/studentGroup/schedule?studentGroup=\(groupNumber)"
        
        NetworkDataFetch.shared.FetchSchedule(urlString: urlString) { [weak self]scheduleModel, error in
            if error == nil{
                guard let scheduleModel = scheduleModel else {return}
                self?.result = scheduleModel
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
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result{
            return result.schedules[section].schedule.count
        }
        return 0
    }
    
   
    
    
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return result?.schedules.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! CellTableViewCell
        let subjtext = (result?.schedules[indexPath.section].schedule[indexPath.row].subject)!
        let sttimetxt = (result?.schedules[indexPath.section].schedule[indexPath.row].startLessonTime)!
        let endTimeTxt = (result?.schedules[indexPath.section].schedule[indexPath.row].endLessonTime)!
        let lessonTypeTxt = (result?.schedules[indexPath.section].schedule[indexPath.row].lessonType.rawValue)!
       var teacherTxt = ""
        if result?.schedules[indexPath.section].schedule[indexPath.row].employee.indices.contains(0) == true {
            teacherTxt =  (result?.schedules[indexPath.section].schedule[indexPath.row].employee[0].fio)!
            
        }
        var classRoomTxt = ""
//        classRoomTxt = (result?.schedules[indexPath.section].schedule[indexPath.row].auditory[0])!
        
        if result?.schedules[indexPath.section].schedule[indexPath.row].auditory.indices.contains(0) == true{
            classRoomTxt = (result?.schedules[indexPath.section].schedule[indexPath.row].auditory[0])!
        }
        
        
       
      
       
        //let weekDayTxt = (result?.schedules[indexPath.section].weekDay)!
        
        print("😠\(subjtext)")
        cell.configureCell(subjtext: subjtext, sttimetxt: sttimetxt, endtimetxt: endTimeTxt, classRoomTxt: classRoomTxt, teacherTxt: teacherTxt, lessonType: lessonTypeTxt )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result?.schedules[section].weekDay
        
    }
    

    
    
}



