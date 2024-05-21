/**
 * 定义Markdown节点类型的枚举
 */
export enum Type {
  Document = 'document', // 文档
  Text = 'text', // 文本
  Header = 'header', // 标题
  Paragraph = 'paragraph', // 段落
  LineBreak = 'lineBreak', // 换行
  Emphasis = 'emphasis', // 强调
  Quote = 'quote', // 引用
  List  = 'list', // 列表
  ListItem   = 'listItem', // 列表子项
}


export enum EmphasisType{
  Bold = "bold",
  Italic = "italic"
}


export enum ListType{
  Order = "order",
  UnOrder = "unOrder"
}

/**
 * # 标题等级
 */
export type Level = 1 | 2 | 3 | 4 | 5 | 6

/**
 * type - 节点类型。
 * children - 子节点列表。。
 * attributes - 属性字典，存储如链接的href，图片的src等。
 * text - 每个节点中的文本
 * parent - 父节点引用。
 */
export abstract class Node {
  type: Type;
  children: Node[] = [];
  attributes?: { [name: string]: string }
  text?: string
  parent?: Node

  /**
   *
   * @param text 便签内未解析的文本
   */
  constructor(text: string) {
    this.text = text
  }

  appendChild(child: Node): void {
    child.parent = this
    this.children?.push(child)
  }

  toText(): string {
    return this.children.map(item => item.toText()).join('\n\n')
  }
}

/**
 * 文档，作根节点
 */
export class Document extends Node {
  type: Type = Type.Document
}

export class Text extends Node {
  type: Type = Type.Text
}

export class Header extends Node {
  type: Type = Type.Header
  level: Level = 1;

  /**
   *
   * @param text 标签内未解析的文本
   * @param level 标题等级
   */
  constructor(text: string, level: Level) {
    super(text)
    this.level = level
  }
}

export class Paragraph extends Node {
  type: Type = Type.Paragraph
}


export class LineBreak extends Node {
  type: Type = Type.LineBreak
}

export class Emphasis extends Node {

  type: Type = Type.Emphasis
  emphasisType: EmphasisType[]

  constructor(text:string, ...emphasisTypes: EmphasisType[]) {
    super(text);
    this.emphasisType = emphasisTypes
  }

}

export class Quote extends Node {
  type: Type = Type.Quote
}

export class List extends Node {
  type: Type = Type.List
  listType: ListType = ListType.Order
  children: ListItem[] = []

  constructor(text: string, listType: ListType) {
    super(text)
    this.listType = listType
  }
  appendChild(child: ListItem): void {
    child.parent = this
    this.children.push(child)
  }
}

export class ListItem extends Node{
  type: Type = Type.ListItem
}






