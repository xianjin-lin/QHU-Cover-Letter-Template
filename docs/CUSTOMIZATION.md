# 自定义与排错指南

[← 返回模板首页](../README.md)

这里说明如何调整当前模板的版式、解决常见问题，并在本地编译检查。

## 如何自行调整版式？

先完成正文，再调整版式。每次只修改一项并重新编译，便于判断效果。

下文所说的<strong>导言区</strong>，指 `main.tex` 中 `\documentclass{...}` 之后、`\begin{document}` 之前的部分。

### 常用调整：修改 main.tex

| 调整项目 | 当前设置 | 修改方式 |
| --- | --- | --- |
| 正文字号 | `12pt` | 修改 `\documentclass[12pt]{QHUletter}`，可选 `10pt`、`11pt` 或 `12pt` |
| 背景不透明度 | `0.15` | 重定义 `\watermarkopacity` |
| 背景校徽宽度 | `105mm` | 重定义 `\watermarkwidth` |
| 纸张与页边距 | US Letter，左右分别为 19.05、22.225 mm | 使用 `\geometry{...}` |
| 段间距 | `0.7em` | 使用 `\setlength{\parskip}{...}` |

<strong>调整背景大小和透明程度：</strong>在导言区加入：

```latex
\renewcommand{\watermarkopacity}{0.08}
\renewcommand{\watermarkwidth}{100mm}
```

不透明度越小，背景越淡；设为 `0` 时背景不可见，但编译仍需要 `qhu.pdf`。只设置宽度可以保持校徽的原始比例。

<strong>改用 A4：</strong>在导言区加入：

```latex
\geometry{
  a4paper,
  left=19.05mm,
  right=22.225mm,
  top=53mm,
  bottom=19mm
}
```

页面变高后，背景也会随页面中心移动。调整左右页边距时，固定定位的信头和地址不会自动跟随移动，需要一并检查。

<strong>调整段间距：</strong>在导言区加入：

```latex
\setlength{\parskip}{0.5em}
```

如果正文变为两页，优先精简内容或小幅调整段间距，再考虑缩小字号。模板支持自然续页。

### 信头、地址与分隔线：修改 QHUletter.cls

在 `QHUletter.cls` 的 `\opening` 定义中可以找到这些参数：

| 元素 | 当前参数 | 含义 |
| --- | --- | --- |
| 信头尺寸 | `height=27.94mm` | 图片高度，宽度按比例确定 |
| 信头位置 | `xshift=19.05mm,yshift=-18mm` | 距页面左边 19.05 mm、上边 18 mm |
| 地址位置 | `xshift=127mm,yshift=-18mm` | 距页面左边 127 mm、上边 18 mm |
| 地址宽度 | `text width=70mm` | 地址文字的排版宽度 |
| 地址字体 | `\fontsize{10}{12}` | 字号 10 pt、行距 12 pt |
| 竖线横向位置 | `xshift=121mm` | 距页面左边 121 mm |
| 竖线起止位置 | `yshift=-8mm` 和 `yshift=-58mm` | 距页面上边 8 mm 到 58 mm |

定位基准均为页面<strong>左上角</strong>。`xshift` 增大表示向右移动；`yshift` 越负，表示越向下移动。

例如，将信头缩小一些，只需将：

```latex
\includegraphics[height=27.94mm]{qhu_bg.pdf}
```

改为：

```latex
\includegraphics[height=24mm]{qhu_bg.pdf}
```

请保持图片用途：`qhu_bg.pdf` 是横向信头，`qhu.pdf` 是背景校徽。替换素材时可沿用这两个文件名，避免同时修改代码引用。

### 日期、称呼和落款间距

在 `QHUletter.cls` 中：

- `\opening` 定义内的 `\vspace{1.5\baselineskip}` 控制日期之后的额外留白。
- `\closing` 定义内的 `\vspace{1.5\baselineskip}` 控制落款之前的额外留白。
- `\closing` 定义内的 `\\[0.5\medskipamount]` 控制结束语与签名之间的额外留白。

需要向左移动落款时，找到 `\closing` 内的这两行：

```latex
\noindent\hspace*{0.6\textwidth}%
\parbox[t]{0.4\textwidth}{\raggedright
```

将比例成对改为 `0.55` 和 `0.45`，即可向左移动并扩大签名区域。两者之和应保持为 `1`，避免整体超出正文宽度。

### 可选：添加收件人或主题行

默认收件人参数为空：

```latex
\begin{letter}{}
```

需要显示收件人时，可以改为：

```latex
\begin{letter}{Editor-in-Chief\\Journal Name}
```

需要主题行时，在 `main.tex` 导言区加入：

```latex
\subject{Submission of manuscript entitled ``Your Manuscript Title''}
```

不需要主题时，删除或注释这条命令即可。

## 新手常见问题

| 问题 | 检查方法 |
| --- | --- |
| 找不到 `QHUletter.cls` | 确认它与 `main.tex` 位于同一目录，文件名大小写一致 |
| 找不到图片 | 确认两份 PDF 图片均已上传，且文件名没有改变 |
| 编译了检查样例 | 将主文件设回 `main.tex`，不要选择 `tests/layout_check.tex` |
| 修改后预览没有变化 | 保存并重新编译，确认编辑的是当前项目中的 `main.tex` |
| 地址换行过多或与日期重叠 | 缩短单位名称、减少行数，或调整地址字体和位置 |
| 背景影响阅读 | 减小 `\watermarkopacity`，例如改为 `0.08` |
| 落款到了第二页 | 优先精简正文或小幅减小段间距，再检查字号和页边距 |
| 中文正文显示异常 | 当前模板用于英文投稿信，未配置中文排版；使用中文需另行配置中文支持 |

常用语法：

```latex
% 百分号后的内容是注释，不会出现在 PDF 中
\textbf{Bold text}       % 粗体
\emph{Italic text}       % 本模板中的强调通常显示为斜体
```

正文中<strong>空一行表示分段</strong>；`\\` 主要用于地址和签名内换行。特殊字符应转义：

| 要显示的字符 | LaTeX 写法 |
| --- | --- |
| `&` | `\&` |
| `%` | `\%` |
| `_` | `\_` |
| `#` | `\#` |
| `$` | `\$` |

如果换行后的文字以方括号开头，请写成 `\\{}[内容]`，避免 LaTeX 将方括号误读为换行间距。

## 本地编译与版式检查

已安装 LaTeX 环境的用户，可在项目根目录执行：

```sh
xelatex -no-shell-escape -halt-on-error main.tex
xelatex -no-shell-escape -halt-on-error main.tex
```

两次编译用于稳定页面定位。所需宏包包括 `graphicx`、`geometry`、`eso-pic`、`tikz`、`fontenc` 和 `lmodern`，无需单独上传字体文件。

两页检查样例可用于调整版式后的复查：

```sh
xelatex -no-shell-escape -halt-on-error -output-directory=tests tests/layout_check.tex
xelatex -no-shell-escape -halt-on-error -output-directory=tests tests/layout_check.tex
```

打开生成的 `tests/layout_check.pdf`：第一页应有信头和背景，第二页应保留背景且不重复信头；同时检查文字、日期和落款是否完整。

当前版本于 <strong>2026-10-28</strong> 完成以下检查：

- XeLaTeX、pdfLaTeX、LuaLaTeX 均成功编译单页模板，最终日志无警告和文字溢出提示。
- XeLaTeX 两页样例编译通过，已检查实际渲染。
- 已检查空收件人、无主题行、空地址和签名回退的显示。
- 两份图片与提供的原压缩包内文件逐字节一致。

