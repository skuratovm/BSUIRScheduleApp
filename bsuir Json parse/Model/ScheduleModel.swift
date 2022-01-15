//
//  ScheduleModel.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 23.11.21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scheduleModel = try? newJSONDecoder().decode(ScheduleModel.self, from: jsonData)

import Foundation

// MARK: - ScheduleModel
struct ScheduleModel: Codable {
  
    let employee: JSONNull?
    let studentGroup: StudentGroup
    let schedules, examSchedules: [ExamScheduleElement]?
    let todayDate: String
    let todaySchedules: [TodayScheduleElement]
    let tomorrowDate: String
    let tomorrowSchedules: [TodayScheduleElement]
    let currentWeekNumber: Int
    let dateStart, dateEnd: String
    let sessionStart, sessionEnd: JSONNull?
}

// MARK: - ExamScheduleElement
struct ExamScheduleElement: Codable {

    let weekDay: String
    let schedule: [TodayScheduleElement]
}

// MARK: - TodayScheduleElement
struct TodayScheduleElement: Codable {
   
    
    let weekNumber: [Int]
    let studentGroup, studentGroupInformation: [String]
    let numSubgroup: Int
    let auditory: [String]
    let lessonTime, startLessonTime, endLessonTime: String
    let gradebookLesson: JSONNull?
    let subject: String
    let note: String?
    let lessonType: LessonType
    let employee: [Employee]
    let studentGroupModelList: JSONNull?
    let zaoch: Bool
    let gradebookLessonlist: JSONNull?
    
    
}

// MARK: - Employee
struct Employee: Codable {
    let firstName, lastName, middleName: String
    let degree: Degree
    let rank: Rank?
    let photoLink: String
    let calendarID: String
    let academicDepartment: [AcademicDepartment]
    let id: Int
    let urlID, fio: String

    enum CodingKeys: String, CodingKey {
        case firstName, lastName, middleName, degree, rank, photoLink
        case calendarID = "calendarId"
        case academicDepartment, id
        case urlID = "urlId"
        case fio
    }
}

enum AcademicDepartment: String, Codable {
    case кафИТАС = "каф.ИТАС"
    case кафМенеджмента = "каф.менеджмента"
}

enum Degree: String, Codable {
    case empty = ""
    case кТН = "к.т.н."
    case кЭН = "к.э.н."
    case мТН = "м.т.н."
}

enum Rank: String, Codable {
    case доцент = "доцент"
}

enum LessonType: String, Codable {
    case консультация = "Консультация"
    case лк = "ЛК"
    case лр = "ЛР"
    case пз = "ПЗ"
    case экзамен = "Экзамен"
}

// MARK: - StudentGroup
struct StudentGroup: Codable {
    let name: String
    let facultyID: Int
    let facultyName: JSONNull?
    let specialityDepartmentEducationFormID: Int
    let specialityName: JSONNull?
    let course, id: Int
    let calendarID: String

    enum CodingKeys: String, CodingKey {
        case name
        case facultyID = "facultyId"
        case facultyName
        case specialityDepartmentEducationFormID = "specialityDepartmentEducationFormId"
        case specialityName, course, id
        case calendarID = "calendarId"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
