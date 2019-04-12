\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template/lnucsthesis}[2019/04/08]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[11pt,a4paper,twoside]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define all the pieces that go on the title page.
%
% \title and \author already defined

\def\documenttype#1{\gdef\@documenttype{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\examiner#1{\gdef\@examiner{#1}}
\def\semester#1{\gdef\@semester{#1}}
\def\subject#1{\gdef\@subject{#1}}
\def\level#1{\gdef\@level{#1}}
\def\coursecode#1{\gdef\@coursecode{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages.
%

\usepackage[utf8]{inputenc} % Load early, required for inputting international characters.
\usepackage[T1]{fontenc}    % Load early, output font encoding for international characters.
\usepackage[english, swedish]{babel}

\usepackage{appendix}
\usepackage{background}
\usepackage{csquotes}
\usepackage{fancyhdr}
\usepackage[top=3cm, bottom=3cm, left=4cm, right=4cm, footskip=2cm]{geometry}
\usepackage{graphicx}
\usepackage{import}
\usepackage[parfill]{parskip}
\usepackage{tikz}
\usepackage{times}
\usepackage{tocloft}
\usepackage{todonotes}
\usepackage{titlesec}
\usepackage{titletoc}
\usepackage[absolute]{textpos}
\usepackage{tocbibind}
\usepackage[strings]{underscore}
\usepackage{hyperref}

\usepackage{lipsum}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% frontmatter, mainmatter, backmatter
%
\newcommand\frontmatter{%
  \cleardoublepage
  \pagenumbering{roman}
}

\newcommand\mainmatter{%
  \cleardoublepage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer.
%

\pagestyle{fancy}                     % Change page style to fancy.
\fancyhf{}                            % Clear header/footer.
\cfoot{\thepage}                      % Center footer page number.

\backgroundsetup{
   scale=1,
   angle=0,
   opacity=1,
   color=black,
   contents={\begin{tikzpicture}[remember picture, overlay]
      \node[anchor=north west,
            xshift=4cm,
            yshift=-1cm]
            at (current page.north west)
            {\includegraphics[height=1cm]{template/lnu_wordmark_kalmar_vaxjo_cmyk.eps}};%
      \node[anchor=north west,
            xshift=1cm,
            yshift=-1cm]
            at (current page.north west)
            {\includegraphics[height=1cm]{template/lnu_symbol_cmyk.eps}};
     \end{tikzpicture}}
 }

\renewcommand{\headrulewidth}{0pt}    % Hide the head rule.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Headings.
%

\titleformat{\chapter}{\normalfont\bfseries\fontsize{17}{20}\selectfont}{\thechapter}{1em}{}
\titleformat{\section}{\normalfont\bfseries\fontsize{13}{15}\selectfont}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\bfseries\fontsize{11}{13}\selectfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\it\fontsize{11}{13}\selectfont}{\thesubsection}{1em}{}
\titleformat{\bibliography}{\normalfont\bfseries\fontsize{17}{20}\selectfont}{\thebibliography}{1em}{}

\titlespacing*{\chapter}{0pt}{-26pt}{0pt} % 50 - 24 (headsep?)
\titlespacing*{\section} {0pt}{12pt}{0pt}
\titlespacing*{\subsection} {0pt}{12pt}{0pt}
\titlespacing*{\subsubsection} {0pt}{12pt}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\maketitle'
%

