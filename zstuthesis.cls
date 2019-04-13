%# -*- coding: utf-8-unix -*-
%==================================================
%% zstuthesis.cls for ZSTU Master Thesis
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{zstuthesis}[2019/04/13 v1.0.0 Zhejiang Sci-Tech University Template]
\def\version{v1.0.0}
\newif\ifzstu@coursepaper\zstu@coursepaperfalse
\newif\ifzstu@bachelor\zstu@bachelorfalse
\newif\ifzstu@master\zstu@masterfalse
\newif\ifzstu@doctor\zstu@doctorfalse
\newif\ifzstu@english\zstu@englishfalse
\newif\ifzstu@review\zstu@reviewfalse
\newif\ifzstu@submit\zstu@submitfalse
\DeclareOption{coursepaper}{\zstu@coursepapertrue}
\DeclareOption{bachelor}{\zstu@bachelortrue}
\DeclareOption{master}{\zstu@mastertrue}
\DeclareOption{doctor}{\zstu@doctortrue}
\DeclareOption{english}{\zstu@englishtrue}
\DeclareOption{review}{\zstu@reviewtrue}
\DeclareOption{submit}{\zstu@submittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\ifzstu@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\else
  \PassOptionsToClass{scheme=chinese}{ctexbook}
\fi
\ifzstu@coursepaper
  \PassOptionsToClass{zihao=-4}{ctexbook}
\else
  \ifzstu@bachelor
    \PassOptionsToClass{zihao=5}{ctexbook}
  \else
    \PassOptionsToClass{zihao=-4}{ctexbook}
    \ifzstu@master\relax\else
      \ifzstu@doctor\relax\else
        \ClassError{zstuthesis}%
          {You have to specify one of thesis options: coursepaper, bachelor, master or doctor.}{}
      \fi
    \fi
  \fi
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8]{ctexbook}

%% zstuthesis.cls segments
% 0. Import zstuthesis.cfg & define variables
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands.
% 3. Configure the imported packages, also extend LaTeX command in zstuthesis
% 4. Draw the zstuthesis

%==========
% Segment 0. Import zstuthesis.cfg & define variables
%==========

\AtEndOfClass{\input{zstuthesis.cfg}}

