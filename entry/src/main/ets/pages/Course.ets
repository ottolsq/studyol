import { router } from '@kit.ArkUI';
import { CourseModel } from '../viewmodel/CourseModel';
import {CourseListData} from "../Data/Data"

@Entry
@Component
struct Course {
  @State message: string = 'Hello World';
  @State courseId: string = '';
  @State course: CourseModel= new CourseModel();

  aboutToAppear(){
    console.log('testTag: Course aboutToAppear')
    // 获取课程信息
    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.courseId = params['id']
      // 可根据ID发起数据请求等操作
      CourseListData.forEach( item => {
        if (item.id == this.courseId) {
          this.course = item
        }
      })

      // this.message = '课程信息：' + this.course.name
      console.log('testTag: Course aboutToAppear courseId:', this.courseId)
    }
  }


  build() {
    Column() {
      // 返回按钮 + 标题 - 置于页面顶部
      Row(){
        Button("<")
          .fontSize(18)
          .borderRadius(0)
          .type(ButtonType.Normal)
          .fontColor(Color.Black)
          .backgroundColor('#FFF')
          // .border({                 // 边框设置（可选）
          //   width: 1,
          //   color: '#CCC'
          // })
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
      .backgroundColor(Color.Grey)
      .position({ x: 0, y: 0 })
      .zIndex(1)

      Image(this.course.image)
        .margin({top: 40})
        // .borderRadius(5)
        // .width('100%')  // 宽度与 Swiper 保持一致
        .height(200) // 高度与 Swiper 保持一致
        .objectFit(ImageFit.Cover)

      Column() {
        Text("课程名: " + this.course.name)
          .width('100%')
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
          .margin({top: 10, left: 10})

        Text("学校: " + this.course.school)
          .width('100%')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
          .margin({top: 10, left: 10})

        Text("教师: " + this.course.teacher)
          .width('100%')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
          .margin({top: 10, left: 10})

        Text("类别: " + this.course.type)
          .width('100%')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
          .margin({top: 10, left: 10})

        Text("简介: \n" + this.course.introduction)
          .width('100%')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
          .margin({top: 10, left: 10})
      }
      .width('100%')
      .backgroundColor(Color.Yellow)

      Button("加入学习")
        // .fontSize(18)
        // .borderRadius(0)
        // .type(ButtonType.Normal)
        // .fontColor(Color.Black)
        .backgroundColor(Color.Orange)
        // .border({                 // 边框设置（可选）
        //   width: 1,
        //   color: '#CCC'
        // })
        .position({ x: 250, y:680 })
        .zIndex(1)
        .onClick(() => {
          // 进入学习页面



        })

    }
    .height('100%')
    .width('100%')
  }
}