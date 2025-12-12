import { router } from "@kit.ArkUI"

// HomeTabContent.ets
@Component
export default struct HomeTabContent {

  aboutToAppear(){
    console.log('testTag: HomeTabContent aboutToAppear')
  }

  build() {
    Column() {
      Text('首页')
        .fontSize(20)
        .fontColor('#000')
        .textAlign(TextAlign.Center)
        .margin({ top: 16 })


      Button("跳转").onClick((event: ClickEvent) => {
        router.pushUrl({
          url: 'pages/Course'  // 请根据实际页面路径调整
        })

      })


    }
    .width('100%')
    .height('100%')
  }
}
