export class SectionModel {
  id: string = '';             // 小节id
  chapterId: string = '';      // 所属章节id
  sectionNumber: string = '';  // 小节编号 eg 1.1
  title: string = '';          // 小节标题
  sectionOrder: number = -1;   // 小节顺序
  type: number = -1;           // 小节类型 eg 1视频, 2阅读材料
  content: string = '';        // 内容
}