import { promptAction, router } from '@kit.ArkUI';
import { CourseModel } from '../viewmodel/CourseModel';
import { http } from '@kit.NetworkKit';
import Constants, { ContentType } from '../common/constants/Constants'
import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';

@Entry
@Component
struct Course {
  @State userId: string = '';
  @State courseId: string = '';
  @State type: string = '其他';
  @State course: CourseModel= new CourseModel();
  @State isSelected: boolean = false;

  private context = getContext(this) as common.UIAbilityContext;
  private preference = preferences.getPreferences(this.context, { name: 'userInfo' })

  async aboutToAppear(){
    console.log('testTag: Course aboutToAppear')

    // 获取用户id
    this.userId = (await this.preference).getSync('userId', '') as string

    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.courseId = params['id']
      // 可根据ID发起数据请求等操作
      // 读取课程信息
      try {
        let httpRequest = http.createHttp();
        httpRequest.request(`${Constants.SERVER}/getCourseById/${this.courseId}`, {
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

            let courseData: CourseModel;

            if (typeof result.result === 'string') {
              courseData = JSON.parse(result.result);

              this.course = courseData

              switch (this.course.type){
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

      try {
        let httpRequest = http.createHttp();
        httpRequest.request(`${Constants.SERVER}/isSelectedCourse?user_id=${this.userId}&course_id=${this.courseId}`, {
          method:  http.RequestMethod.POST,
          readTimeout: Constants.HTTP_READ_TIMEOUT,
          header: {
            'Content-Type': ContentType.JSON
          },
          connectTimeout: Constants.HTTP_READ_TIMEOUT
        }, async (err, result) =>{
          if (result.responseCode === 200) {
            console.log('testTag: 获取 是否已选该课程 成功')
            console.log('testTag: responseResult:', result.result);
            if(result.result > 0){
              this.isSelected = true
            }else {
              this.isSelected = false
            }
            console.log('testTag: isSelected:', this.isSelected)
          } else {
            console.log('testTag: 获取失败')
            console.log('testTag: responseResult:', err)
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
      .backgroundColor(Color.White)
      .position({ x: 0, y: 0 })
      .zIndex(1)

      Image(this.course.image_url)
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
          .margin({top: 10})

        Text("学校: " + this.course.school)
          .width('100%')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .margin({top: 10})

        Text("教师: " + this.course.teacher)
          .width('100%')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .margin({top: 10})

        Text("类别: " + this.type)
          .width('100%')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .margin({top: 10})

        Text("简介: \n" + this.course.introduction)
          .width('100%')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .margin({top: 10 })
      }
      .width('94%')
      .height('auto')
      .borderRadius(10)
      .margin({top: 10})
      .padding(10)
      .backgroundColor($r('app.color.card_background'))

      Button("加入学习")
        .backgroundColor(Color.Orange)
        .position({ x: 250, y:680 })
        .zIndex(1)
        .onClick(() => {
          // 学生选课
          if (this.isSelected) {

            console.log('testTag: 进入学习页面', this.isSelected)
            // 进入学习页面
            router.pushUrl({
              url: 'pages/Study',  // 请根据实际页面路径调整
              params: {
                id: this.courseId
              }
            })
          }else{
            // 添加选课
            try {
              let httpRequest = http.createHttp();
              httpRequest.request(`${Constants.SERVER}/addUserCourse?user_id=${this.userId}&course_id=${this.courseId}`, {
                method:  http.RequestMethod.POST,
                readTimeout: Constants.HTTP_READ_TIMEOUT,
                header: {
                  'Content-Type': ContentType.JSON
                },
                connectTimeout: Constants.HTTP_READ_TIMEOUT
              }, async (err, result) =>{
                if (result.responseCode === 200) {
                  console.log('testTag: 添加成功')
                  console.log('testTag: responseResult:', result.result);

                  router.pushUrl({
                    url: 'pages/Study',  // 请根据实际页面路径调整
                    params: {
                      id: this.courseId
                    }
                  })
                } else {
                  console.log('testTag: 添加失败')
                  console.log('testTag: responseResult:', err)
                  promptAction.showToast({ message: '添加失败' })
                }
              });
            } catch (err) {
              console.error('Request error:', err);
              promptAction.showToast({ message: '网络请求异常' });
            }
          }
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.my_background'))
  }
}