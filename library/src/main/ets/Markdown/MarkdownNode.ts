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
  TableHeader = 'tableHeader', // 表格头
  TableBody = 'tableBody', // 表格体
  TableRow = 'tableRow', // 表格行
  TableData = 'tableData', // 表格数据
  DeleteLine = 'deleteLine', // 删除线
  Task = 'task', // 任务列表
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
  attributes?: { [name: string]: string | number | null } = {}
  text?: string
  parent?: Node

  /**
   *
   * @param text 便签内未解析的文本
   */
  constructor(text: string | null = null) {
    this.text = text
  }

  appendChild(child: Node): void {
    child.parent = this
    this.children?.push(child)
  }

  toText(): string {
    return this.children.map(item => item.toText()).join('\n\n')
  }

  protected itemText(): string {
    return this.children.map(item => item.toText()).join()
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

  toText(): string {
    return this.text
  }
}

export class Header extends Node {
  type: Type = Type.Header

  /**
   *
   * @param text 标签内未解析的文本
   * @param level 标题等级
   */
  constructor(level: Level, id: string = null, text: string = null) {
    super(text)
    this.attributes['level'] = level
    this.attributes['id'] = id
  }

  toText(): string {
    return `${"#".repeat(this.attributes["level"] as number)} ${this.itemText()} {#${this.attributes['id'] || ""}}`
  }
}

export class Paragraph extends Node {
  type: Type = Type.Paragraph

  toText(): string {
    return this.itemText()
  }
}


export class LineBreak extends Node {
  type: Type = Type.LineBreak

  toText(): string {
    return '\n'
  }
}

export class Emphasis extends Node {
  type: Type = Type.Emphasis
  emphasisType: EmphasisType[]

  constructor(text: string, ...emphasisTypes: EmphasisType[]) {
    super(text);
    this.emphasisType = emphasisTypes
  }

  toText(): string {
    let text = this.itemText()
    this.emphasisType.forEach((emp: EmphasisType, index: number) => {
      if (emp === EmphasisType.Bold) {
        text = `**${text}**`
      }
      else {
        text = `*${text}*`
      }
    })
    return text
  }
}

export class Quote extends Node {
  type: Type = Type.Quote

  toText(): string {
    return this.itemText().replace(/^/gm, '> ')
  }
}

// todo toText
export class List extends Node {
  type: Type = Type.List
  listType: ListType = ListType.Order

  constructor(listType: ListType, text: string = null) {
    super(text)
    this.listType = listType
  }
}

// todo toText
export class ListItem extends Node {
  type: Type = Type.ListItem
}

export class InlineCode extends Node {
  type: Type = Type.InlineCode

  toText(): string {
    const text = this.itemText()
    return /`(.*?)`/g.test(text.replace(/^`|`$/g, '')) ?
      '``' + text.replace(/^`|`$/g, '') + '``' :
      '`' + text.replace(/^`|`$/g, '') + '`'
  }
}


export class CodeBlock extends Node {
  type: Type = Type.CodeBlock

  constructor(lang: string, text: string = null) {
    super(text)
    this.attributes['lang'] = lang
  }

  toText(): string {
    return '```' + this.attributes['lang'] + '\n' + this.itemText().replace(/^`|`$/g, '') + '\n```'
  }
}


export class Divider extends Node {
  type: Type = Type.Divider

  toText(): string {
    return '---'
  }

}

/**
 * todo link 中可以使用行内代码以及图片
 */
export class Link extends Node {
  type: Type = Type.Link
  linkType: LinkType = LinkType.Default

  // url: string = ''
  // title: string = ''

  /**
   *
   * @param url 链接，linkType 为引用时为引用位置
   * @param name
   * @param title
   * @param linkType
   */
  constructor(url: string, title: string, linkType: LinkType = LinkType.Default) {
    super(null)
    this.attributes['url'] = url
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
}

export class TableHeader extends Node {
  type: Type = Type.TableHeader
}


export class TableBody extends Node {
  type: Type = Type.TableBody
}

export class TableRow extends Node {
  type: Type = Type.TableRow
}

export class TableData extends Node {
  type: Type = Type.TableData
}


export class DeleteLine extends Node {
  type: Type = Type.DeleteLine
}

export class Task extends Node {
  type: Type = Type.Task
  checked: boolean = false

  constructor(checked: boolean, text: string = null) {
    super(text)
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







