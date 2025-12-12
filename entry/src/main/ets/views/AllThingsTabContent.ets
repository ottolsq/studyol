// AllThingsTabContent.est
@Component
export default struct AllThingsTabContent {

  aboutToAppear(){
    console.log('testTag: AllThingsTabContent aboutToAppear')
  }

  build() {
    Column() {
      Text('全部')
        .fontSize(20)
        .fontColor('#000')
        .textAlign(TextAlign.Center)
        .margin({ top: 16 })
    }
    .width('100%')
    .height('100%')
  }
}