\def\maketitle{\begin{titlepage}

\backgroundsetup{
   scale=1,
   angle=0,
   opacity=1,
   color=black,
   contents={\begin{tikzpicture}[remember picture, overlay]
      \draw (-6.65,9.25) -- (-6.65,13.85);
      \draw (2.12,-14.27) -- (2.12,-11.07); % HACK!
      \node[anchor=north west,
            xshift=4cm,
            yshift=-1cm]
            at (current page.north west)
            {\includegraphics[height=1cm]{template/lnu_wordmark_kalmar_vaxjo_cmyk.eps}};
      \node[anchor=north west,
            xshift=1cm,
            yshift=-1cm]
            at (current page.north west)
            {\includegraphics[height=1cm]{template/lnu_symbol_cmyk.eps}};
      \node[anchor=north west,
            xshift=-3.98cm,
            yshift=-15.6cm]
            at (current page.north west)
            {\includegraphics[width=15.05cm]{template/copperplate.png}};
     \end{tikzpicture}}
 }

\null

\begin{textblock*}{13cm}[0,1](4cm,5.95cm)
  \normalfont\fontsize{22pt}{29pt}\selectfont
  \@documenttype
  \vspace{6pt}
\end{textblock*}

\begin{textblock*}{13cm}[0,0](4cm,5.95cm)
  \normalfont\fontsize{30pt}{36pt}\selectfont
  \vspace{72pt}
  \@title\\
  \normalfont\fontsize{18pt}{22pt}\selectfont
  \it \@subtitle\\
\end{textblock*}

%\begin{textblock*}{0cm}[0,0](12.62cm,25,92cm)
%  \vrule width .4pt height 3.2cm
%\end{textblock*}

\newlength{\savetextblock}
\newlength{\heighttextblock}

\begin{textblock*}{7.44cm}[0,0](12.82cm,25,92cm)
  \normalfont
  \emph{Författare:} \@author\\
  \emph{Handledare:} \@supervisor\\
  \emph{Examinator:} \@examiner\\
  \emph{Termin:} \@semester\\
  \emph{Ämne:} \@subject\\
  \emph{Nivå:} \@level\\
  \emph{Kurskod:} \@coursecode
\end{textblock*}

\end{titlepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Add abstract to ToC and redefine '\abstractname'.
%

\patchcmd{\abstract}{\titlepage}{\titlepage% Insert ToC-writing after starting a titlepage
  \addcontentsline{toc}{chapter}{Abstract}}{}{}

\addto{\captionsenglish}{%
  \renewcommand{\abstractname}{\raggedright\normalfont\bfseries\fontsize{17}{20}\selectfont Abstract}}

\addto{\captionsswedish}{%
  \renewcommand{\abstractname}{\raggedright\normalfont\bfseries\fontsize{17}{20}\selectfont Sammanfattning}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  \keywords
%

\newenvironment{keywords}{\noindent\textbf{Keywords: }}{\par}

\addto{\captionsenglish}{%
  \renewcommand{\keywords}{\noindent\textbf{Keywords: }}}{\par}

\addto{\captionsswedish}{%
  \renewcommand{\keywords}{\noindent\textbf{Nyckelord: }}}{\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section numbering & table of contents
%

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\renewcommand{\cfttoctitlefont}{\bfseries\fontsize{17}{20}\selectfont}
\setlength\cftbeforetoctitleskip{-13pt}
\setlength{\cftaftertoctitleskip}{6pt}

\titlecontents{chapter}[0cm]
  {\normalsize\bfseries\addvspace{6pt}}
  {\thecontentslabel\hspace{0.78cm}}
  {}
  {\titlerule[0pc]{}\contentspage}
  
\titlecontents{section}[0.39cm]
  {\normalsize\itshape}
  {\thecontentslabel\hspace{0.78cm}}
  {}
  {\titlerule[0pc]{}\contentspage}
  
\titlecontents{subsection}[0.78cm]
  {\normalsize}
  {\thecontentslabel\hspace{0.78cm}}
  {}
  {\titlerule[0pc]{}\contentspage}

\addto{\captionsenglish}{%
 \renewcommand{\listfigurename}{List of Figures}}
\renewcommand{\cftloftitlefont}{\bfseries\fontsize{17}{20}\selectfont}
\setlength\cftbeforeloftitleskip{-13pt}
\setlength{\cftafterloftitleskip}{6pt}

\addto{\captionsenglish}{%
 \renewcommand{\listtablename}{List of Tables}}
\renewcommand{\cftlottitlefont}{\bfseries\fontsize{17}{20}\selectfont}
\setlength\cftbeforelottitleskip{-13pt}
\setlength{\cftafterlottitleskip}{6pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\chapter'.
%

% Prints "THIS PAGE INTENTIONALLY LEFT BLANK" on blank pages.
\def\chapter{\clearpage\ifodd\c@page\else
   \hbox{}\par\vfill\centerline%
   {(DENNA SIDA HAR LÄMNATS TOM MED AVSIKT)}%
   \vfill\newpage\fi
   \thispagestyle{fancy}	% Page style of chapter page is 'plain'
   \global\@topnum\z@		% Prevents figures from going at top of page.
   \@afterindentfalse		% Suppresses indent in first paragraph.  Change
   \secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\bibname'
%

\addto{\captionsenglish}{%
  \renewcommand{\bibname}{References}}

\addto{\captionsswedish}{%
  \renewcommand{\bibname}{Referenser}}

\addto\captionsswedish{%
  \renewcommand\appendixname{Bilaga}
  \renewcommand\appendixpagename{Bilaga}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\@makefnmark' (footnote mark)
%

\renewcommand{\@makefnmark}{%
  \mbox{\textsuperscript{\tiny\@thefnmark}}}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\labelitemi' (itemize bullet)
%

\renewcommand\labelitemi{\small\textbullet}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine '\textit' (italic)
%

\let\oldtextit\textit
\DeclareTextFontCommand{\textit}{\normalsize\normalfont\itshape\selectfont}

\renewcommand\appendixname{New Name}