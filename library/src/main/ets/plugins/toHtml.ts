import { Text } from 'domhandler'
import { MDNode } from '../node'

export const root = (mdNode: MDNode): (text: string) => string => {
  return (text: string): string => text
}

export const header = (mdNode: MDNode): (text: string) => string => {
  return (text: string): string => '\n' + `${"#".repeat(parseInt(mdNode.type().slice(-1)))} ${text}` + '\n'
}

export const paragraph = (mdNode: MDNode): (text: string) => string => {
  return (text: string): string => '\n\n' + text + '\n\n'
}

export const text = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => (mdNode.html() as Text).data.trim() + text
}

export const deleteLine = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => `~~${text}~~`
}


export const lineBreak = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => '\n\n' + text
}


export const bold = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => ` **${text.trim()}** `
}

export const italic = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => ` *${text.trim()}* `

}

export const blockquote = (mdNode: MDNode): (text: string) => string => {


  return (text: string) => '\n' + text.trim().replace(/\n\s*\n\s*/g, '\n\n').replace(/^/gm, '> ') + '\n'

}


export const unorderedList = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => '\n' + text.trim().split('\n')
    .filter(Boolean)
    .map((line, i) => (line.match(/^    /) ? line : `- ${line}`))
    .join('\n') + '\n\n'

}

export const orderedList = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => {
    const lines = text.trim().split('\n');
    let count = 1; // 用于计数的变量
    return '\n' + lines.map(line => {
      if (line.trim() === '') {
        // 如果是纯空行，则不添加序号，直接返回空行
        return line;
      } else if (line.startsWith('    ')) {
        // 如果行以四个空格开头，则不添加序号，直接返回该行
        return line;
      } else {
        // 否则，为非空行添加序号
        return `${count++}. ${line}`;
      }
    }).join('\n') + '\n\n'
  }
}

export const listItem = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => '\n' + text.split('\n').map((line, index) => index > 0 ? '    ' + line : line).join('\n')
}
// todo 复选框
export const check = (mdNode: MDNode): (text: string) => string => {
  return (text: string) => ``
}