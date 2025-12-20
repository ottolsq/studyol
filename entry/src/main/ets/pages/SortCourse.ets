import { CourseListData } from '../Data/Data';
import { CourseModel } from '../viewmodel/CourseModel';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct SortCourse {
  @State type: string = '全部';
  @State courseList: CourseModel[] = CourseListData;

  aboutToAppear(): void {
    const params = router.getParams() as Record<string, string>
    if (params && params['type']) {
      // this.type = params['type']
      switch (params['type']){
        case 'cs':
          this.type = '计科';
          break;
        case 'eng':
          this.type = '英语';
          break;
        case 'math':
          this.type = '数学';
          break;
        case 'other':
          this.type = '其他';
          break;
        default:
          this.type = '全部';
      }

      // todo: 获取课程列表
      // 可根据ID发起数据请求等操作
      this.courseList = CourseListData.filter(item => item.type == params['type'])

      console.log('testTag: type: ' + this.type)
      console.log('testTag: courseList: ' + this.courseList)
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
        Text(this.type)
          .width("80%")
          .fontSize(18)
          .textAlign(TextAlign.Center)
      }
      .width("100%")
      .backgroundColor(Color.White)
      .position({ x: 0, y: 0 })
      .zIndex(1)

      Scroll() {
        Column() {
          ForEach(this.courseList, (Course: CourseModel) => {
            Row() {
              Image(Course.image)
                .borderRadius(5)
                .width('50%')
                .height(110)
                .objectFit(ImageFit.Cover)
                .margin({ top: 3, bottom: 3 })

              Column() {
                Text(Course.name)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })

                Text("学校: " + Course.school)
                  .fontSize(16)
                  .fontColor('#000')
                  .textAlign(TextAlign.Start)
                  .margin({ top: 3, bottom: 3 })

                Text("教师: " + Course.teacher)
                  .fontSize(16)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })
              }
              .width('50%')
            }
            .margin({ top: 10 })
            .height(110)
            .width('94%')
            .borderRadius(5)
            .backgroundColor($r('app.color.card_background'))
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Course', // 请根据实际页面路径调整
                params: {
                  id: Course.id
                }
              })
            })
          })
          ForEach(this.courseList, (Course: CourseModel) => {
            Row() {
              Image(Course.image)
                .borderRadius(5)
                .width('50%')
                .height(110)
                .objectFit(ImageFit.Cover)
                .margin({ top: 3, bottom: 3 })

              Column() {
                Text(Course.name)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })

                Text("学校: " + Course.school)
                  .fontSize(16)
                  .fontColor('#000')
                  .textAlign(TextAlign.Start)
                  .margin({ top: 3, bottom: 3 })

                Text("教师: " + Course.teacher)
                  .fontSize(16)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })
              }
              .width('50%')
            }
            .margin({ top: 10 })
            .height(110)
            .width('94%')
            .borderRadius(5)
            .backgroundColor($r('app.color.card_background'))
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Course', // 请根据实际页面路径调整
                params: {
                  id: Course.id
                }
              })
            })
          })
          ForEach(this.courseList, (Course: CourseModel) => {
            Row() {
              Image(Course.image)
                .borderRadius(5)
                .width('50%')
                .height(110)
                .objectFit(ImageFit.Cover)
                .margin({ top: 3, bottom: 3 })

              Column() {
                Text(Course.name)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })

                Text("学校: " + Course.school)
                  .fontSize(16)
                  .fontColor('#000')
                  .textAlign(TextAlign.Start)
                  .margin({ top: 3, bottom: 3 })

                Text("教师: " + Course.teacher)
                  .fontSize(16)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })
              }
              .width('50%')
            }
            .margin({ top: 10 })
            .height(110)
            .width('94%')
            .borderRadius(5)
            .backgroundColor($r('app.color.card_background'))
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Course', // 请根据实际页面路径调整
                params: {
                  id: Course.id
                }
              })
            })
          })
        }
      }
      .width('100%')
      .margin({ top: 40 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.my_background'))
  }
}