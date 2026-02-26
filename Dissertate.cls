% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, oneside, letterpaper]{book}

%
% Options
%
\RequirePackage{etoolbox}

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
%! Suppress = NonMatchingIf
%! Suppress = DuplicateDefinition
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage[width=5.75in, letterpaper]{geometry}
\usepackage{ragged2e}
%\RaggedRight
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\RequirePackage{listings}
\lstset{
    basicstyle=\ttfamily\small,
    breaklines=true,
    breakatwhitespace=true,
    postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
    frame=single,
    numbers=left,
    numberstyle=\tiny,
    columns=flexible,
    keepspaces=true,
    xleftmargin=2em,
    framexleftmargin=1.5em
}
% Force single spacing on all listings, even when basicstyle is overridden locally
\AtBeginEnvironment{lstlisting}{\singlespacing}
\RequirePackage{tikz}
\usetikzlibrary{arrows.meta,positioning,shapes.geometric,fit,calc,decorations.pathreplacing}
\RequirePackage{marvosym}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathspec}

% Theorem environments
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{property}[theorem]{Property}
\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                justification=justified,
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}
\RequirePackage{polyglossia}
\setdefaultlanguage{english}
\setotherlanguage{greek}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{1}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
\RequirePackage[super,comma,numbers]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \begin{spacing}{\dcompressedspacing}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist
     \end{spacing}}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% Greek metadata definitions
\def\titlegr#1{\gdef\@titlegr{#1}}
\def\authorgr#1{\gdef\@authorgr{#1}}
\def\advisorgr#1{\gdef\@advisorgr{#1}}
\def\committeeInternalOnegr#1{\gdef\@committeeInternalOnegr{#1}}
\def\committeeInternalTwogr#1{\gdef\@committeeInternalTwogr{#1}}
\def\committeeExternalgr#1{\gdef\@committeeExternalgr{#1}}
\def\degreegr#1{\gdef\@degreegr{#1}}
\def\fieldgr#1{\gdef\@fieldgr{#1}}
\def\degreemonthgr#1{\gdef\@degreemonthgr{#1}}
\def\departmentgr#1{\gdef\@departmentgr{#1}}
\def\universitygr#1{\gdef\@universitygr{#1}}
% Examination committee (4 additional members beyond the 3-member advisory)
\def\examinerOne#1{\gdef\@examinerOne{#1}}
\def\examinerOnegr#1{\gdef\@examinerOnegr{#1}}
\def\examinerTwo#1{\gdef\@examinerTwo{#1}}
\def\examinerTwogr#1{\gdef\@examinerTwogr{#1}}
\def\examinerThree#1{\gdef\@examinerThree{#1}}
\def\examinerThreegr#1{\gdef\@examinerThreegr{#1}}
\def\examinerFour#1{\gdef\@examinerFour{#1}}
\def\examinerFourgr#1{\gdef\@examinerFourgr{#1}}

% School name and location
\university{University of the Aegean}
\universitygr{Πανεπιστήμιο Αιγαίου}
\universitycity{Mytilene}
\universitystate{Lesvos}

% School color found from university's graphic identity site:
% http://isites.harvard.edu/icb/icb.do?keyword=k75408&pageid=icb.page392732
\definecolor{SchoolColor}{rgb}{0.5, 0.5, 0.5} % Crimson
\definecolor{chaptergrey}{rgb}{0.5, 0.5, 0.5} % for chapter numbers

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}

% Restore \frontmatter to standard book-class behavior (roman page numbering).
% Individual frontmatter components are called explicitly in dissertation.tex.
\renewcommand{\frontmatter}{
	\cleardoublepage
	\@mainmatterfalse
	\pagenumbering{roman}
}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\begin{center}
	\vspace*{5pt}
	% University and department logos
	\includegraphics[height=1.6cm]{figures/logo-aegean-en}\hspace{1.5cm}%
	\includegraphics[height=1.6cm]{figures/logo-dept-en}
	\vspace{14pt}

	{\large \textsc{\@university}}\\[3pt]
	{\textsc{Department of \@department}}
	\vspace{25pt}

	{\LARGE \textcolor{SchoolColor}{\thetitle}}
	\vspace{25pt}

	\textsc{A Dissertation Presented}\\[8pt]
	\textsc{by}\\[8pt]
	{\large \theauthor}\\[8pt]
	\textsc{in partial fulfillment of the requirements\\
	for the degree of\\ \@degree\\
	in the subject of\\ \@field}
	\vspace{20pt}

	\textsc{Examination Committee}\\[6pt]
	\@advisor\ (Supervisor)\\
	\@committeeInternalOne\\
	\@committeeExternal\\
	\@examinerOne\\
	\@examinerTwo\\
	\@examinerThree\\
	\@examinerFour
	\vspace{20pt}

	\@degreemonth\ \@degreeyear
	\end{center}
	\vspace*{\fill}
}

\newcommand{\maketitlegreek}{
	\thispagestyle{empty}
	\begin{center}
	\vspace*{5pt}
	% University and department logos
	\includegraphics[height=1.6cm]{figures/logo-aegean-el}\hspace{1.5cm}%
	\includegraphics[height=1.6cm]{figures/logo-dept}
	\vspace{14pt}

	\begin{greek}
	{\large \MakeUppercase{\@universitygr}}\\[3pt]
	{\MakeUppercase{Τμήμα \@departmentgr}}
	\vspace{25pt}

	{\LARGE \textcolor{SchoolColor}{\@titlegr}}
	\vspace{25pt}

	\MakeUppercase{Διδακτορική Διατριβή}\\[8pt]
	του\\[8pt]
	{\large \@authorgr}
	\vspace{20pt}

	\MakeUppercase{Επταμελής Εξεταστική Επιτροπή}\\[6pt]
	\@advisorgr\ (Επιβλέπων)\\
	\@committeeInternalOnegr\\
	\@committeeExternalgr\\
	\@examinerOnegr\\
	\@examinerTwogr\\
	\@examinerThreegr\\
	\@examinerFourgr
	\vspace{20pt}

	\@degreemonthgr\ \@degreeyear
	\end{greek}
	\end{center}
	\vspace*{\fill}
}

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\scshape \noindent \small \copyright \small 2019\hspace{3pt}-- \theauthor \\
	\noindent all rights reserved.
	\vspace*{\fill}
	\newpage
	\rm
}

\newcommand{\abstractpage}{
	\newpage
	\pagenumbering{roman}
	\setcounter{page}{3}
	\pagestyle{fancy}
	\lhead{} \rhead{}
	\renewcommand{\headrulewidth}{0.0pt}
	\vspace*{35pt}
	\begin{center}
	\Large \textcolor{SchoolColor}{\@title} \normalsize \\
	\vspace*{20pt}
	\scshape Abstract \\ \rm
	\end{center}
	\input{frontmatter/abstract}
	\vspace*{\fill}
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
}

\newcommand{\abstractpagegreek}{
	\newpage
	\pagestyle{fancy}
	\lhead{} \rhead{}
	\renewcommand{\headrulewidth}{0.0pt}
	\vspace*{35pt}
	\begin{center}
	\Large \textcolor{SchoolColor}{\@titlegr} \normalsize \\
	\vspace*{20pt}
	\MakeUppercase{Περίληψη} \\ \rm
	\end{center}
	\begin{greek}
	\input{frontmatter/abstract_gr}
	\end{greek}
	\vspace*{\fill}
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
}

\newcommand{\dedicationpage}{
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
}

\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\addcontentsline{toc}{chapter}{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} \newpage
}


\renewcommand{\backmatter}{
    \input{endmatter/personalize}
}
