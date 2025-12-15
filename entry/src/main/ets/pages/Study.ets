import { router } from '@kit.ArkUI';
import { CourseListData } from '../Data/Data';
import { CourseModel } from '../viewmodel/CourseModel';

@Entry
@Component
struct Study {


  @State courseId: string = '';
  @State course: CourseModel = new CourseModel();

  aboutToAppear(): void {
    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.courseId = params['id']

      // 可根据ID发起数据请求等操作
      // todo: 读取课程信息
      CourseListData.forEach( item => {
        if (item.id == this.courseId) {
          this.course = item
        }
      })

      console.log("testTag: studyPage " + this.courseId)

    }
  }

  build() {
    Column() {
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

        // 课程标题
        Text(this.course.name)
          .width("80%")
          .fontSize(18)
          .textAlign(TextAlign.Center)
      }
      .width("100%")
      .backgroundColor(Color.White)
      .position({ x: 0, y: 0 })
      .zIndex(1)

      // todo: 课程信息
      Scroll() {
        Column() {
          Text('课程信息')
          Text('章节')
          Text('小节')

          Button('▶️').onClick(() => {
            router.pushUrl({
              url: 'pages/StVideo', // 请根据实际页面路径调整
              params: {
                id: '999'
              }
            })

          })
        }
      }
      .width("100%")
      .height("100%")
      .backgroundColor(Color.Pink)

    }
    .width("100%")
    .height("100%")
    .backgroundColor($r('app.color.my_background'))

  }
}