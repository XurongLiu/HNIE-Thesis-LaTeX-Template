\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hnie-thesis}[2026/05/01 HNIE thesis template for Overleaf]

\LoadClass[UTF8,zihao=false,fontset=none,oneside,openany,12pt,a4paper]{ctexbook}

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{hnie-thesis}{This template must be compiled with XeLaTeX}{Set the Overleaf compiler to XeLaTeX.}
\fi

\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{geometry}
\RequirePackage{xparse}
\RequirePackage{keyval}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{caption}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{tikz}

\defaultfontfeatures{Ligatures=TeX}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=black,
  bookmarksnumbered=true,
  pdfstartview=FitH
}
\definecolor{hniered}{RGB}{255,0,0}
\definecolor{hnieblue}{RGB}{0,112,192}

\geometry{
  a4paper,
  left=2.5cm,
  right=2.5cm,
  top=2.5cm,
  bottom=2.5cm,
  headheight=14pt,
  headsep=0.72cm,
  footskip=1.75cm
}

\makeatletter
\newif\ifhnie@uploadedfonts
\IfFileExists{fonts/simsun.ttc}{\hnie@uploadedfontstrue}{\hnie@uploadedfontsfalse}

\ifhnie@uploadedfonts
  \setmainfont[
    Path=fonts/,
    UprightFont=times.ttf,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf
  ]{times.ttf}
  \setsansfont[
    Path=fonts/,
    UprightFont=times.ttf,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf
  ]{times.ttf}
  \setCJKmainfont[Path=fonts/,AutoFakeBold=2.5,AutoFakeSlant=0.2]{simsun.ttc}
  \setCJKfamilyfont{song}[Path=fonts/,AutoFakeBold=2.5,AutoFakeSlant=0.2]{simsun.ttc}
  \setCJKfamilyfont{hei}[Path=fonts/,AutoFakeBold=2.5]{simhei.ttf}
  \setCJKfamilyfont{fang}[Path=fonts/,AutoFakeBold=2.5]{simfang.ttf}
  \setCJKfamilyfont{kai}[Path=fonts/,AutoFakeBold=2.5]{simkai.ttf}
\else
  \setmainfont{TeX Gyre Termes}
  \setsansfont{TeX Gyre Termes}
  \setCJKmainfont[AutoFakeBold=2.5,AutoFakeSlant=0.2]{FandolSong-Regular}
  \setCJKfamilyfont{song}[AutoFakeBold=2.5,AutoFakeSlant=0.2]{FandolSong-Regular}
  \setCJKfamilyfont{hei}[AutoFakeBold=2.5]{FandolHei-Regular}
  \setCJKfamilyfont{fang}[AutoFakeBold=2.5]{FandolFang-Regular}
  \setCJKfamilyfont{kai}[AutoFakeBold=2.5]{FandolKai-Regular}
\fi

\providecommand{\songti}{}
\providecommand{\heiti}{}
\providecommand{\fangsong}{}
\providecommand{\kaishu}{}
\renewcommand{\songti}{\CJKfamily{song}}
\renewcommand{\heiti}{\CJKfamily{hei}}
\renewcommand{\fangsong}{\CJKfamily{fang}}
\renewcommand{\kaishu}{\CJKfamily{kai}}

\renewcommand\normalsize{%
  \@setfontsize\normalsize{12pt}{22pt}%
  \abovedisplayskip 6pt plus 2pt minus 2pt%
  \belowdisplayskip \abovedisplayskip%
  \abovedisplayshortskip 0pt plus 2pt%
  \belowdisplayshortskip 4pt plus 2pt minus 2pt%
}
\normalsize
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}

