% Qinghai University journal-submission letter.
% Adapted from the supplied BNU/HIT/NJU letter template, based on
% brownletter.cls, Copyright 2003 Nesime Tatbul.
% Earlier adaptations: Brian Wood, Luyi Li, MincooLee, and Zain Chen.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{QHUletter}[2026/10/28 Qinghai University cover letter]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions\relax
\LoadClass[letterpaper]{letter}

\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{eso-pic}
\RequirePackage{tikz}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\geometry{left=19.05mm,right=22.225mm,top=53mm,bottom=19mm,headheight=0pt,headsep=0pt}
\definecolor{qhublue}{RGB}{5,71,165}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.7em}
\pagestyle{empty}
\let\@texttop\relax

% The supplied background is square: preserve its proportions.
\newcommand{\watermarkopacity}{0.15}
\newcommand{\watermarkwidth}{105mm}
\AddToShipoutPictureBG{%
  \begin{tikzpicture}[remember picture,overlay]
    \node[inner sep=0pt,opacity=\watermarkopacity] at (current page.center)
      {\includegraphics[width=\watermarkwidth]{qhu.pdf}};
  \end{tikzpicture}%
}

\newcommand{\subjectname}{Subject}
\let\QHU@subject\@empty
\newcommand{\subject}[1]{\gdef\QHU@subject{#1}}
% letter.cls prefixes these tokens even when its recipient argument is empty.
\def\QHU@emptyrecipient{\leavevmode\ignorespaces}

\renewcommand{\opening}[1]{%
  \thispagestyle{empty}%
  \AddToShipoutPictureFG*{%
    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=north west,inner sep=0pt]
        at ([xshift=19.05mm,yshift=-18mm]current page.north west)
        {\includegraphics[height=27.94mm]{qhu_bg.pdf}};
      \node[anchor=north west,inner sep=0pt,text width=70mm,
            align=left,font=\fontsize{10}{12}\selectfont]
        at ([xshift=127mm,yshift=-18mm]current page.north west)
        {\fromaddress};
      \draw[black,line width=0.4pt]
        ([xshift=121mm,yshift=-8mm]current page.north west) --
        ([xshift=121mm,yshift=-58mm]current page.north west);
    \end{tikzpicture}%
  }%
  {\raggedright\@date\par}%
  \vspace{1.5\baselineskip}%
  \ifx\toname\QHU@emptyrecipient\else
    {\raggedright\toname
      \ifx\toaddress\@empty\else\\\toaddress\fi\par}%
    \vspace{0.5\baselineskip}%
  \fi
  \ifx\QHU@subject\@empty\else
    {\noindent\textbf{\subjectname: \QHU@subject}\par}%
    \vspace{0.25\baselineskip}%
  \fi
  #1\par\nobreak
}

\renewcommand{\closing}[1]{%
  \par\nobreak\vspace{1.5\baselineskip}%
  \stopbreaks
  \noindent\hspace*{0.6\textwidth}%
  \parbox[t]{0.4\textwidth}{\raggedright
    \ignorespaces#1\\[0.5\medskipamount]%
    \ifx\fromsig\@empty\fromname\else\fromsig\fi\strut}%
  \par
}
\endinput
