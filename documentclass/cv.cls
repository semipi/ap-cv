% Based on Friggeri Resume/CV by Adrien Friggeri (adrien@friggeri.net)

\ProvidesClass{cv}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% Heart and mathematics
\RequirePackage{amssymb}
\DeclareSymbolFont{extraup}{U}{zavm}{m}{n}
\DeclareMathSymbol{\varheart}{\mathalpha}{extraup}{86}
\RequirePackage{url}

% Color
\RequirePackage{xcolor}
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\RequirePackage{geometry}
\geometry{
        a4paper,
        left=60mm,
        right=20mm,
        top=40mm,
        bottom=20mm
}

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\color{headercolor}\bfseries%
    #1
    %\@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

% Side block
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{rside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\bfseries\color{headercolor} ##1}
  }
  \begin{textblock}{4}(1.5, 4)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

% Header
\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

% header
\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}%
      {\huge#1}{\color{headercolor}#2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}%
      #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}



% ------------------------------------------------------------------------------
% entrylist
\RequirePackage{tabularx}
\RequirePackage{array}

% right aligned table column
\newcolumntype{R}{>{\raggedleft\arraybackslash}p{3.5cm}}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  % EXPL: command form `tabularx` is necessary to avoid `runaway` bug ...
  % TODO: hard-coded length ... somehow `linewidth` is 0 in this scope?
  \tabularx{13cm}{p{2.5cm} X R}
}{%
  \endtabularx
}
\newcommand{\entry}[3]{{#1}&{#2}&{#3}\\}

% inject into the colums of the entrytable
\newcommand{\injectI}[1]{#1&&\\}
\newcommand{\injectII}[1]{&#1&\\}
\newcommand{\injectIII}[1]{&&#1\\}

% macros for job functions, technologies and specifications
\newcommand{\tech}[1]{\injectII{\textcolor{lightgray}{#1}}}
\newcommand{\func}{\injectII}
\newcommand{\site}{\injectII}
\newcommand{\spec}{\injectII}

% ------------------------------------------------------------------------------
% Misc

\RequirePackage{xspace}

\newcommand{\heart}{\textcolor{lightgray}{$\varheart$}\xspace}
