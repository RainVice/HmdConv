import { md } from '../Markdown'

export class MDParser{



}

/**
 * 语法分析器
 */
class Lexer{

  nodes: md.Document = new md.Document()


  /**
   * 分词
   * @param src
   */
  lex (text:string): md.Node {
    // 修改换行和缩进
    text = text.replace(/\r\n?|\n/g, "\n").replace(/\t/g, "    ")
    // 块解析
    this.parseBLock(text)
    return this.nodes
  }

  parseBLock(text: string){
    while (text){
      // 解析空行

    }
  }

}


/**
 * 分词器
 */
class Tokenizer{



}

const rule = {
  block: {
    emptyLine: /^(?: *(?:\n|$))+/,
    header: /^ {0,3}(#{1,6})(?=\s|$)(.*)(?:\n+|$)/,
    quote: /^ {0,3}(?:>.*(\n|))+/,

    // (^ {0,3}\d+\. [^]*(?=\n\d))
    orderList: /^\d+\. [^]*?(?=\n\s*\n\D)/,
    unOrderList: /^- [^]*?(?=\n{2}\D)/,

  },
  line: {
    inlineCode: /^(`{1,2})[^`]+\1/,
    lineBreak: /^<(\/|)br>/,
    boldItalic: /^([*_]{3})([^ ].*?[^ ])\1/,
    bold: /^([\*_]{2})([^ ].*?[^ ])\1/,
    italic: /^([\*_])([^ ].*?[^ ])\1/,
    deleteLine: /^~~([^ ].*?[^ ])~~/,

  }
}

