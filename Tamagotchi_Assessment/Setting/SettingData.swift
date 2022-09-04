//
//  SettingData.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/04.
//

import Foundation

struct SettingData {
    let SettingGeneralData: [SettingList] = [
        SettingList(imageName: "pencil", label: "내 이름 설정하기", detailLabel: "고래밥"),
        SettingList(imageName: "moon.fill", label: "다마고치 변경하기", detailLabel: ""),
        SettingList(imageName: "arrow.clockwise", label: "데이터 초기화", detailLabel: "")
    ]
}
