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
  List = 'list', // 列表
  ListItem = 'listItem', // 列表子项
  InlineCode = 'inlineCode', // 行内代码
  CodeBlock = 'codeBlock', // 代码块
  Divider = 'divider', // 分割线
  Link = 'link', // 超链接
  LinkQuote = 'linkQuote', // 连接引用
  Image = 'image', // 图片
  HTML = 'html', // 内嵌 html
  Table = 'table', // 表格
  DeleteLine = 'deleteLine', // 删除线
  TaskList = 'taskList', // 任务列表
}


export enum EmphasisType {
  Bold = "bold",
  Italic = "italic"
}


export enum ListType {
  Order = "order",
  UnOrder = "unOrder"
}

export enum LinkType {
  Default = "default",
  Quote = "quote"
}


export enum TableLayout {
  Start = "start",
  End = "end",
  Center = "center"
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
  attributes?: { [name: string]: string | number }
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

  /**
   *
   * @param text 标签内未解析的文本
   * @param level 标题等级
   */
  constructor(text: string, level: Level, id: string = null) {
    super(text)
    this.attributes['level'] = level
    this.attributes['id'] = id
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

  constructor(text: string, ...emphasisTypes: EmphasisType[]) {
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

export class ListItem extends Node {
  type: Type = Type.ListItem
}

export class InlineCode extends Node {
  type: Type = Type.InlineCode
}


export class CodeBlock extends Node {
  type: Type = Type.CodeBlock

  constructor(text: string, langd: string) {
    super(text)
    this.attributes['langd'] = langd
  }
}


export class Divider extends Node {
  type: Type = Type.Divider
}

/**
 * todo link 中可以使用行内代码以及图片
 */
export class Link extends Node {
  type: Type = Type.Link
  linkType: LinkType = LinkType.Default
  url: string = ''
  name: string = ''
  title: string = ''

  /**
   *
   * @param url 链接，linkType 为引用时为引用位置
   * @param name
   * @param title
   * @param linkType
   */
  constructor(url: string, name: string, title: string, linkType: LinkType = LinkType.Default) {
    super(null)
    this.attributes['url'] = url
    this.attributes['name'] = name
    this.attributes['title'] = title
    this.linkType = linkType
  }
}

export class LinkQuote extends Node {
  type: Type = Type.LinkQuote

  /**
   *
   * @param url url 地址
   * @param tag 引用名
   * @param title 标题
   */
  constructor(url: string, tag: string, title: string) {
    super(null)
    this.attributes['url'] = url
    this.attributes['tag'] = tag
    this.attributes['title'] = title
  }
}


export class Image extends Node {
  type: Type = Type.Image

  constructor(url: string, name: string, title: string) {
    super(null)
    this.attributes['url'] = url
    this.attributes['name'] = name
    this.attributes['title'] = title
  }
}

export class HTML extends Node {
  type: Type = Type.HTML
}


export class Table extends Node {
  type: Type = Type.Table
  header: Paragraph[] = []
  layout: TableLayout[] = []
  body: Paragraph[][] = []

  constructor(header: Paragraph[], layout: TableLayout[], body: Paragraph[][]) {
    super(null)
    this.header = header
    this.layout = layout
    this.body = body
  }

  appendRow(...row: Paragraph[]) {
    this.body.push(row)
  }
}



export class DeleteLine extends Node {
  type: Type = Type.DeleteLine
}

export class TaskList extends Node {
  type: Type = Type.TaskList
  item: string[] = []
  checked: number[] = []

  constructor(item: string[], checked: number[]) {
    super(null)
    this.item = item
    this.checked = checked
  }
}


// ————————————————————————————
// todo 脚注
// todo 定义列表
// todo 使用 Emoji 表情
// todo 自动网址链接
// todo 转义字符语法
// ————————————————————————————