\newcommand\hnie@title{XXXXXXXXXXXXX（论文题目）}
\newcommand\hnie@entitle{The Design of XXXX}
\newcommand\hnie@college{XX学院}
\newcommand\hnie@major{XX专业}
\newcommand\hnie@class{XX班}
\newcommand\hnie@studentid{XXXXXXXXXXXX}
\newcommand\hnie@author{XXX}
\newcommand\hnie@supervisor{XXX}
\newcommand\hnie@date{20XX年XX月XX日}
\newcommand\hnie@keywords{}
\newcommand\hnie@enkeywords{}
\newcommand\hnie@headtitle{XXXXXXXXXXXXX（论文题目）}
\newcommand\hnie@covertitleone{XXXXXXXXXXXXX（论文题目）}
\newcommand\hnie@covertitletwo{}
\def\hnie@splitcoversecond#1\\\@nil{\def\hnie@covertitletwo{#1}}
\def\hnie@splitcovertitle#1\\#2\@nil{%
  \def\hnie@covertitleone{#1}%
  \def\hnie@coverrest{#2}%
  \ifx\hnie@coverrest\@empty
    \def\hnie@covertitletwo{}%
  \else
    \hnie@splitcoversecond#2\@nil
  \fi
}
\newcommand\hnie@settitle[1]{%
  \renewcommand\hnie@title{#1}%
  \expandafter\hnie@splitcovertitle#1\\\@nil
  \begingroup
    \def\\{}%
    \xdef\hnie@gtemp{#1}%
  \endgroup
  \let\hnie@headtitle\hnie@gtemp
}

\define@key{hnie}{title}{\hnie@settitle{#1}}
\define@key{hnie}{english-title}{\renewcommand\hnie@entitle{#1}}
\define@key{hnie}{college}{\renewcommand\hnie@college{#1}}
\define@key{hnie}{major}{\renewcommand\hnie@major{#1}}
\define@key{hnie}{class}{\renewcommand\hnie@class{#1}}
\define@key{hnie}{student-id}{\renewcommand\hnie@studentid{#1}}
\define@key{hnie}{author}{\renewcommand\hnie@author{#1}}
\define@key{hnie}{supervisor}{\renewcommand\hnie@supervisor{#1}}
\define@key{hnie}{date}{\renewcommand\hnie@date{#1}}
\NewDocumentCommand{\hniesetup}{m}{\setkeys{hnie}{#1}}

\fancypagestyle{hnie}{%
  \fancyhf{}%
  \fancyhead[C]{\songti\fontsize{10.5pt}{12pt}\selectfont\hnie@headtitle}%
  \fancyfoot[C]{\normalfont\fontsize{9pt}{12pt}\selectfont\thepage}%
  \renewcommand{\headrulewidth}{0.75pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[C]{\songti\fontsize{10.5pt}{12pt}\selectfont\hnie@headtitle}%
  \fancyfoot[C]{\normalfont\fontsize{9pt}{12pt}\selectfont\thepage}%
  \renewcommand{\headrulewidth}{0.75pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{empty}

\ctexset{
  chapter = {
    name = {第,章},
    number = \arabic{chapter},
    aftername = ,
    format = \centering\heiti\fontsize{18pt}{22pt}\selectfont,
    beforeskip = 0pt,
    afterskip = 0pt,
    fixskip = true
  },
  section = {
    format = \raggedright\heiti\fontsize{15pt}{22pt}\selectfont,
    aftername = ,
    beforeskip = 16.65pt,
    afterskip = 16.65pt,
    fixskip = true
  },
  subsection = {
    format = \raggedright\songti\bfseries\fontsize{12pt}{22pt}\selectfont,
    aftername = \quad,
    beforeskip = 8.3pt,
    afterskip = 8.3pt,
    fixskip = true
  },
  contentsname = {\textbf{目~~录}}
}

% 章标题页顶端位置微调：负值表示标题整体上移。
\newlength{\hnie@chaptertopadjust}
\setlength{\hnie@chaptertopadjust}{-1.0cm}

% 章节编号与标题之间的距离。
% 0.7em 约等于两个英文半角空格；如需两个汉字宽度，可改为 \hspace{2em}。
\DeclareRobustCommand{\hnieNumberTitleGap}{\texorpdfstring{\hspace{0.7em}}{ }}

\NewDocumentCommand{\hnie@chaptertitle}{m}{%
  \vspace*{\hnie@chaptertopadjust}%
  {\centering\heiti\fontsize{18pt}{22pt}\selectfont #1\par}%
  \vspace{0pt}%
  \normalsize
  \setlength{\baselineskip}{22pt}%
}

\RenewDocumentCommand{\chapter}{s o m}{%
  \cleardoublepage
  \thispagestyle{hnie}%
  \IfBooleanTF{#1}{%
    \phantomsection
    \markboth{#3}{#3}%
    \hnie@chaptertitle{#3}%
  }{%
    \refstepcounter{chapter}%
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \setcounter{figure}{0}%
    \setcounter{table}{0}%
    \setcounter{equation}{0}%
    \IfNoValueTF{#2}{%
      \addcontentsline{toc}{chapter}{第\thechapter 章\hnieNumberTitleGap #3}%
      \markboth{第\thechapter 章\hnieNumberTitleGap #3}{第\thechapter 章\hnieNumberTitleGap #3}%
    }{%
      \addcontentsline{toc}{chapter}{第\thechapter 章\hnieNumberTitleGap #2}%
      \markboth{第\thechapter 章\hnieNumberTitleGap #2}{第\thechapter 章\hnieNumberTitleGap #2}%
    }%
    \hnie@chaptertitle{第\thechapter 章\hnieNumberTitleGap #3}%
  }%
}

\RenewDocumentCommand{\section}{s o m}{%
  \par\addvspace{16.65pt}%
  \IfBooleanTF{#1}{%
    \phantomsection
    \IfNoValueTF{#2}{\addcontentsline{toc}{section}{#3}}{\addcontentsline{toc}{section}{#2}}%
    \noindent{\heiti\fontsize{15pt}{22pt}\selectfont #3\par}%
  }{%
    \refstepcounter{section}%
    \setcounter{subsection}{0}%
    \IfNoValueTF{#2}{%
      \addcontentsline{toc}{section}{\thesection\hnieNumberTitleGap #3}%
    }{%
      \addcontentsline{toc}{section}{\thesection\hnieNumberTitleGap #2}%
    }%
    \noindent{\heiti\fontsize{15pt}{22pt}\selectfont \thesection\hnieNumberTitleGap #3\par}%
  }%
  \nobreak\vspace{16.65pt}%
  \normalsize
  \setlength{\baselineskip}{22pt}%
}

\RenewDocumentCommand{\subsection}{s o m}{%
  \par\addvspace{8.3pt}%
  \IfBooleanTF{#1}{%
    \phantomsection
    \IfNoValueTF{#2}{\addcontentsline{toc}{subsection}{#3}}{\addcontentsline{toc}{subsection}{#2}}%
    \noindent{\songti\bfseries\fontsize{12pt}{22pt}\selectfont #3\par}%
  }{%
    \refstepcounter{subsection}%
    \IfNoValueTF{#2}{%
      \addcontentsline{toc}{subsection}{\thesubsection\hnieNumberTitleGap #3}%
    }{%
      \addcontentsline{toc}{subsection}{\thesubsection\hnieNumberTitleGap #2}%
    }%
    \noindent{\songti\bfseries\fontsize{12pt}{22pt}\selectfont \thesubsection\hnieNumberTitleGap #3\par}%
  }%
  \nobreak\vspace{8.3pt}%
  \normalsize
  \setlength{\baselineskip}{22pt}%
}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
% 目录标题与条目格式设置。
% 说明：这里不再依赖 tocloft 的默认 \tableofcontents 标题布局，
% 而是后面在 \hnie@printtoc 中手动输出“目 录”，这样可以真正控制其到页面顶端的距离。
\renewcommand{\cfttoctitlefont}{\hfill\heiti\fontsize{18pt}{22pt}\selectfont}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{12pt}

% 目录标题页顶端位置微调：负值表示“目 录”整体上移。
\newlength{\hnie@toctitletopadjust}
\setlength{\hnie@toctitletopadjust}{-0.75cm}

% 目录条目局部行距设置。
% 12pt/14.4pt 是 LaTeX 常规单倍/1.2 倍基线距；若按 Word 视觉希望在此基础上再放大到 1.2 倍，可用 17.28pt。
\newcommand{\hnie@tocentryfontsize}{12pt}
\newcommand{\hnie@tocentrybaselineskip}{17.28pt}
\newcommand{\hnie@tocentryfont}{\fontsize{\hnie@tocentryfontsize}{\hnie@tocentrybaselineskip}\selectfont}

% Abstract text line spacing.
% 12pt/17.28pt keeps the abstract body consistent with the adjusted 1.2 line spacing used in the TOC.
\newcommand{\hnie@abstractfontsize}{12pt}
\newcommand{\hnie@abstractbaselineskip}{22pt}
\newcommand{\hnie@cnabstractfont}{\songti\fontsize{\hnie@abstractfontsize}{\hnie@abstractbaselineskip}\selectfont\setlength{\baselineskip}{\hnie@abstractbaselineskip}}
\newcommand{\hnie@enabstractfont}{\normalfont\fontsize{\hnie@abstractfontsize}{\hnie@abstractbaselineskip}\selectfont\setlength{\baselineskip}{\hnie@abstractbaselineskip}}
\renewcommand{\cftchapfont}{\heiti\hnie@tocentryfont}
\renewcommand{\cftchappagefont}{\normalfont\hnie@tocentryfont}
\renewcommand{\cftsecfont}{\songti\hnie@tocentryfont}
\renewcommand{\cftsecpagefont}{\normalfont\hnie@tocentryfont}
\renewcommand{\cftsubsecfont}{\songti\hnie@tocentryfont}
\renewcommand{\cftsubsecpagefont}{\normalfont\hnie@tocentryfont}

% 数值越小，目录标题与页码之间的点线越密集。
\renewcommand{\cftdotsep}{0.6}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}

% 压缩目录不同条目之间的额外垂直间距。
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftparskip}{0pt}
\setlength{\cftchapindent}{0pt}
\setlength{\cftsecindent}{2em}
\setlength{\cftsubsecindent}{3.5em}

% 自定义目录条目输出：
% 1) 每一条强制使用 12pt/14.4pt 的单倍行距；
% 2) 取消 chapter/section/subsection 默认的额外行前间距；
% 3) 点线直接延伸到页码数字前，而不是停在固定页码盒左侧。
\newcommand{\hnie@tocdots}{%
  \leaders\hbox{$\m@th\mkern \cftdotsep mu\hbox{.}\mkern \cftdotsep mu$}\hfill
}
\newcommand{\hnie@tocline}[5]{%
  \par\vskip 0pt%
  \begingroup
    \parindent=0pt\parskip=0pt\relax
    \lineskip=0pt\relax
    \hnie@tocentryfont
    \setlength{\baselineskip}{\hnie@tocentrybaselineskip}%
    \noindent\hspace*{#1}%
    \hbox to \dimexpr\linewidth-#1\relax{%
      {#2#4}\nobreak
      \hnie@tocdots\nobreak
      {#3#5}%
    }%
    \par
  \endgroup
}
\renewcommand*{\l@chapter}[2]{\hnie@tocline{\cftchapindent}{\cftchapfont}{\cftchappagefont}{#1}{#2}}
\renewcommand*{\l@section}[2]{\hnie@tocline{\cftsecindent}{\cftsecfont}{\cftsecpagefont}{#1}{#2}}
\renewcommand*{\l@subsection}[2]{\hnie@tocline{\cftsubsecindent}{\cftsubsecfont}{\cftsubsecpagefont}{#1}{#2}}

% 手动输出目录页，避免默认 \tableofcontents 自动产生过大的标题上方空白。
\newcommand{\hnie@printtoc}{%
  \begingroup
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{0pt}%
    \linespread{1}\selectfont
    \vspace*{\hnie@toctitletopadjust}%
    {\centering\heiti\fontsize{18pt}{22pt}\selectfont 目~~录\par}%
    \vspace{12pt}%
    {\hnie@tocentryfont\@starttoc{toc}}%
  \endgroup
}
\renewcommand{\tableofcontents}{\hnie@printtoc}

\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\numberwithin{equation}{chapter}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\DeclareCaptionFont{hniecaption}{\heiti\fontsize{10.5pt}{20pt}\selectfont}
\captionsetup{
  font=hniecaption,
  labelfont=hniecaption,
  textfont=hniecaption,
  labelsep=space,
  justification=centering,
  singlelinecheck=false,
  skip=0pt
}
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}

\NewDocumentCommand{\hnie@absnode}{O{}m m m}{%
  \node[anchor=north west,inner sep=0pt,#1] at ([xshift=#2pt,yshift=-#3pt]current page.north west) {#4};%
}

\NewDocumentCommand{\hnie@abscenter}{O{}m m m}{%
  \node[anchor=north,inner sep=0pt,#1] at ([xshift=#2pt,yshift=-#3pt]current page.north west) {#4};%
}

\NewDocumentCommand{\hnie@covertitlenode}{m m}{%
  \node[
    anchor=north,
    inner sep=0pt,
    text width=327pt,
    align=center
  ] at ([xshift=334.3pt,yshift=-#1pt]current page.north west)
    {\kaishu\fontsize{16pt}{36pt}\selectfont #2};%
}
\NewDocumentCommand{\hniecovertitlenodes}{}{%
  \hnie@covertitlenode{349.5}{\hnie@covertitleone}%
  \ifx\hnie@covertitletwo\@empty\else
    \hnie@covertitlenode{385.5}{\hnie@covertitletwo}%
  \fi
}

\NewDocumentCommand{\makehnieinstructions}{}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{9pt}
    {\heiti\fontsize{16pt}{20pt}\selectfont 湖南工程学院非卓越理工科毕业设计（论文）排版及打印说明\par}
    \vspace{17pt}
    {\heiti\fontsize{16pt}{20pt}\selectfont （不用于装订）\par}
  \end{center}
  \vspace{8pt}
  {\songti\fontsize{12pt}{20pt}\selectfont
  \noindent{\bfseries 1、纸张}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 论文必须使用 A4 纸}\par
  {\bfseries 2、页边距、字体、行距}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 左 2.5 厘米、右 2.5 厘米、上边距 2.5 厘米、下边距 2.5 厘米；}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 正文字体宋体小四，数字、英文 Times New Roman 小四号，首行缩进 \textbf{2} 字符，正文固定行距 22}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 磅。}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 图片使用单倍行距，居中放置，全文图片尽量保持宽度一致，}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 表格宽度通篇一致，表内文字行距 1.5 倍，尽量居中，中文用五号宋体字，英文数字用五号 Times}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont New Roman 字，表格上下边线 1.5 磅，不要左右边线，中间线 0.5 磅，文字环绕方式尽量选无，}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 表格过长而断页，需进行标题行重复。}\par
  {\bfseries 3、页眉}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 从目录页开始有页眉，页眉为论文标题，位置居中 \textbf{5} 号宋体、Times New Roman}\par
  {\bfseries 4、摘要}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 中英文对照}\par
  {\bfseries 5、页码}\par
  \hspace*{1em}{页码数字位于每页下方居中，目录部分使用小 5 号 Times New Roman 字体中的 i ii iii}\par
  iv ........\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 摘要部分采用小 5 号 Times New Roman 字体中的 I II III IV ........,英文摘要页码紧跟中文摘要不重}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 新编号。}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 从第一章开始使用小 5 号 Times New Roman 字体中的 1 2 3 4 ..........。}\par
  {\bfseries 6、目录}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 目录只需列出一、二、三级标题，不必列出四级等更下级标题}\par
  \hspace*{1em}{\fontsize{10.5pt}{20pt}\selectfont 目录从“目录页”后开始编，目录的页码应与实际页码一致}\par
  {\color{hniered}\bfseries 7、标题的使用：}\par
  {\color{hniered}\hspace*{2em}一级标题：第 1 章 绪论（第 1 章与绪论之间有个空格）}\par
  {\color{hniered}\hspace*{2em}二级标题：1.1 XXXXX（1.1 与内容之间有个空格）}\par
  {\color{hniered}\hspace*{2em}三级标题：1.1.1 xxxx（1.1.1 与内容之间有个空格）}\par
  {\bfseries 8、审阅及打印}\par
  先将论文导成 PDF 文件再交于老师审阅或打印，可以避免出现因换电脑而产生的的跳\par
  页、错页、格式变了等情况。论文采用单页打印（删除掉模板中交代的注意事项）\par
  {\color{hniered}\heiti 具体要求请参考下面的论文}\par
  \begin{center}
    {\color{hniered}\heiti 文章中所有英文及数字使用罗马体 Times New Roman}
  \end{center}
  }
  \clearpage
}

\NewDocumentCommand{\makehniecover}{s}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \hnie@absnode{151.7}{88.8}{\includegraphics[width=63.8pt,height=63.85pt]{figures/school/school-image-1.png}}
    \hnie@absnode{221.5}{101.65}{\includegraphics[width=221.9pt,height=51pt]{figures/school/school-image-2.png}}
    \hnie@abscenter{297.66}{194.5}{\heiti\fontsize{36pt}{54pt}\selectfont 毕~业~设~计（论~文）}
    \hnie@absnode{106.8}{349.5}{\heiti\fontsize{16pt}{36pt}\selectfont \textbf{题\quad 目：}}
    \hniecovertitlenodes
    \draw[line width=0.4pt] ([xshift=170.8pt,yshift=-369pt]current page.north west) -- ([xshift=497.8pt,yshift=-369pt]current page.north west);
    \draw[line width=0.4pt] ([xshift=170.8pt,yshift=-405pt]current page.north west) -- ([xshift=497.8pt,yshift=-405pt]current page.north west);
    \hnie@absnode{106.8}{493.5}{\heiti\fontsize{16pt}{36pt}\selectfont \textbf{学院：}}
    \draw[line width=0.4pt] ([xshift=154.9pt,yshift=-513.5pt]current page.north west) -- ([xshift=493pt,yshift=-513.5pt]current page.north west);
    \hnie@abscenter{340}{493.5}{\kaishu\fontsize{16pt}{36pt}\selectfont \hnie@college}
    \hnie@absnode{106.8}{529.5}{\heiti\fontsize{16pt}{36pt}\selectfont \textbf{专业：}}
    \draw[line width=0.4pt] ([xshift=154.9pt,yshift=-549.5pt]current page.north west) -- ([xshift=493pt,yshift=-549.5pt]current page.north west);
    \hnie@abscenter{340}{529.5}{\kaishu\fontsize{16pt}{36pt}\selectfont \hnie@major}
    \hnie@absnode{106.8}{565.5}{\heiti\fontsize{16pt}{36pt}\selectfont \textbf{班级：}}
    \draw[line width=0.4pt] ([xshift=154.9pt,yshift=-585.5pt]current page.north west) -- ([xshift=283pt,yshift=-585.5pt]current page.north west);
    \hnie@abscenter{219}{565.5}{\kaishu\fontsize{16pt}{36pt}\selectfont \hnie@class}
    \hnie@absnode{300.5}{565.5}{\heiti\fontsize{16pt}{36pt}\selectfont \textbf{学号：}}
    \draw[line width=0.4pt] ([xshift=348.5pt,yshift=-585.5pt]current page.north west) -- ([xshift=493pt,yshift=-585.5pt]current page.north west);
    \hnie@abscenter{420.8}{565.5}{\kaishu\fontsize{16pt}{36pt}\selectfont \hnie@studentid}
    \hnie@absnode{106.8}{601.5}{\heiti\fontsize{16pt}{36pt}\selectfont \textbf{学生姓名：}}
    \draw[line width=0.4pt] ([xshift=187.1pt,yshift=-621.5pt]current page.north west) -- ([xshift=493pt,yshift=-621.5pt]current page.north west);
    \hnie@abscenter{340}{601.5}{\kaishu\fontsize{16pt}{36pt}\selectfont \hnie@author}
    \hnie@absnode{106.8}{637.5}{\heiti\fontsize{16pt}{36pt}\selectfont \textbf{导师姓名：}}
    \draw[line width=0.4pt] ([xshift=187.1pt,yshift=-657.5pt]current page.north west) -- ([xshift=493pt,yshift=-657.5pt]current page.north west);
    \hnie@abscenter{340}{637.5}{\kaishu\fontsize{16pt}{36pt}\selectfont \hnie@supervisor}
    \hnie@absnode{106.8}{673.5}{\heiti\fontsize{16pt}{36pt}\selectfont \textbf{完成日期：}}
    \draw[line width=0.4pt] ([xshift=187.1pt,yshift=-693.5pt]current page.north west) -- ([xshift=493pt,yshift=-693.5pt]current page.north west);
    \hnie@abscenter{340}{673.5}{\kaishu\fontsize{16pt}{36pt}\selectfont \hnie@date}
  \end{tikzpicture}
  \null
  \clearpage
}

\NewDocumentCommand{\makehnieintegrity}{}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{0.6cm}
    {\heiti\fontsize{18pt}{22pt}\selectfont 诚~~信~~声~~明\par}
  \end{center}
  \vspace{1.2cm}
  {\fangsong\fontsize{15pt}{35pt}\selectfont
  \setlength{\parindent}{2.5em}

  
  \textbf{本人声明：}

  \textbf{1、本人所呈交的毕业设计（论文）是在老师指导下进行的研究工作及取得的研究成果；}

  \textbf{2、据查证，除了文中特别加以标注和致谢的地方外，毕业设计（论文）中不包含其他人已经公开发表过的研究成果，也不包含为获得其他教育机构的学位而使用过的材料；}

  \textbf{3、我承诺，本人提交的毕业设计（论文）中的所有内容均真实、可信。}

  \vspace{1.8cm}
  \textbf{作者签名：\makebox[4.6cm][c]{}\quad 日期：\makebox[1.0cm][c]{}年\makebox[0.8cm][c]{}月\makebox[0.8cm][c]{}日}

  \vspace{2.6cm}
%  \textcolor{hniered}{此页内容请勿改动，只要填写签名及日期}
  }
  \clearpage
}

\NewDocumentCommand{\hniemaketoc}{}{%
  \cleardoublepage
  \pagestyle{hnie}
  \thispagestyle{hnie}%
  \pagenumbering{roman}
  \setcounter{page}{1}
  \hnie@printtoc
  \clearpage
}

\NewDocumentCommand{\hniefronttitle}{m}{%
  \begin{center}
    {\heiti\fontsize{18pt}{22pt}\selectfont #1\par}
  \end{center}
  \vspace{16.65pt}
}

\NewDocumentCommand{\hniebeginabstracts}{}{%
  \cleardoublepage
  \pagestyle{hnie}
  \pagenumbering{Roman}
  \setcounter{page}{1}
}

\NewDocumentEnvironment{cnabstract}{}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{摘要}
  \hniefronttitle{\hnie@title}
  \hnie@cnabstractfont
  \noindent{\heiti 摘要：}\ignorespaces%
}{\par\clearpage}

\NewDocumentEnvironment{enabstract}{}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  \hniefronttitle{\normalfont\bfseries\hnie@entitle}
  \hnie@enabstractfont
  \noindent{\normalfont\bfseries Abstract: }\ignorespaces%
}{\par\clearpage}

\NewDocumentCommand{\hniekeywords}{m}{%
  \par\vspace{\hnie@abstractbaselineskip}\noindent{\hnie@cnabstractfont{\heiti 关键词：}{\songti #1}}\par%
}
\NewDocumentCommand{\hnieenkeywords}{m}{%
  \par\vspace{\hnie@abstractbaselineskip}\noindent{\hnie@enabstractfont{\normalfont\bfseries Keywords: }#1}\par%
}

\NewDocumentCommand{\hniebodymatter}{}{%
  \cleardoublepage
  \pagestyle{hnie}
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \normalsize
  \setlength{\baselineskip}{22pt}
}

\NewDocumentCommand{\hniechapterstar}{O{}m}{%
  \cleardoublepage
  \thispagestyle{hnie}%
  \phantomsection
  \def\hnie@tocname{#1}%
  \ifx\hnie@tocname\@empty
    \addcontentsline{toc}{chapter}{#2}%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \hnie@chaptertitle{#2}%
}

\NewDocumentCommand{\hnieconclusiontitle}{}{%
  \cleardoublepage
  \thispagestyle{hnie}%
  \phantomsection
  \addcontentsline{toc}{chapter}{结论}%
  \vspace*{\hnie@chaptertopadjust}%
  {\centering\heiti\fontsize{18pt}{22pt}\selectfont 结\quad 论\par}%
  \vspace{16.65pt}%
  \normalsize
  \setlength{\baselineskip}{22pt}%
}

\NewDocumentEnvironment{hnieconclusion}{}{%
  \hnieconclusiontitle
}{}

\NewDocumentEnvironment{hnieacknowledgements}{}{%
  \hniechapterstar[致谢]{致\quad 谢}
}{}

\NewDocumentCommand{\hnieprintbibliography}{m}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{参考文献}
  \bibliographystyle{gbt7714-numerical}
  \bibliography{#1}
}

\NewDocumentCommand{\hniefignote}{m}{%
  \begin{center}
    {\songti\fontsize{10.5pt}{19pt}\selectfont #1}
  \end{center}
}

\renewcommand{\bibname}{参考文献}
\makeatother
