//
//  CellTableViewCell.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 22.11.21.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    @IBOutlet weak var classRoomLabel: UILabel!
    @IBOutlet weak var weakDayL: UILabel!
    @IBOutlet weak var teacherPhotoImageView: UIImageView!
    @IBOutlet weak var indicatorView: UIView!{
        didSet{
            indicatorView.layer.cornerRadius = 3
        }
    }
    
    @IBOutlet weak var starTimeLabel: UILabel!
    @IBOutlet weak var endTimelabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(subjtext: String ,sttimetxt: String,endtimetxt: String, classRoomTxt: String,teacherTxt: String, lessonType: String) {
        
        self.subjectLabel.text = subjtext
        self.classRoomLabel.text = classRoomTxt
        teacherLabel.text = teacherTxt
        starTimeLabel.text = sttimetxt
        endTimelabel.text = endtimetxt
        weakDayL.text = lessonType
        
        if lessonType == "ЛК"{
            indicatorView.backgroundColor = .systemGreen
        }
        if lessonType == "ПЗ"{
            indicatorView.backgroundColor = .systemYellow
        }
        if lessonType == "ЛР"{
            indicatorView.backgroundColor = .systemBlue
        }
        
        
//
        
    }
    
}
