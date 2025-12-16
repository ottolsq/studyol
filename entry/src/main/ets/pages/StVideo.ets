import { router } from '@kit.ArkUI';

@Entry
@Component
struct StVideo {

  @State sectionId: string = '';
  @State type: number = -1;

  aboutToAppear(): void {
    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.sectionId = params['id']
      this.type = parseInt(params['type'])




    }
  }



  build() {
    Column(){
      Row(){
        Button("<")
          .fontSize(18)
          .borderRadius(0)
          .type(ButtonType.Normal)
          .fontColor(Color.Black)
          .backgroundColor('#FFF')
          .onClick(() => {
            router.back()
          })

        // 小节标题
        Text('小节标题')
          .width("80%")
          .fontSize(18)
          .textAlign(TextAlign.Center)
      }
      .width("100%")
      .backgroundColor(Color.White)
      .position({ x: 0, y: 0 })
      .zIndex(1)

      Text(this.sectionId)
        .fontSize(18)
        .margin({top: 50})
      Text(this.type.toString())
        .fontSize(18)
        .margin({top: 50})

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.my_background'))
  }
}