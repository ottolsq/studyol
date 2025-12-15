import { router } from '@kit.ArkUI';
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

      console.log("testTag: studyPage " + this.courseId)

    }
  }

  build() {
    Column() {
      // todo: 课程信息


    }
  }
}