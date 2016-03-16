\ProvidesClass{cv}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{geometry}
\geometry{
        a4paper,
        left=20mm,
        right=20mm,
        top=40mm,
        bottom=20mm
}

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{myaddress}{%
  \begin{textblock}{5}(2, 3)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
}

\newenvironment{theiraddress}{%
  \begin{textblock}{5}(2, 6)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
}

\renewcommand{\date}[1]{
        \begin{textblock}{5}(14, 3) %6.27
                \begin{flushright}
                        #1
                \end{flushright}
        \end{textblock}
}

\newcommand{\subject}[1]{
        \begin{textblock}{14}(2, 9) %6.27
                \begin{flushleft}
                        \textbf{#1}
                \end{flushleft}
        \end{textblock}
}

\newenvironment{app}{%
  \begin{textblock}{17}(2, 10.5)
  \obeycr
}{%
  \restorecr
  \end{textblock}
}

\pagenumbering{gobble}
