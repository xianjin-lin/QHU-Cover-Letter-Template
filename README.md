# QHU Cover Letter Template

一份适用于**青海大学英文论文投稿信（Cover Letter）**的 LaTeX 模板。填写作者信息、论文标题和正文，即可生成带有青海大学信头和校徽背景的 PDF。

模板将**信函内容**与**版式设置**分开维护：日常投稿主要编辑 `main.tex`；需要改变图片位置、字体大小或落款布局时，再调整 `QHUletter.cls`。

[查看 PDF 示例](main.pdf) · [查看主文件](main.tex) · [查看版式设置](QHUletter.cls)

## 模板特点

- **首页信头**：左侧为青海大学校徽及中英文校名，右侧为单位与地址，中间以黑色竖线分隔。
- **联系信息**：保留原地址，专业/学院名称所在的首行及 `E-mail:` 后的内容默认留空。
- **正文布局**：日期左对齐，正文直接从 `Dear Editors,` 开始，默认不显示单独的收件人栏和 Subject 行。
- **校徽背景**：居中显示淡化校徽，保持原始比例，续页也会显示。
- **右侧落款**：显示结束语、作者姓名及身份信息。
- **字体与图片**：使用 TeX 自带的 Latin Modern 字体，只需两份 PDF 图片，无需上传 Cambria 字体或签名图片。

默认使用 **US Letter 纸张和 12 pt 字号**，也可以改为 A4。

## 文件结构

```text
QHU-Cover-Letter/
├── README.md                 # 本使用说明
├── main.tex                  # 投稿信内容：日常主要修改这个文件
├── QHUletter.cls             # 版式设置：信头、背景、日期、落款等
├── qhu_bg.pdf                # 横向信头：校徽和中英文校名
├── qhu.pdf                   # 校徽：用于页面背景
├── main.pdf                  # 已编译的示例预览
└── tests/
    └── layout_check.tex      # 两页版式检查样例，不是投稿正文
```

**正常编译必需的文件只有四个：**`main.tex`、`QHUletter.cls`、`qhu_bg.pdf` 和 `qhu.pdf`。请将它们放在同一文件夹中，并保持文件名大小写一致。

## 快速开始：使用 Overleaf

适合没有安装本地 LaTeX 环境的新手。

1. 下载仓库 ZIP。在 GitHub 仓库的 **Code** 菜单中选择 **Download ZIP** 即可下载。
2. 在 Overleaf 中创建项目并上传 ZIP；也可以创建空白项目，再上传上述四个必需文件。
3. 将主文件设为 **`main.tex`**，编译器选择 **XeLaTeX**。
4. 先编译一次，确认信头、地址、正文和背景正常显示。
5. 按下一节修改作者信息和正文，替换所有方括号占位内容。
6. 修改完成后编译两次，检查排版，再下载生成的 PDF。

> `main.pdf` 只是已经编译好的示例。修改源码后，需要重新编译才能生成新 PDF；GitHub 上的示例 PDF 也需要自行更新。

## 第一次使用需要修改什么？

### 1. 作者姓名与落款

在 `main.tex` 顶部找到：

```latex
\name{[Corresponding Author]}
\signature{[Corresponding Author]\\Corresponding author}
```

例如，替换为：

```latex
\name{Your Name}
\signature{Your Name\\Corresponding author\\Qinghai University}
```

`\\` 表示换行。`\signature{...}` 控制实际显示的落款；省略这条命令时，模板使用 `\name{...}` 中的姓名。因此，填写姓名时应同时检查这两处。

### 2. 专业、学院和 E-mail

当前地址块为：

```latex
\address{%
  \strut\\ % 专业/学院名称：默认留空
  \textbf{\color{qhublue}Qinghai University}\\
  No.251, Ningda Road,\\
  Chengbei District, Xining,\\
  Qinghai, China, 810016\\
  \textbf{\color{qhublue}E-mail}: % 邮箱内容：默认留空
}
```

暂时不填写专业和邮箱时，**保持原样即可**。`\strut\\` 会为第一行保留空白，避免下一行的校名向上移动。

需要填写专业或学院时，将 `\strut\\` 替换为：

```latex
\textbf{\color{qhublue}Your Department or School}\\
```

需要填写邮箱时，将邮箱行改为：

