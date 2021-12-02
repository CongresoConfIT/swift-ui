//
//  Session.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import Foundation

struct SpeakerSocialNetworks: Codable {
    let speakerWebpage: String
    let speakerTwitter: String
    let speakerInstagram: String
    let speakerLinkedin: String
    let speakerTwitch: String
    let speakerFacebook: String
}

struct Speaker: Codable {
    let speakerName: String
    let speakerJob: String
    let speakerDescription: String
    let speakerImage: Int?
    let speakerRrssWebpage: SpeakerSocialNetworks
}

struct Session: Decodable {
    let id: Int
    let title: String
    let sessionDate: Date
    let sessionStartHour: Date
    let sessionEndHour: Date
    let sessionPlace: String
    let sessionDescription: String
    let sessionRegistrationFormUrl: String
    let sessionRequiredSoftware: String
    let sessionRecommendedPriorKnowledge: String
    let speakersCount: String
    let firstSpeaker: Speaker
    let secondSpeaker: Speaker

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case acf
    }
    
    enum SessionTitleKeys: String, CodingKey {
        case rendered
    }
    
    enum SessionInfoKeys: String, CodingKey {
        case sessionDate
        case sessionStartHour
        case sessionEndHour
        case sessionPlace
        case sessionDescription
        case sessionRegistrationFormUrl
        case sessionRequiredSoftware
        case sessionRecommendedPriorKnowledge
        case speakersCount
        case firstSpeaker
        case secondSpeaker
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        
        let titleValues = try values.nestedContainer(keyedBy: SessionTitleKeys.self, forKey: .title)
        title = try titleValues.decode(String.self, forKey: .rendered).decodingUnicodeCharacters
        
        let acfValues = try values.nestedContainer(keyedBy: SessionInfoKeys.self, forKey: .acf)
        sessionDate = try acfValues.decode(Date.self, forKey: .sessionDate)
        sessionStartHour = try acfValues.decode(Date.self, forKey: .sessionStartHour)
        sessionEndHour = try acfValues.decode(Date.self, forKey: .sessionEndHour)
        sessionPlace = try acfValues.decode(String.self, forKey: .sessionPlace)
        sessionDescription = try acfValues.decode(String.self, forKey: .sessionDescription)
        sessionRegistrationFormUrl = try acfValues.decode(String.self, forKey: .sessionRegistrationFormUrl)
        sessionRequiredSoftware = try acfValues.decode(String.self, forKey: .sessionRequiredSoftware)
        sessionRecommendedPriorKnowledge = try acfValues.decode(String.self, forKey: .sessionRecommendedPriorKnowledge)
        speakersCount = try acfValues.decode(String.self, forKey: .speakersCount)
        firstSpeaker = try acfValues.decode(Speaker.self, forKey: .firstSpeaker)
        secondSpeaker = try acfValues.decode(Speaker.self, forKey: .secondSpeaker)
    }
}

extension Session {
    static var debug: Session! {
        let jsonData = """
                    {
                        "id": 1133,
                        "acf": {
                          "session_date": "20211202",
                          "session_start_hour": "18:00:00",
                          "session_end_hour": "21:00:00",
                          "session_place": "Aula 3004 (Aula de Macs) - ETSISI",
                          "session_description": "En 2019, Apple presenta en la WWDC un nuevo framework de construccion de interfaces, SwiftUI, que rompe con todos los paradigmas establecidos hasta ahora por su padre UIKit para desarrollar UIs para dispositivos Apple, y que esta destinado a revolucionar la forma de desarrollar apps para todo su ecosistema.\r\n\r\nEn este taller practico aprenderemos los conceptos basicos de SwiftUI, y probaremos su potencia y facilidad de uso desarrollando entre todos los asistentes una sencilla aplicacion funcional.",
                          "session_registration_form_url": "https://forms.gle/MpEoZSkkr3E8XGyCA",
                          "session_required_software": "Si quieres traer tu propio portatil, para poder seguir el taller necesitareis instalar:\r\n-Sistema operativo: macOS Catalina (10.15.7) o superior.\r\n-<a href=\"https://developer.apple.com/download/all/" target=\"_blank\">Xcode 12 o superior</a>.",
                          "session_recommended_prior_knowledge": "",
                          "speakers_count": "1",
                          "first_speaker": {
                            "speaker_name": "Alberto Guerrero Martin",
                            "speaker_job": "Desarrollador de aplicaciones para iOS en Gigigo",
                            "speaker_description": "Alberto Guerrero es desarrollador de apps para iOS desde hace 8 años, y es Graduado en Ingenieria del Software y Master en Desarrollo de Aplicaciones y Servicios para Dispositivos Moviles, ambos por la ETSI de Sistemas Informaticos de la UPM. Apasionado de la formacion y la vida universitaria, ha sido representante de estudiantes durante todos sus años en la universidad, y compagina su actividad laboral con colaborar con la misma siempre que le es posible. Como desarrollador, ademas de trabajar actualmente con lo ultimo del mundo Apple, tambien realiza proyectos personales de desarrollo con otras tecnologias como Android, Web (MERN) o WordPress.",
                            "speaker_image": 1148,
                            "speaker_rrss_webpage": {
                              "speaker_webpage": "",
                              "speaker_twitter": "https://twitter.com/alberto170693",
                              "speaker_instagram": "https://www.instagram.com/albertoguerreromartin/",
                              "speaker_linkedin": "https://www.linkedin.com/in/albertoguerreromartin",
                              "speaker_twitch": "",
                              "speaker_facebook": ""
                            }
                          },
                          "second_speaker": {
                            "speaker_name": "",
                            "speaker_job": "",
                            "speaker_description": "",
                            "speaker_image": null,
                            "speaker_rrss_webpage": {
                              "speaker_webpage": "",
                              "speaker_twitter": "",
                              "speaker_instagram": "",
                              "speaker_linkedin": "",
                              "speaker_twitch": "",
                              "speaker_facebook": ""
                            }
                          }
                        }
                      }
                    """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        return try! decoder.decode(Session.self, from: jsonData)
    }
}
