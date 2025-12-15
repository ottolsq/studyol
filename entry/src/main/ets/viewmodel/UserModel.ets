export class UserModel {
  id: string = '';
  username: string =  '';
  password: string = '';
  school?: string = '';
  qualification?: string = '';
  email?: string = '';
  region?: string = '';
  position?: string = '';
  SelectedCourses: string[] = [];
}