```latex
\textbf{\color{qhublue}E-mail}: your.name@example.com
```

地址块使用固定位置排版，建议控制在七行以内。增加行数或填写很长的单位名称后，须检查是否与日期或竖线下端重叠。

### 3. 日期与称呼

默认日期随编译当天更新：

```latex
\date{\today}
```

需要固定日期时，直接填写，例如：

```latex
\date{October 28, 2026}
```

称呼在正文开头设置：

```latex
\opening{Dear Editors,}
```

可以根据实际收件人改为 `Dear Editor-in-Chief,` 或具体编辑的称呼。

### 4. 论文信息和正文

从 `\opening{Dear Editors,}` 下方开始编辑：

| 占位内容 | 应填写的内容 |
| --- | --- |
| `[Manuscript Title]` | 论文完整标题 |
| `[Article Type]` | 目标期刊采用的稿件类型名称 |
| `[Journal Name]` | 目标期刊名称 |
| 研究问题与研究空白段落 | 论文所解决的具体问题 |
| 主要贡献与结果段落 | 核心方法、发现或定量结果 |
| 期刊适配段落 | 研究与期刊范围及读者的关联 |
| 投稿声明段落 | 按期刊要求填写并核实的声明 |

**方括号内的文字是写作提示，需要整段替换，不应保留在正式投稿信中。**

投稿声明可能涉及原创性、独家投稿、作者同意、利益冲突或相关稿件。模板没有预设这些情况已经成立，请根据事实及期刊要求填写。

## 如何自行调整版式？

先完成正文，再调整版式。每次只修改一项并重新编译，便于判断效果。

下文所说的**导言区**，指 `main.tex` 中 `\documentclass{...}` 之后、`\begin{document}` 之前的部分。

### 常用调整：修改 main.tex

| 调整项目 | 当前设置 | 修改方式 |
| --- | --- | --- |
| 正文字号 | `12pt` | 修改 `\documentclass[12pt]{QHUletter}`，可选 `10pt`、`11pt` 或 `12pt` |
| 背景不透明度 | `0.15` | 重定义 `\watermarkopacity` |
| 背景校徽宽度 | `105mm` | 重定义 `\watermarkwidth` |
| 纸张与页边距 | US Letter，左右分别为 19.05、22.225 mm | 使用 `\geometry{...}` |
| 段间距 | `0.7em` | 使用 `\setlength{\parskip}{...}` |

**调整背景大小和透明程度：**在导言区加入：

```latex
\renewcommand{\watermarkopacity}{0.08}
\renewcommand{\watermarkwidth}{100mm}
```

不透明度越小，背景越淡；设为 `0` 时背景不可见，但编译仍需要 `qhu.pdf`。只设置宽度可以保持校徽的原始比例。

**改用 A4：**在导言区加入：

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

**调整段间距：**在导言区加入：

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

定位基准均为页面**左上角**。`xshift` 增大表示向右移动；`yshift` 越负，表示越向下移动。

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

正文中**空一行表示分段**；`\\` 主要用于地址和签名内换行。特殊字符应转义：

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

当前版本于 **2026-10-28** 完成以下检查：

- XeLaTeX、pdfLaTeX、LuaLaTeX 均成功编译单页模板，最终日志无警告和文字溢出提示。
- XeLaTeX 两页样例编译通过，已检查实际渲染。
- 已检查空收件人、无主题行、空地址和签名回退的显示。
- 两份图片与提供的原压缩包内文件逐字节一致。

## 上传到 GitHub 时如何组织文件？

将本文件命名为 **`README.md`**，与 `main.tex`、`QHUletter.cls` 和两份图片一起放在仓库根目录，GitHub 就会在仓库首页展示说明。

建议同时上传 `main.pdf`，方便读者先查看效果。除 ZIP 外，将解压后的文件一并上传，读者就能直接在仓库中浏览和编辑模板源码。

编译产生的 `.aux`、`.log`、`.out` 等中间文件通常不需要上传。更新示例时，请上传重新编译后的 `main.pdf`。

## 来源说明

本模板由提供的 BNU/HIT/NJU 信函模板改编，类文件中保留了原始作者归属说明。它是个人投稿使用的模板，**并非青海大学发布的官方标准信函模板**。
