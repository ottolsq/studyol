export class CourseModel {
  id: string = '';            // 课程id
  name: string = '';          // 课程名称
  teacher: string = '';       // 课程教师
  school: string = '';        // 所属学校
  type: string = '';          // 课程类型
  introduction: string = '';  // 简介
  image: Resource = $r('app.media.th'); // 课程封面
}