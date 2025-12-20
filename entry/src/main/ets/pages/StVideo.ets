import { promptAction, router } from '@kit.ArkUI';
import { SectionListData } from '../Data/Data';
import { SectionModel } from '../viewmodel/SectionModel';

@Entry
@Component
struct StVideo {

  @State sectionId: string = '';
  @State type: number = -1;
  @State section: SectionModel = new SectionModel();
  @State videoUrl: string = '';

  private controller: VideoController = new VideoController();

  aboutToAppear(): void {
    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.sectionId = params['id']

      // todo: 获取小节数据
      const sss = SectionListData.find(item => item.id == this.sectionId)
      if(sss){
        this.section = sss
        if (sss.type == 1) {
          this.videoUrl = sss.content
        }
      }
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
        Text(this.section.title)
          .width("80%")
          .fontSize(18)
          .textAlign(TextAlign.Center)
      }
      .width("100%")
      .backgroundColor(Color.White)
      .position({ x: 0, y: 0 })
      .zIndex(1)

      if (this.type == 1){
        Video({
          src: this.section.content,
          controller: this.controller
        })
          .autoPlay(false) // 禁止自动播放
          .controls(true) // 显示控制条
          .margin({top: 50})
          .width('100%')
          .height(300)
      }else if (this.type == 2){
        Text(this.section.content)
          .fontSize(18)
          .margin({ top: 50, bottom: 10, left: 10, right: 10 })
      }else {
        Text('报错 err!')
          .fontSize(18)
          .margin({top: 50})
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.my_background'))
  }
}