import { router } from '@kit.ArkUI';

@Entry
@Component
struct Course {
  @State message: string = 'Hello World';
  @State courseId: string = '';

  aboutToAppear(){
    console.log('testTag: Course aboutToAppear')
    // 获取课程信息
    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.courseId = params['id']
      // 可根据ID发起数据请求等操作
      console.log('testTag: Course aboutToAppear courseId:', this.courseId)
    }

  }


  build() {
    RelativeContainer() {

      // 返回按钮 - 置于页面顶部
      Row(){
        Button('返回')
          .onClick(() => {
            router.back()
          })

        // 课程标题
        Text("课程")
          .fontSize($r('app.float.page_text_font_size'))

      }
      .width("100%")
      .backgroundColor(Color.Blue)
      .position({ x: 10, y: 10 })
      .zIndex(1)



      Text(this.message)
        .id('CourseHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
    }
    .height('100%')
    .width('100%')
  }
}