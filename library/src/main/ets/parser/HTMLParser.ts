import { Document, DomUtils, parseDocument } from '@ohos/htmlparser2'
import { ChildNode, Element, Text } from 'domhandler'
import { md } from '../Markdown'
import { render } from 'dom-serializer'


export class HTMLParser {
  private dom: Document
  private mdom: md.Document

  constructor(html: string) {
    this.dom = parseDocument(html)
    this.mdom = this.traverseDOM(this.dom, this.mdom)
  }

  private traverseDOM(childNode: ChildNode, node: md.Node): md.Node {


    const temp = this.createNode(childNode)
    node?.appendChild(temp)
    if (DomUtils.hasChildren(childNode)) {
      childNode.children.forEach((item: ChildNode, index: number) => {
        if (!(item.type === "text" && item.data === '\n')) {
          this.traverseDOM(item, temp)
        }
      })
    }
    return temp
  }

  private createNode(childNode: ChildNode): md.Node {
    let action: (childNode: ChildNode) => md.Node
    if (childNode.type === 'tag') {
      if (childNode.name === 'input') {
        action = htmlToMdom[childNode.attribs['type']]
      }
      else {
        action = htmlToMdom[childNode.name]
      }
    }
    else {
      action = htmlToMdom[childNode.type]
    }

    return action ? action(childNode) : new md.Document()
  }

  getMdText(): string {
    return this.mdom.toText()
  }
}


// 创建一个映射对象，将HTML标签映射成 Markdown Dom 对象
const htmlToMdom: { [key: string]: (childNode: ChildNode) => md.Node } = {
  'root': (childNode: ChildNode): md.Document => new md.Document(),
  'figure': (childNode: ChildNode): md.Document => new md.Document(),
  'div': (childNode: ChildNode): md.HTML => new md.HTML(render(childNode)),
  'span': (childNode: ChildNode): md.HTML => new md.HTML(render(childNode)),
  'h1': (childNode: ChildNode): md.Header => new md.Header(1, (childNode as Element).attribs['id']),
  'h2': (childNode: ChildNode): md.Header => new md.Header(2, (childNode as Element).attribs['id']),
  'h3': (childNode: ChildNode): md.Header => new md.Header(3, (childNode as Element).attribs['id']),
  'h4': (childNode: ChildNode): md.Header => new md.Header(4, (childNode as Element).attribs['id']),
  'h5': (childNode: ChildNode): md.Header => new md.Header(5, (childNode as Element).attribs['id']),
  'h6': (childNode: ChildNode): md.Header => new md.Header(6, (childNode as Element).attribs['id']),
  'text': (childNode: ChildNode): md.Text => new md.Text((childNode as Text).data),
  'p': (childNode: ChildNode): md.Paragraph => new md.Paragraph(),
  's': (childNode: ChildNode): md.DeleteLine => new md.DeleteLine(),
  'del': (childNode: ChildNode): md.DeleteLine => new md.DeleteLine(),
  'br': (childNode: ChildNode): md.LineBreak => new md.LineBreak(),
  'strong': (childNode: ChildNode): md.Emphasis => new md.Emphasis(null, md.EmphasisType.Bold),
  'b': (childNode: ChildNode): md.Emphasis => new md.Emphasis(null, md.EmphasisType.Bold),
  'i': (childNode: ChildNode): md.Emphasis => new md.Emphasis(null, md.EmphasisType.Italic),
  'em': (childNode: ChildNode): md.Emphasis => new md.Emphasis(null, md.EmphasisType.Italic),
  'blockquote': (childNode: ChildNode): md.Quote => new md.Quote(),
  'ul': (childNode: ChildNode): md.List => new md.List(md.ListType.UnOrder),
  'ol': (childNode: ChildNode): md.List => new md.List(md.ListType.Order),
  'li': (childNode: ChildNode): md.ListItem => new md.ListItem(),
  'checkbox': (childNode: ChildNode): md.Task => new md.Task(DomUtils.hasAttrib(childNode as Element, "checked")),
  'a': (childNode: ChildNode): md.Link => new md.Link((childNode as Element).attribs['href'], (childNode as Element).attribs['title']),
  'code': (childNode: ChildNode): md.InlineCode => new md.InlineCode(),
  'pre': (childNode: ChildNode): md.CodeBlock => new md.CodeBlock((childNode as Element).attribs["data-lang"] || DomUtils.getElementsByTagName('code', childNode)[0].attribs["class"]?.split('-')[1] || ""),
  'hr': (childNode: ChildNode): md.Divider => new md.Divider(),
  'img': (childNode: ChildNode): md.Image => new md.Image((childNode as Element).attribs['src'], (childNode as Element).attribs['alt'], (childNode as Element).attribs['title']),
  'table': (childNode: ChildNode): md.Table => new md.Table(),
  'thead': (childNode: ChildNode): md.TableHeader => new md.TableHeader(),
  'tbody': (childNode: ChildNode): md.TableBody => new md.TableBody(),
  'tr': (childNode: ChildNode): md.TableRow => new md.TableRow(),
  'td': (childNode: ChildNode): md.TableData => new md.TableData(),
  'th': (childNode: ChildNode): md.TableData => new md.TableData(),
};