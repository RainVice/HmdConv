import { Option } from './option'
import { HTMLParser } from './parser'

export class HmdConv {

  html2md(input: string,option?: Option): string {
    const html = new HTMLParser(input,option)
    return html.getMdText()
  }


  // md2html(md: string){
  //
  // }


}

export * from './parser'
export * from './option'