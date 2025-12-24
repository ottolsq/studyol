export class UserModel {
  id: string = '';              // id
  username: string =  '';       // 姓名
  password: string = '';        // 密码
  school?: string = '';         // 学校
  qualification?: string = '';  // 学历
  email?: string = '';          // 邮箱
  region?: string = '';         // 地区
  position?: string = '';       // 职位
  // SelectedCourses: string[] = []; // 已选课程
}