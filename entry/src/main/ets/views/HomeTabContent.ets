import { promptAction, router } from "@kit.ArkUI"
import { CourseModel } from "../viewmodel/CourseModel"
import { TabItem } from "../viewmodel/NewsData"
import { http } from "@kit.NetworkKit"
import Constants, { ContentType } from '../common/constants/Constants'

// HomeTabContent.ets
@Component
export default struct HomeTabContent {

  private swiperController: SwiperController = new SwiperController()  // 声明控制器
  @State private courseList: CourseModel[] = [];
  @State private recomCourses: CourseModel[] = [];

  private sorts: TabItem[] = [
    { title: '计科', icon: '🖥️' },
    { title: '英语', icon: '🔤' },
    { title: '数学', icon: '🔢' },
    { title: '其他', icon: '🎸' }
  ]

  async aboutToAppear(){
    console.log('testTag: HomeTabContent aboutToAppear')

    // 获取课程数据
    try {
      let httpRequest = http.createHttp();
      httpRequest.request(`${Constants.SERVER}/allCourses`, {
        method:  http.RequestMethod.GET,
        readTimeout: Constants.HTTP_READ_TIMEOUT,
        header: {
          'Content-Type': ContentType.JSON
        },
        connectTimeout: Constants.HTTP_READ_TIMEOUT
      }, async (err, result) =>{
        if (result.responseCode === 200) {
          console.log('testTag: 获取成功')
          console.log('testTag: responseResult:', result.result);

          let courseData: CourseModel[];

          if (typeof result.result === 'string') {
            courseData = JSON.parse(result.result);

            this.courseList = courseData;
            this.recomCourses = courseData.slice(3, 8);
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

  build() {
    Column(){
    Scroll(){
        Column(){
          // 标题
          Text('首页')
            .fontSize(20)
            .lineHeight(20)
            .fontColor('#000')
            .textAlign(TextAlign.Center)
            .margin({ top: 3, bottom: 3 })

          // 轮播图 -- 推荐课程
          Swiper(this.swiperController) {
            ForEach(this.recomCourses, (course: CourseModel) => {
              Image(course.image_url)
                .borderRadius(5)
                .width('100%')  // 宽度与 Swiper 保持一致
                .height('100%') // 高度与 Swiper 保持一致
                .objectFit(ImageFit.Cover)
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/Course',  // 请根据实际页面路径调整
                    params: {
                      id: course.id
                    }
                  })
                })
            }, (course: CourseModel) => JSON.stringify(course.id))
          }
          .height(200) // 设置 Swiper 固定高度
          .width('96%') // 宽度填满父容器
          // .backgroundColor(Color.White)
          // .margin({ top: $r('app.float.home_swiper_margin') })
          .autoPlay(true)

          // 分类栏
          Row(){
            ForEach(this.sorts, (tab: TabItem, index: number) => {
              Column() {
                Text(tab.icon)
                  .fontSize(30)
                Text(tab.title)
              }
              .margin({ left: 26, right: 26 })
              .onClick(() => {
                let type = '';
                switch (tab.title){
                  case '计科':
                    type = 'cs';
                    break;
                  case '英语':
                    type = 'eng';
                    break;
                  case '数学':
                    type = 'math';
                    break;
                  case '其他':
                    type = 'other';
                    break;
                  default:
                    type = 'all';
                    // console.log('testTag: HomeTabContent 其他')
                }

                router.pushUrl({
                  url: 'pages/SortCourse',  // 请根据实际页面路径调整
                  params: {
                    type: type
                  }
                })

              })
            })
          }
          .width("100%")
          .height(80)
          .margin({ top: 10 })
          .backgroundColor('#9AC7EC')

          Text("热门课程")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Start)
            .fontColor('#E86349')
            .width('96%')
            .margin({top: 10})

          // 课程卡
          ForEach(this.courseList, (course: CourseModel) => {
            Row() {
              Image(course.image_url)
                .borderRadius(5)
                .width('50%')
                .height(110)
                .objectFit(ImageFit.Cover)
                .margin({ top: 3, bottom: 3 })

              Column() {
                Text(course.name)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })


                Text("学校: " + course.school)
                  .fontSize(16)
                  .fontColor('#000')
                  .textAlign(TextAlign.Start)
                  .margin({ top: 3, bottom: 3 })

                Text("教师: " + course.teacher)
                  .fontSize(16)
                  .fontColor('#000')
                  // .textAlign(TextAlign.Center)
                  .margin({ top: 3, bottom: 3 })
              }
              .width('50%')
            }
            .margin({top: 10})
            .height(110)
            .width('94%')
            .borderRadius(10)
            .backgroundColor($r('app.color.card_background'))
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Course',  // 请根据实际页面路径调整
                params: {
                  id: course.id
                }
              })
            })
          })
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.my_background'))
  }
}
