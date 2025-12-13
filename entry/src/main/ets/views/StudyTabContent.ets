// StudyTabContent.est
@Component
export default struct StudyTabContent {

  aboutToAppear(){
    console.log('testTag: StudyTabContent aboutToAppear')
  }

  build() {
    Column() {


      Text('学习')
        .fontSize(20)
        .lineHeight(20)
        .fontColor('#000')
        .textAlign(TextAlign.Center)
        .margin({ top: 3, bottom: 3 })

      // Row() {
      //   Text('运动健康')
      //     .fontSize(20)
      //     .fontWeight(FontWeight.Bold)
      //     .fontColor('#000')
      //     .layoutWeight(1)
      //
      // }
      // .backgroundColor(Color.Yellow)

    }
    .width('100%')
    .height('100%')
  }
}
