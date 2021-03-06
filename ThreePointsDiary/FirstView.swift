//
//  FirstView.swift
//  ThreePointsDiary
//
//  Created by Yu on 2021/09/10.
//

import SwiftUI

struct FirstView: View, MyProtocol {
    
    //日記編集シートのオンオフ
    @State var isShowSheet = false
    
    //編集対象の日記
    @State var selectedDiaryId = 0
    
    //全てのDiaryを取得
    @State var diaries = Diary.all()
    
    var body: some View {
        NavigationView {
            
            //日記一覧
            Form {
                ForEach(diaries.freeze()) { diary in
                    Section(header: Text("\(ymdText(inputDate: diary.createdDate)) \(weekdayText(inputDate: diary.createdDate))")) {
                        Button("\(diary.content01)"){editDiary(diaryId: diary.id)}
                            .foregroundColor(.primary)
                        Button("\(diary.content02)"){editDiary(diaryId: diary.id)}
                            .foregroundColor(.primary)
                        Button("\(diary.content03)"){editDiary(diaryId: diary.id)}
                            .foregroundColor(.primary)
                    }
                }
            }
            .onAppear {
                reloadDiaries()
            }
            
            //日記を書くためのシート
            .sheet(isPresented: $isShowSheet) {
                EditView(myProtocol: self)
            }
                
            //ナビゲーションバーの設定
            .navigationBarTitle("日記")
            .navigationBarItems(trailing:
                Button(action: {
                    selectedDiaryId = 0
                    isShowSheet.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                    Text("新しい日記")
                }
            )
                
        }
    }
    
    //タップした日記を編集
    func editDiary(diaryId: Int) {
        selectedDiaryId = diaryId
        isShowSheet.toggle()
    }
    
    //リストを再描画
    func reloadDiaries() {
        diaries = Diary.all()
    }
    
    //Date型変数を年月日のみの文字列に変換する
    func ymdText(inputDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy年 M月 d日"
        return dateFormatter.string(from: inputDate)
    }
    
    //Date型変数を曜日のみの文字列に変換する
    func weekdayText(inputDate: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let weekdayNumber = calendar.component(.weekday, from: inputDate)
        let weekdaySymbolIndex: Int = weekdayNumber - 1
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja") as Locale
        return formatter.shortWeekdaySymbols[weekdaySymbolIndex]
    }
    
    //EditViewにselectedDiaryIdを渡す
    func getSelectedDiaryId() -> Int {
        return selectedDiaryId
    }
    
}
