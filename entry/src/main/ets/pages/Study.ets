import { router } from '@kit.ArkUI';
import { ChapterListData , SectionListData, CourseListData } from '../Data/Data';
import { ChapterModel } from '../viewmodel/ChapterModel';
import { CourseModel } from '../viewmodel/CourseModel';
import { SectionModel } from '../viewmodel/SectionModel';

@Entry
@Component
struct Study {


  @State courseId: string = '';
  @State course: CourseModel = new CourseModel();
  @State chapterList: ChapterModel[] = [];
  @State sectionList: SectionModel[][] = [];

  aboutToAppear(): void {
    const params = router.getParams() as Record<string, string>
    if (params && params['id']) {
      this.courseId = params['id']

      // 可根据ID发起数据请求等操作
      // todo: 读取课程信息
      CourseListData.forEach( item => {
        if (item.id == this.courseId) {
          this.course = item

          // todo: 读取章节/小节信息
          this.chapterList = ChapterListData.filter(i => i.courseId == item.id)
          this.chapterList.forEach((Chapter, index) => {
            this.sectionList[index] = SectionListData.filter(i => i.chapterId == Chapter.id)
            // console.log("testTag: Chapter " + item.title)
          })

          // this.SectionList = SectionListData.filter(i => i.chapterId == item.id)
          console.log("testTag: Chapter " + this.chapterList)
        }
      })

      console.log("testTag: studyPage " + this.courseId)

    }
  }

  getSectionDisplayText(sectionItem: SectionModel): string {
  switch (sectionItem.type) {
    case 1:
      return `🎬 ${sectionItem.title}`;
    case 2:
      return `📚 ${sectionItem.title}`;
    default:
      return `${sectionItem.title}`;
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
        Text('我的学习')
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
          // 标题
          Text(this.course.name)
            .width("90%")
            .fontSize(20)
            .margin({top: 10})
            // .textAlign(TextAlign.Center)

          List({ space: 10 }) {
            ForEach(this.chapterList, (chapterItem: ChapterModel, chapterIndex: number) => {
              ListItem() {
                Column() {
                  // 章节标题
                  Row() {
                    Text(chapterItem.title)
                      .fontSize(18)
                      .fontWeight(FontWeight.Medium)
                      .layoutWeight(1)
                  }
                  .width('100%')
                  .padding(12)
                  .backgroundColor('#9AC7EC')
                  .borderRadius({ topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0})

                  // 显示该章节下的所有小节
                  ForEach(this.sectionList[chapterIndex], (sectionItem: SectionModel) => {

                    Text(sectionItem.sectionNumber+' '+sectionItem.title)
                      .fontSize(14)
                      .padding({ left: 24, top: 6, bottom: 6 })
                      .width('100%')

                    Text(this.getSectionDisplayText(sectionItem))
                      .fontSize(14)
                      .padding({ left: 24, top: 6, bottom: 6 })
                      .width('100%')
                      .onClick(()=>{
                        router.pushUrl({
                          url: 'pages/StVideo', // 请根据实际页面路径调整
                          params: {
                            id: sectionItem.id,
                            type: sectionItem.type
                          }
                        })
                      })
                  },  (sectionItem: SectionModel) => sectionItem.id)
                }
                .width('100%')
              }
              .backgroundColor($r('app.color.card_background'))
              .borderRadius(10)
            }, (chapterItem: ChapterModel)  => chapterItem.id)  // key generator
            /*ForEach(this.chapterList, (chapterItem: ChapterModel, chapterIndex: number) => {
              ListItem() {
                Column() {
                  // 章节标题
                  Row() {
                    Text(chapterItem.title)
                      .fontSize(18)
                      .fontWeight(FontWeight.Medium)
                      .layoutWeight(1)
                  }
                  .width('100%')
                  .padding(12)
                  .backgroundColor('#9AC7EC')
                  .borderRadius({ topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0})

                  // 显示该章节下的所有小节
                  ForEach(this.sectionList[chapterIndex], (sectionItem: SectionModel) => {

                    Text(sectionItem.sectionNumber+' '+sectionItem.title)
                      .fontSize(14)
                      .padding({ left: 24, top: 6, bottom: 6 })
                      .width('100%')

                    Text(this.getSectionDisplayText(sectionItem))
                      .fontSize(14)
                      .padding({ left: 24, top: 6, bottom: 6 })
                      .width('100%')
                      .onClick(()=>{
                        router.pushUrl({
                          url: 'pages/StVideo', // 请根据实际页面路径调整
                          params: {
                            id: sectionItem.id,
                            type: sectionItem.type
                          }
                        })
                      })


                  },  (sectionItem: SectionModel) => sectionItem.id)
                }
                .width('100%')
              }
              .backgroundColor($r('app.color.card_background'))
              .borderRadius(10)

            }, (chapterItem: ChapterModel)  => chapterItem.id)  // key generator*/
          }
          .width('100%')
          .height('auto')
          .padding(10)

          // 附加展开样式的
          /*List({ space: 10 }) {
            ForEach(this.chapterList, (chapterItem: ChapterModel, chapterIndex: number) => {
              ListItem() {
                Column() {
                  // 章节标题行（可点击区域）
                  Row() {
                    Text(chapterItem.title)
                      .fontSize(18)
                      .fontWeight(FontWeight.Medium)
                      .layoutWeight(1) // 占据剩余空间

                    // 展开/收起图标
                    Image($r('app.media.arrow_down')) // 向下箭头表示收起状态
                      .width(20)
                      .height(20)
                      .rotate({
                        angle: chapterItem.isExpanded ? 180 : 0 // 展开时旋转180度
                      })
                      .transition({ type: TransitionType.Insert, opacity: 1 })
                  }
                  .width('100%')
                  .padding({ left: 16, right: 16, top: 12, bottom: 12 })
                  .backgroundColor('#FFFFFF')
                  .borderRadius(8)
                  .onClick(() => {
                    // 点击时切换展开状态
                    chapterItem.isExpanded = !chapterItem.isExpanded;

                    console.log("testTag: " + chapterItem.isExpanded)
                    // 更新数组引用以触发重新渲染
                    this.chapterList = [...this.chapterList];
                  })

                  // 条件渲染：展开时显示小节内容
                  if (chapterItem.isExpanded) {


                    Column() {
                      ForEach(this.sectionList[chapterIndex], (sectionItem: SectionModel) => {
                        Text(sectionItem.title)
                          .fontSize(14)
                          .padding({ left: 32, top: 6, bottom: 6 })
                          .width('100%')
                      }, (sectionItem: SectionModel) => sectionItem.id)
                    }
                    .width('100%')
                    .padding({ left: 24, right: 16, top: 8, bottom: 8 })
                    .transition({ // 添加展开动画
                      type: TransitionType.Insert,
                      opacity: 1
                    })
                  }
                }
                .width('100%')
              }
            }, (chapterItem: ChapterModel) => chapterItem.id) // key generator
          }
          .width('100%')
          .height('100%')
          .padding(12)*/
        }
        .height("auto")
        // .backgroundColor(Color.Yellow)
      }
      .width("100%")
      .height("auto")
      .margin({top: 40})
      // .backgroundColor(Color.Pink)
    }
    .width("100%")
    .height("100%")
    .backgroundColor($r('app.color.my_background'))
  }
}