% Chinese variables
\newcommand\classification[1]{\def\zstu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\zstu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\zstu@value@confidential{#1}}
\newcommand\school[1]{\def\zstu@value@school{#1}}
\newcommand\chinesedegree[1]{\def\zstu@value@chinesedegree{#1}}
\renewcommand\title[1]{%
  \def\zstu@value@chinesetitle{\zstu@title@handler{#1}}%
  \def\zstu@value@chinesecovertitle{\zstu@covertitle@handler{#1}}}
\renewcommand\author[1]{\def\zstu@value@author{#1}}
\newcommand\advisor[1]{\def\zstu@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\zstu@value@coadvisor{#1}}
\newcommand\major[1]{\def\zstu@value@major{#1}}
\newcommand\coursename[1]{\def\zstu@value@coursename{#1}}
\newcommand\submitdate[1]{\def\zstu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\zstu@value@defenddate{#1}}
\newcommand\institute[1]{\def\zstu@value@institute{#1}}
\newcommand\chairman[1]{\def\zstu@value@chairman{#1}}
\newcommand\keywords[1]{\def\zstu@value@keywords{#1}}
\newcommand\cnacademicdegree[1]{\def\zstu@value@cnacademicdegree{#1}}

% English variables
\newcommand\englishtitle[1]{\def\zstu@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\zstu@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\zstu@value@englishadvisor{#1}}
\newcommand\englishcoadvisor[1]{\def\zstu@value@englishcoadvisor{#1}}
\newcommand\englishschool[1]{\def\zstu@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\zstu@value@englishinstitute{#1}}
\newcommand\englishinstitutemaster[1]{\def\zstu@value@englishinstitutemaster{#1}}
\newcommand\englishdate[1]{\def\zstu@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\zstu@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\zstu@value@englishmajor{#1}}
\newcommand\englishstudentid[1]{\def\zstu@value@englishstudentid{#1}}
\newcommand\englishkeywords[1]{\def\zstu@value@englishkeywords{#1}}
\newcommand\enacademicdegree[1]{\def\zstu@value@enacademicdegree{#1}}

%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage{etoolbox}
\RequirePackage{geometry} %设置版面
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage[titles]{tocloft}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage[opentype]{sourcecodepro}
\RequirePackage{upgreek}
\RequirePackage{wasysym}
\RequirePackage{anyfontsize}
\RequirePackage{metalogo,doc}
\RequirePackage{array}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{textcomp}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{siunitx}
\RequirePackage{xparse}
\RequirePackage{tikz}
\RequirePackage{makecell}
\usetikzlibrary{shapes.geometric, arrows}

% Make hyperref to set PDF metadata (author, title, subject, keywords)
\AtBeginDocument{
  \hypersetup{
    bookmarksnumbered,
    colorlinks,
    urlcolor=black,
    linkcolor=black,
    citecolor=black,
    plainpages=false,
    pdfstartview=FitH,
    pdfauthor={\zstu@value@author},
    pdftitle={\zstu@value@chinesetitle},
    pdfsubject={\zstu@value@school\zstu@value@chinesedegree\zstu@label@thesis},
    pdfkeywords={\zstu@value@keywords},
  }
}
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{%
  \let\\\@empty%
  \let\zstu@title@handler\@empty}

%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========
\geometry{
  paper      = a4paper,
  top        = 3.5cm,
  bottom     = 4.0cm,
  left       = 3.3cm,
  right      = 2.8cm,
}
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
\renewcommand{\cftchapfont}{\bfseries\heiti}  % 目录章节标题（黑体加粗）

% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% E-mail
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

% upper math letter
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

% patch commands
\patchcmd\cleardoublepage
  {\newpage}
  {\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter
  {\thispagestyle{\CTEX@chapter@pagestyle}}
  {}{}{}
\patchcmd\@chapter
  {\if@twocolumn}
  {\addtocontents{loa}{\protect\addvspace{10\p@}}%
   \if@twocolumn}
  {}{}
\patchcmd\tableofcontents
  {\chapter}
  {\cleardoublepage%
   \pdfbookmark[0]{\contentsname}{toc}%
   \chapter}
  {}{}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX}

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in zstuthesis
%==========

%% 行距缩放因子
\linespread{1.3}

%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\ctexset{%
  contentsname   = \zstu@contentsname,
  listfigurename = \zstu@listfigurename,
  listtablename  = \zstu@listtablename,
  autoindent     = true,
  chapter={%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = {15\p@},
    afterskip    = {12\p@},
  },
  section={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsection={%
    format       = \zihao{-4}\normalfont,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsubsection={%
    format       = \normalsize\normalfont,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true,
}

\floatname{algorithm}{\zstu@label@algo}
\renewcommand{\algorithmicrequire}{\textbf{\zstu@algorithmicrequire}}
\renewcommand{\algorithmicensure}{\textbf{\zstu@algorithmicensure}}
\renewcommand{\listalgorithmname}{\zstu@listalgorithmname}
\renewcommand{\lstlistingname}{\zstu@value@listingname}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in caption and bicaption pacakge
\DeclareCaptionFont{kaishu}{\kaishu}
\captionsetup{format=plain,labelformat=simple,labelsep=space,justification=centering,font={small,kaishu}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\captionsetup[sub]{font=footnotesize}

\DeclareCaptionOption{bi-first}[]{%
    \def\tablename{\zstu@tablename}
    \def\figurename{\zstu@figurename}
}
\DeclareCaptionOption{bi-second}[]{%
    \def\tablename{Table}
    \def\figurename{Figure}
}

% Set fontnote font size in threeparttable
\appto\TPTnoteSettings{\footnotesize}

% Ref https://github.com/zstug/ZSTUThesis/issues/186
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法、代码的编号为"3-1"的形式，即分隔符由.变为短杠
\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter--\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter--\arabic{figure}}
  \renewcommand\p@subfigure{\thefigure}
  \renewcommand{\thetable}{\thechapter--\arabic{table}}
  \renewcommand{\thealgorithm}{\thechapter--\arabic{algorithm}}
  \renewcommand{\thelstlisting}{\thechapter--\arabic{lstlisting}}
}

% 图表索引前加下“图”，“表”关键词
\ifzstu@master
  \renewcommand*\cftfigpresnum{\zstu@figurename~}
  % \newlength{\zstu@cftfignumwidth@tmp}
  % \settowidth{\zstu@cftfignumwidth@tmp}{\cftfigpresnum}
  % \addtolength{\cftfignumwidth}{\zstu@cftfignumwidth@tmp}
  \renewcommand{\cftfigaftersnumb}{\enspace~}
  \renewcommand*\cfttabpresnum{\zstu@tablename~}
  % \newlength{\zstu@cfttabnumwidth@tmp}
  % \settowidth{\zstu@cfttabnumwidth@tmp}{\cfttabpresnum}
  % \addtolength{\cfttabnumwidth}{\zstu@cfttabnumwidth@tmp}
  \renewcommand{\cfttabaftersnumb}{\enspace~}
\fi
% 使用enumitem宏包配制列表环境
% 紧凑间距
\setlist{nosep}
% 列表和段落头对齐
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} % Only the level 1

% 流程图定义基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-9pt,belowcaptionskip=9pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em,
  % 改变双引号和单引号的样式
  literate={"}{\textquotedbl}1,
  upquote=true
}

% Setting Package siunitx
\sisetup{detect-all} % Detecting fonts

% 定理环境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\zstu@label@algo~}[chapter]
  \newtheorem{thm}{\zstu@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\zstu@label@lem~}
  \newtheorem{prop}[thm]{\zstu@label@prop~}
  \newtheorem{cor}[thm]{\zstu@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\zstu@label@defn~}[chapter]
  \newtheorem{conj}{\zstu@label@conj~}[chapter]
  \newtheorem{exmp}{\zstu@label@exmp~}[chapter]
  \newtheorem{rem}{\zstu@label@rem~}
  \newtheorem{case}{\zstu@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\zstu@label@thm~}
  \newtheorem{blem}[thm]{\zstu@label@lem~}
  \newtheorem{bprop}[thm]{\zstu@label@prop~}
  \newtheorem{bcor}[thm]{\zstu@label@cor~}
  \renewcommand{\proofname}{\bfseries\zstu@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions add Switch statement to LaTeX algorithmicx package
% It's based on Werner's answer on stackoverflow
% http://tex.stackexchange.com/questions/53357/switch-cases-in-algorithmic

% New definitions
\algnewcommand\algorithmicswitch{\textbf{switch}}
\algnewcommand\algorithmiccase{\textbf{case}}
\algnewcommand\algorithmicdefault{\textbf{default}}

% New "environments"
% using \algtext*{<env>} removes any typesetting of that command
\algdef{SE}[SWITCH]{Switch}{EndSwitch}[1]{\algorithmicswitch\ (#1)}{\algorithmicend\ \algorithmicswitch}%
%\algtext*{EndSwitch}%
\algdef{SE}[CASE]{Case}{EndCase}[1]{\algorithmiccase\ #1:}{\algorithmicend\ \algorithmiccase}%
\algtext*{EndCase}%
\algdef{SE}[DEFAULT]{Default}{EndDefault}{\algorithmicdefault\ :}{\algorithmicend\ \algorithmicdefault}%
\algtext*{EndDefault}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following add some extra commands to LaTeX algorithmicx package

% Assert
\algnewcommand\algorithmicassert{\texttt{assert}}
\algnewcommand\Assert[1]{\State \algorithmicassert(#1)}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========
% Segment 4. Draw the zstuthesis
%==========

\renewcommand\maketitle{%
  \pdfbookmark[0]{\zstu@titlepage}{titlepage}
  \ifzstu@coursepaper
    \makechinesetitle@coursepaper
  \else
    \ifzstu@bachelor
      \makechinesetitle@bachelor
    \else
      \ifzstu@master
        \makechinesetitle@master
        \makeenglishtitle@master
      \else
        \makechinesetitle
        \makeenglishtitle
      \fi
    \fi
  \fi
}

\ExplSyntaxOn
\tl_new:N        \l__zstu_tmp_tl
\seq_new:N       \l__zstu_tmp_seq
\NewDocumentCommand{ \zstu@covertitle@handler } { O { \\ } m }
  {
    \seq_set_split:Nnn \l__zstu_tmp_seq { #1 } { #2 }
    \seq_pop_right:NN  \l__zstu_tmp_seq \l__zstu_tmp_tl
    \seq_map_inline:Nn \l__zstu_tmp_seq { \underline { \makebox [ 300pt ] { ##1 } } \\ }
    \underline { \makebox [ 300pt ] { \l__zstu_tmp_tl } }
  }
\NewDocumentCommand{ \zstu@title@handler } { O { \\ } m }
  {
    \seq_set_split:Nnn \l__zstu_tmp_seq { #1 } { #2 }
    \seq_map_inline:Nn \l__zstu_tmp_seq { ##1 }
  }
\ExplSyntaxOff

% “绘制”硕士论文模板中文标题页
\newcommand\makechinesetitle@master{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\songti\zihao{-2} ~\\[35pt] \zstu@label@statement}
  \vskip\stretch{1}
  {\heiti\zihao{2}\zstu@value@chinesetitle}
  \vskip\stretch{1.2}
  {\fangsong\zihao{4}}
  \zihao{4}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.25}
  \begin{tabular}{>{\begin{CJKfilltwosides}[t]{7\ccwd}\heiti }r<{\end{CJKfilltwosides}}l}
    \ifzstu@review
      \zstu@label@author        & \enspace ~ \\
      \zstu@label@studentnumber & \enspace ~ \\
      \zstu@label@advisor       & \enspace ~ \\
      \ifx\zstu@value@coadvisor\undefined\else
        \zstu@label@coadvisor     & \enspace ~ \\
      \fi
    \else
      \zstu@label@author        & \enspace {\zstu@value@author} \\
      \zstu@label@studentnumber & \enspace {\zstu@value@studentnumber} \\
      \zstu@label@advisor       & \enspace {\zstu@value@advisor} \\
      \ifx\zstu@value@coadvisor\undefined\else
        \zstu@label@coadvisor     & \enspace {\zstu@value@coadvisor} \\
      \fi
    \fi
      \zstu@label@cnacademicdegree & \enspace {\zstu@value@cnacademicdegree } \\
      \zstu@label@major         & \enspace {\zstu@value@major} \\
      \zstu@label@institute         & \enspace {\zstu@value@institute} \\
      \zstu@label@defenddate    & \enspace {\zstu@value@defenddate} \\
      \zstu@label@school        & \enspace {\zstu@value@school}
  \end{tabular}
  \end{center}
  \vskip \stretch{0.25}
  \cleardoublepage
}
% “绘制”硕士论文模板英文标题页
\newcommand\makeenglishtitle@master{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{-2} ~\\[35pt] \zstu@label@englishstatement}
      \vskip\stretch{1}
      {\zihao{2} \textbf{\MakeUppercase{\zstu@value@englishtitle}} \vskip 1pt}
      \vskip \stretch{1}
      {\normalfont\zihao{4}}
      \zihao{4}
      \def\tabcolsep{1pt}
      \def\arraystretch{1.3}
      \begin{tabular}{ll}
        \ifzstu@review
          \textbf{\zstu@label@englishauthor} & \enspace ~ \\
          \textbf{\zstu@label@englishstudentid} & \enspace ~ \\
          \textbf{\zstu@label@englishadvisor}       & \enspace ~ \\
          \ifx\zstu@value@englishcoadvisor\undefined\else
            \textbf{\zstu@label@englishcoadvisor}     & \enspace ~ \\
          \fi
        \else
          \textbf{\zstu@label@englishauthor} & \enspace \zstu@value@englishauthor \\
          \textbf{\zstu@label@englishstudentid} & \enspace \zstu@value@englishstudentid \\
          \textbf{\zstu@label@englishadvisor}      & \enspace \zstu@value@englishadvisor \\
          \ifx\zstu@value@englishcoadvisor\undefined\else
            \textbf{\zstu@label@englishcoadvisor}    & \enspace \zstu@value@englishcoadvisor \\
          \fi
        \fi
        \textbf{\zstu@label@enacademicdegree}   & \enspace \zstu@value@enacademicdegree \\
        \textbf{\zstu@label@englishmajor}         & \enspace \zstu@value@englishmajor \\
        \textbf{\zstu@label@englishinstitutemaster}        & \enspace \makecell[l]{\zstu@value@englishinstitutemaster} \\
        \textbf{\zstu@label@englishdate}    & \enspace \zstu@value@englishdate \\
        \textbf{\zstu@label@englishschool}        & \enspace \zstu@value@englishschool
      \end{tabular}
  \end{center}
  \vskip \stretch{0.4}
  \cleardoublepage
}

% “绘制”中文标题页
\newcommand\makechinesetitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\zihao{-3}\zstu@label@statement}
  \vskip\stretch{1}
  {\heiti\zihao{3}\zstu@value@chinesetitle}
  \vskip\stretch{1}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.5}
  \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}\heiti}r<{\end{CJKfilltwosides}}@{：}c}
    \ifzstu@review
      \zstu@label@author        &  \\ \cline{2-2}
      \zstu@label@studentnumber & \makebox[150pt]{} \\ \cline{2-2}
      \zstu@label@advisor       &  \\ \cline{2-2}
      \ifx\zstu@value@coadvisor\undefined\else
        \zstu@label@coadvisor     &  \\ \cline{2-2}
      \fi
    \else
      \zstu@label@author        & \zstu@value@author \\ \cline{2-2}
      \zstu@label@studentnumber & \makebox[150pt]{\zstu@value@studentnumber} \\ \cline{2-2}
      \zstu@label@advisor       & \zstu@value@advisor \\ \cline{2-2}
      \ifx\zstu@value@coadvisor\undefined\else
        \zstu@label@coadvisor     & \zstu@value@coadvisor \\ \cline{2-2}
      \fi
    \fi
    \zstu@label@major         & \zstu@value@major \\ \cline{2-2}
    \zstu@label@defenddate    & \zstu@value@defenddate \\ \cline{2-2}
  \end{tabular}
  \vskip 30pt
  \end{center}
  \cleardoublepage
}

% “绘制”英文标题页
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{4} \zstu@label@englishstatement}
      \vspace{20pt} \vskip\stretch{1}
      {\huge\zstu@value@englishtitle \vskip 1pt}
      \vskip \stretch{1}
    \ifzstu@review
      \vskip \stretch{1}
      \vskip 3pt
      \vskip \stretch{2}
    \else
      {\normalfont\zihao{4}\zstu@value@englishauthor}
      \vskip \stretch{1}
      {\normalfont\zihao{4}\zstu@label@englishadvisor}
      \vskip 2pt
      {\normalfont\zihao{4}\zstu@value@englishadvisor}
      \vskip 5pt
      \ifx\zstu@value@englishcoadvisor\undefined\else
        {\normalfont\zihao{4}\zstu@label@englishcoadvisor}
        \vskip 2pt
        {\normalfont\zihao{4}\zstu@value@englishcoadvisor}
        \vskip \stretch{2}
      \fi
    \fi
    \normalfont\zstu@value@englishinstitute \vskip 30pt
    \normalfont\zstu@value@englishdate \vskip 20pt
  \end{center}
  \cleardoublepage
}

% “绘制”学士论文中文标题页
\newcommand\makechinesetitle@bachelor{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \kaishu
    \vspace*{20pt} \vskip 7pt
    \includegraphics{zstulogo}
    \vskip 30pt
    {\fontsize{32}{32}\zstu@value@chinesedegree\zstu@label@thesis}
    \vskip 15pt
    {\zihao{-2}\MakeUppercase{Thesis of \zstu@value@englishdegree}}
    \vskip 15pt
    \includegraphics{zstubadge}
    \vskip \stretch{2}
    {
      \zihao{2}
      \begin{tabular}{r@{：}l}
        \zstu@label@title & {\zihao{-2}\parbox[t]{320pt}{\zstu@value@chinesecovertitle}}
      \end{tabular}
    }
    \vskip \stretch{1}
    {
      \zihao{3}
      \def\arraystretch{1.1}
      \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}@{：}c}
        \ifzstu@review
          \zstu@label@author        &  \\ \cline{2-2}
          \zstu@label@studentnumber & \makebox[180pt]{} \\ \cline{2-2}
        \else
          \zstu@label@author        & \zstu@value@author \\ \cline{2-2}
          \zstu@label@studentnumber & \makebox[180pt]{\zstu@value@studentnumber} \\ \cline{2-2}
        \fi
          \zstu@label@major         & \zstu@value@major \\ \cline{2-2}
        \ifzstu@review
          \zstu@label@advisor       &  \\ \cline{2-2}
        \else
          \zstu@label@advisor       & \zstu@value@advisor \\ \cline{2-2}
        \fi
        \zstu@label@institute     & \zstu@value@institute \\ \cline{2-2}
      \end{tabular}
    }
  \end{center}
  \cleardoublepage
}

% “绘制”课程论文标题页
\newcommand\makechinesetitle@coursepaper{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \kaishu
    \vspace*{20pt} \vskip 7pt
    \includegraphics{zstulogo}
    \vskip 30pt
    {\fontsize{32}{32}\zstu@label@coursepaper}
    \vskip 15pt
    \includegraphics{zstubadge}
    \vskip \stretch{2}
    {
      \zihao{2}
      \begin{tabular}{r@{：}l}
        \zstu@label@title & {\zihao{-2}\parbox[t]{320pt}{\zstu@value@chinesecovertitle}}
      \end{tabular}
    }
    \vskip \stretch{1}
    {
      \zihao{3}
      \def\arraystretch{1.1}
      \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}@{：}c}
      \zstu@label@coursename    & \zstu@value@coursename \\ \cline{2-2}
      \zstu@label@author        & \zstu@value@author \\ \cline{2-2}
      \zstu@label@studentnumber & \makebox[180pt]{\zstu@value@studentnumber} \\ \cline{2-2}
      \zstu@label@institute     & \zstu@value@institute \\ \cline{2-2}
      \zstu@label@major         & \zstu@value@major \\ \cline{2-2}
      \end{tabular}
    }
  \end{center}
  \cleardoublepage
}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    ~\\[70pt]
    % \linespread{1.5}
    {\zihao{-2}\heiti \textbf{\zstu@value@school}} \\[12pt]
    {\zihao{-2}\heiti \textbf{\zstu@label@original}} \\[12pt]
  \end{center}
  \vskip 10pt
  {\par\linespread{2}\zihao{4}我谨在此保证：本人所写的毕业设计(论文)《\zstu@value@chinesetitle》，\zstu@label@originalcontent\par}
  \vskip 80pt
  {\zihao{4}\hspace{13em}\zstu@label@authorsign\hrulefill\hspace{1.5em}}
  \vskip 40pt
  {\zihao{4}\hspace{11em}\zstu@label@originalDate\hspace{1em}}
  \cleardoublepage
}

%% 授权声明
%\newcommand\makeDeclareAuthorization{%
%  \cleardoublepage
%  \thispagestyle{empty}
%  \begin{center}
%    ~\\[30pt]
%    {\zihao{-2}\bfseries\heiti \zstu@value@school} \\[12pt]
%    {\zihao{-2}\bfseries\heiti \zstu@label@authorization} \\[12pt]
%  \end{center}
%  \vskip 10pt
%  {\par\linespread{1.5}\zihao{4}\zstu@label@authorizationcontent\par}
%  \vskip 150pt
%  {\zihao{4} \zstu@label@authorsign\hrulefill\hspace{3em}\zstu@label@Supervisorsign\hrulefill}
%  \vskip 40pt
%  {\zihao{4} \zstu@label@originalDate\hfill\hspace{3em}\zstu@label@originalDate}
%  \cleardoublepage
%}

% fancyhdr页眉页脚设置
\ifzstu@english
  \def\zstu@value@titlemark{\zstu@value@englishtitle}
  \newcommand\zstu@fancyhead{\footnotesize\kaishu}
  \newcommand\zstu@fancyfoot[2]{\small --~~Page~~{\bfseries{#1}}~~of~~{\bfseries{#2}}~~--}
\else
  \def\zstu@value@titlemark{\zstu@value@chinesetitle}
  \newcommand\zstu@fancyhead{\small\kaishu}
  \newcommand\zstu@fancyfoot[2]{\small 第~{\bfseries{#1}}~页\,共~{\bfseries{#2}}~页}
\fi
\def\markboxwidth{0.75\textwidth}
\AtBeginDocument{\pagenumbering{Alph}}

\ifzstu@coursepaper
  %% 本科学位论文页眉页脚设置
  %% 前言页眉页脚
  \fancypagestyle{front}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/zstubanner}}
    \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\zstu@fancyhead\zstu@value@titlemark}}}
    \fancyfoot[C]{\zstu@fancyfoot{\thepage}{\lastpageref{pagesLTS.Roman}}}
    \renewcommand{\headheight}{32pt}
  }
  %% 正文页眉页脚
  \fancypagestyle{main}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/zstubanner}}
    \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\zstu@fancyhead\zstu@value@titlemark}}}
    \fancyfoot[C]{\zstu@fancyfoot{\thepage}{\lastpageref{pagesLTS.arabic}}}
    \renewcommand{\headheight}{32pt}
  }
\else
  \ifzstu@bachelor
  %% 本科学位论文页眉页脚设置
    %% 前言页眉页脚
    \fancypagestyle{front}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/zstubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\zstu@fancyhead\zstu@value@titlemark}}}
      \fancyfoot[C]{\zstu@fancyfoot{\thepage}{\lastpageref{pagesLTS.Roman}}}
      \renewcommand{\headheight}{32pt}
    }
    %% 正文页眉页脚
    \fancypagestyle{main}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/zstubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\zstu@fancyhead\zstu@value@titlemark}}}
      \fancyfoot[C]{\zstu@fancyfoot{\thepage}{\lastpageref{pagesLTS.arabic}}}
      \renewcommand{\headheight}{32pt}
    }
    %% 英文大摘要
    \fancypagestyle{biglast}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/zstubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\zstu@fancyhead\zstu@value@titlemark}}}
      \fancyfoot[C]{\zstu@fancyfoot{\theCurrentPageLocal}{\lastpageref{pagesLTS.roman.local}}}
      \renewcommand{\headheight}{32pt}
    }
  \else
  %% 研究生学位论文页眉页脚设置
    \if@twoside
    %% 双面打印页眉页脚
      \fancypagestyle{front}{%
        \fancyhf{}
        \fancyhead[LO,RE]{\small\kaishu\zstu@value@school\zstu@value@chinesedegree\zstu@label@thesis}
        \fancyhead[LE,RO]{\nouppercase{\zstu@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
      \fancypagestyle{main}{%
        \fancyhf{}
        \fancyhead[LO,RE]{\small\kaishu\zstu@value@school\zstu@value@chinesedegree\zstu@label@thesis}
        \fancyhead[LE,RO]{\nouppercase{\zstu@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
    \else
    %% 单面打印页眉页脚
      \fancypagestyle{front}{%
        \fancyhf{}
        \fancyhead[L]{\small\kaishu\zstu@value@school\zstu@value@chinesedegree\zstu@label@thesis}
        \fancyhead[R]{\nouppercase{\zstu@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
      \fancypagestyle{main}{%
        \fancyhf{}
        \fancyhead[L]{\small\kaishu\zstu@value@school\zstu@value@chinesedegree\zstu@label@thesis}
        \fancyhead[R]{\nouppercase{\zstu@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
    \fi
  \fi
\fi

\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \ifzstu@coursepaper
    \pagestyle{front}
  \else
    \ifzstu@bachelor
      \pagestyle{front}
    \else
      \pagestyle{main}
    \fi
  \fi
  \pagenumbering{Roman}
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{main}
  \pagenumbering{arabic}
}

% 中英文摘要+关键词
\newenvironment{abstract}{%
  \cleardoublepage
  \pdfbookmark[0]{\zstu@label@abstract}{abstract}
  \chapter*{%
    \zstu@value@chinesetitle
    \vskip 20pt
    \zstu@label@chineseabstract
  }
  \zihao{4} \markboth{\zstu@label@chineseabstract}{}
}{
  \vspace{2ex}\noindent
  {\zihao{4} \textbf{\zstu@label@keywords}{\zstu@value@keywords}}
}
\newenvironment{englishabstract}{%
  \cleardoublepage
  \chapter*{%
    \MakeUppercase\zstu@value@englishtitle
    \vskip 20pt
    \MakeUppercase\zstu@label@englishabstract
  }
  \zihao{4} \markboth{\zstu@label@englishabstract}{}
}{
  \vspace{2ex}\noindent
  {\zihao{4} \textbf{\zstu@label@englishkeywords}{\zstu@value@englishkeywords}}
}

% 主要符号对照表
\newenvironment{nomenclaturename}{\cleardoublepage
\chapter{\zstu@nomenclature}{}}{}

\newenvironment{publications}[1]
     {\chapter{\zstu@label@publications}%
      \@mkboth{\MakeUppercase\zstu@label@publications}
              {\MakeUppercase\zstu@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{patents}[1]
     {\chapter{\zstu@label@patents}%
      \@mkboth{\MakeUppercase\zstu@label@patents}
              {\MakeUppercase\zstu@label@patents}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `patents' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\zstu@label@projects}%
      \@mkboth{\MakeUppercase\zstu@label@projects}
              {\MakeUppercase\zstu@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

\newenvironment{resume}%
  {\chapter{\zstu@label@resume}}%
  {}

\newenvironment{resumesection}[1]%
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}%
  {\endlist}

\newenvironment{resumelist}[1]%
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}}%
  {\endlist}

\renewenvironment{thanks}{%
  \chapter*{%
    \zstu@label@thanks
    \markboth{\zstu@label@thanks}{}
  }
  \addcontentsline{toc}{chapter}{\zstu@label@thanks}
}{}

\newenvironment{summary}{%
  \chapter*{%
    \zstu@label@summary
    \markboth{\zstu@label@summary}{}
  }
  \addcontentsline{toc}{chapter}{\zstu@label@summary}
}{}

\newenvironment{bigabstract}{%
  \cleardoublepage
  \pagenumbering{roman}
  \pagestyle{biglast}
  \chapter*{%
    \bfseries
    \MakeUppercase\zstu@value@englishtitle
    \vskip 20pt
  }
}{\cleardoublepage}

\endinput

%%
%% End of file `zstuthesis.cls'.
