////
////  ScheduleModel.swift
////  bsuir Json parse
////
////  Created by Mikhail Skuratov on 23.11.21.
////
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let scheduleModel = try? newJSONDecoder().decode(ScheduleModel.self, from: jsonData)
//
//import Foundation
//
//// MARK: - ScheduleModel
//struct ScheduleModel: Codable {
//
//    let employee: JSONNull?
//    let studentGroup: StudentGroup
//    let schedules, examSchedules: [ExamScheduleElement]?
//    let todayDate: String
//    let todaySchedules: [TodayScheduleElement]
//    let tomorrowDate: String
//    let tomorrowSchedules: [TodayScheduleElement]
//    let currentWeekNumber: Int
//    let dateStart, dateEnd: String
//    let sessionStart, sessionEnd: JSONNull?
//}
//
//// MARK: - ExamScheduleElement
//struct ExamScheduleElement: Codable {
//
//    let weekDay: String
//    let schedule: [TodayScheduleElement]
//}
//
//// MARK: - TodayScheduleElement
//struct TodayScheduleElement: Codable {
//
//
//    let weekNumber: [Int]
//    let studentGroup, studentGroupInformation: [String]
//    let numSubgroup: Int
//    let auditory: [String]
//    let lessonTime, startLessonTime, endLessonTime: String
//    let gradebookLesson: JSONNull?
//    let subject: String
//    let note: String?
//    let lessonType: LessonType
//    let employee: [Employee]
//    let studentGroupModelList: JSONNull?
//    let zaoch: Bool
//    let gradebookLessonlist: JSONNull?
//
//
//}
//
//// MARK: - Employee
//struct Employee: Codable {
//    let firstName, lastName, middleName: String
//    let degree: Degree
//    let rank: Rank?
//    let photoLink: String
//    let calendarID: String
//    let academicDepartment: [AcademicDepartment]
//    let id: Int
//    let urlID, fio: String
//
//    enum CodingKeys: String, CodingKey {
//        case firstName, lastName, middleName, degree, rank, photoLink
//        case calendarID = "calendarId"
//        case academicDepartment, id
//        case urlID = "urlId"
//        case fio
//    }
//}
//
//enum AcademicDepartment: String, Codable {
//    case кафИТАС = "каф.ИТАС"
//    case кафМенеджмента = "каф.менеджмента"
//}
//
//enum Degree: String, Codable {
//    case empty = ""
//    case кТН = "к.т.н."
//    case кЭН = "к.э.н."
//    case мТН = "м.т.н."
//}
//
//enum Rank: String, Codable {
//    case доцент = "доцент"
//}
//
//enum LessonType: String, Codable {
//    case консультация = "Консультация"
//    case лк = "ЛК"
//    case лр = "ЛР"
//    case пз = "ПЗ"
//    case экзамен = "Экзамен"
//}
//
//// MARK: - StudentGroup
//struct StudentGroup: Codable {
//    let name: String
//    let facultyID: Int
//    let facultyName: JSONNull?
//    let specialityDepartmentEducationFormID: Int
//    let specialityName: JSONNull?
//    let course, id: Int
//    let calendarID: String
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case facultyID = "facultyId"
//        case facultyName
//        case specialityDepartmentEducationFormID = "specialityDepartmentEducationFormId"
//        case specialityName, course, id
//        case calendarID = "calendarId"
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        // No-op
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scheduleModel = try? newJSONDecoder().decode(ScheduleModel.self, from: jsonData)

import Foundation

// MARK: - ScheduleModel
struct ScheduleModel: Codable {
    let employee: JSONNull?
    let studentGroup: StudentGroup
    let schedules, examSchedules: [ExamScheduleElement]
    let todayDate: String
    let todaySchedules: [JSONAny]
    let tomorrowDate: String
    let tomorrowSchedules: [JSONAny]
    let currentWeekNumber: Int
    let dateStart, dateEnd: String
    let sessionStart, sessionEnd: JSONNull?
}

// MARK: - ExamScheduleElement
struct ExamScheduleElement: Codable {
    let weekDay: String
    let schedule: [ExamScheduleSchedule]
}

// MARK: - ExamScheduleSchedule
struct ExamScheduleSchedule: Codable {
    let weekNumber: [Int]
    let studentGroup, studentGroupInformation: [String]
    let numSubgroup: Int
    let auditory: [String]
    let lessonTime, startLessonTime, endLessonTime: String
    let gradebookLesson: JSONNull?
    let subject: String
    let note: JSONNull?
    let lessonType: LessonType
    let employee: [Employee]
    let studentGroupModelList: JSONNull?
    let zaoch: Bool
    let gradebookLessonlist: JSONNull?
}

// MARK: - Employee
struct Employee: Codable {
    let firstName, lastName, middleName, degree: String
    let rank: String?
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

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
