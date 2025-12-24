import { promptAction, router } from '@kit.ArkUI';
import Constants, { ContentType } from '../common/constants/Constants'
import { SectionModel } from '../viewmodel/SectionModel';
import { http } from '@kit.NetworkKit';

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

      // 获取小节数据
      try {
        let httpRequest = http.createHttp();
        httpRequest.request(`${Constants.SERVER}/getSectionById/${this.sectionId}`, {
          method:  http.RequestMethod.GET,
          readTimeout: Constants.HTTP_READ_TIMEOUT,
          header: {
            'Content-Type': ContentType.JSON
          },
          connectTimeout: Constants.HTTP_READ_TIMEOUT
        }, async (err, result) =>{
          if (result.responseCode === 200) {
            console.log('testTag: 获取成功')
            console.log('testTag: responseResult:', typeof result.result);
            let sectionData: SectionModel;
            if (typeof result.result === 'string') {
              sectionData = JSON.parse(result.result);

              this.section = sectionData
              if (sectionData.type == 1) {
                this.videoUrl = sectionData.content
              }

              this.type = parseInt(params['type'])
              // this.sectionList[index] = sectionData
              // console.log("testTag: section " + this.sectionList)

            }else{
              promptAction.showToast({ message: '转换失败' })
            }
          } else {
            console.log('testTag: 获取失败')
            promptAction.showToast({ message: '获取失败' })
          }
        });
      } catch (err) {
        console.error('Request error:', err);
        promptAction.showToast({ message: '网络请求异常' });
      }
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