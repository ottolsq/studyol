// MyTabContent.est
@Component
export default struct MyTabContent {

  aboutToAppear(){
    console.log('testTag: MyTabContent aboutToAppear')
  }


  build() {
    Column() {
      Text('我的')
        .fontSize(20)
        .fontColor('#000')
        .textAlign(TextAlign.Center)
        .margin({ top: 16 })
    }
    .width('100%')
    .height('100%')
  }
}
