\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{praca}[2000/05/19 Modified report class]

\PassOptionsToClass{12pt,a4paper}{report}

\newif\if@stretch
\newif\if@cmnts

\DeclareOption{draft}{\PassOptionsToClass{draft}{report}%
\@stretchfalse\@cmntstrue}

\DeclareOption{check}{\PassOptionsToClass{draft}{report}%
\@stretchtrue\@cmntstrue}

\DeclareOption{final}{\PassOptionsToClass{final}{report}%
\@stretchtrue\@cmntsfalse}

\DeclareOption{short}{\PassOptionsToClass{final}{report}%
\@stretchfalse\@cmntsfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{final}
\ProcessOptions\relax
\LoadClass{report}

\RequirePackage{latexsym}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
%\RequirePackage{mathpazo}
\RequirePackage[pdftex]{graphicx}
%\RequirePackage{psfrag}
\RequirePackage{enumerate}
\RequirePackage{xspace}

% \bibliographystyle{pl_abbrv}

\RequirePackage{plenc}
\RequirePackage{pldoc}
%\RequirePackage{times}
%\RequirePackage{where}
%\RequirePackage{myeps}
%\RequirePackage{myabbrev}
%\RequirePackage{mypaper}
%\RequirePackage{myalgorithm}

% margins: left 1+0.5in, right 1+0.25in
\setlength\textwidth{\paperwidth}
\addtolength\textwidth{-2.25in}
\setlength\oddsidemargin{0.25in}
\setlength\evensidemargin{0.25in}

\setlength\textheight{9in}
\setlength\topmargin{0in}

\pagestyle{myheadings}
\newcommand{\headingfont}{\small\slshape}
\renewcommand*\chaptermark[1]{\markright{\headingfont\thechapter.~~#1}}

\if@stretch
 \renewcommand{\baselinestretch}{1.2}
 \renewcommand{\arraystretch}{1.2}
 \setlength{\skip\footins}{.25in}
 \setlength{\footnotesep}{.15in}
 \setlength\parskip{3pt plus 2pt minus 2pt}
\fi


% \if@cmnts
%  \newcommand*{\cmnt}[1]{\addvspace{1cm}\par\noindent\textsc{#1}\par\addvspace{1cm}}
%  \newcommand*{\todo}[1][!!!]{\fbox{\textbf{#1}}\xspace}
%  \newcommand*{\toref}[1][???]{\fbox{$\rightarrow~$\textit{#1}}\xspace}
%  \newcommand*{\tocite}[1][???]{\fbox{$\leadsto~$\textit{#1}}\xspace}
% \else
%  \newcommand*{\warn}[1]{\ClassWarning{praca}{#1}}
%  \newcommand*{\cmnt}[1]{\warn{Comment found}}
%  \newcommand*{\todo}[1][]{\warn{Incomplete paragraph found}}
%  \newcommand*{\toref}[1][]{\warn{Empty reference found}}
%  \newcommand*{\tocite}[1][]{\warn{Empty citation found}}
% \fi

\renewcommand*{\@makechapterhead}[1]{\vspace*{50pt plus 5pt minus 5pt}
  {\parindent\z@ \raggedright \normalfont
  \ifnum \c@secnumdepth >\m@ne
    \huge\bfseries \@chapapp~~\thechapter \par\nobreak
    \vskip 20pt plus 2pt minus 2pt
  \fi
  \interlinepenalty\@M
  \Huge\bfseries #1\par\nobreak
  \vskip 40pt plus 4pt minus 4pt}
  \thispagestyle{empty}}

\renewcommand*{\@makeschapterhead}[1]{\vspace*{50pt plus 5pt minus 5pt}
  {\parindent\z@ \raggedright \normalfont
  \interlinepenalty\@M
  \Huge\bfseries #1\par\nobreak
  \vskip 40pt plus 4pt minus 4pt}
  \thispagestyle{empty}}

\newcommand{\setschapter}{%
  \renewcommand*{\@schapter}[1]{\@makeschapterhead{##1}\@afterheading
    \addcontentsline{toc}{chapter}{##1}\markright{\headingfont ##1}}}

\setlength\spaceskip{.33em plus .16em minus .11em}
\setlength\xspaceskip{.44em plus .22em minus .16em}
%\pretolerance=150
%\tolerance=300
%\hbadness=1500
%\vbadness=1500
%\linepenalty=10
%\hyphenpenalty=50
%\exhyphenpenalty=50
\clubpenalty=300
\@clubpenalty=300
\widowpenalty=300
\hfuzz=1pt
\vfuzz=1pt

\newcounter{nrrysunku}[chapter]

\newcommand{\insertpicture}[2]{\begin{center}
\includegraphics[height=0.2\textheight]{#1}\\
\addtocounter{nrrysunku}{1}
\textsl{Rysunek \arabic{chapter}.\arabic{nrrysunku}. #2}

\addcontentsline{lof}{figure}
{
\numberline {\arabic{chapter}.\arabic{nrrysunku}}
{\ignorespaces #2}
}
\end{center}
}

\newcommand{\nw}[1]{\emph{#1}}
\newcommand{\url}[1]{\emph{#1}}
\newtheorem{twr}{Twierdzenie}
\newtheorem{zal}[twr]{Założenie}
\newtheorem{lem}[twr]{Lemat}


\def\shorttitlePL#1   {\gdef\@shorttitlePL{#1}}
\def\shorttitleEN#1   {\gdef\@shorttitleEN{#1}}
\def\shortauthor#1    {\gdef\@shortauthor{#1}}
\def\titlePL#1        {\gdef\@titlePL{#1}}
\def\titleEN#1        {\gdef\@titleEN{#1}}
\def\facultyEN#1      {\gdef\@facultyEN{#1}}
\def\facultyPL#1      {\gdef\@facultyPL{#1}}
\def\thesistypePL#1   {\gdef\@thesistypePL{#1}}
\def\thesistypeEN#1   {\gdef\@thesistypeEN{#1}}
\def\supervisorPL#1   {\gdef\@supervisorPL{#1}}
\def\supervisorEN#1   {\gdef\@supervisorEN{#1}}
\def\acknowledgements#1   {\gdef\@acknowledgements{#1}}
\def\departmentPL#1   {\gdef\@departmentPL{#1}}
\def\departmentEN#1   {\gdef\@departmentEN{#1}}

\newcommand{\titlepages}{%

\newpage \titlepage 

\begin{center}

{\Large{\bfseries{Akademia G\'{o}rniczo-Hutnicza\\[1mm]
im. Stanis\l{}awa Staszica w Krakowie}}

\vspace*{1mm}\rule{\textwidth}{1mm}\vspace*{1mm}

{\large \@facultyPL}\\\vspace*{2mm}
{\large{\@departmentPL}}}\vspace*{1cm}

\includegraphics[width=2.8cm]{agh.jpg}
\vspace*{1.2cm}

{\huge\scshape \@thesistypePL}\\\vspace*{1cm}

{\LARGE{\bfseries \@titlePL}}\\\vspace*{1cm}

{\LARGE {\@author}}\\\vspace*{1cm}


  \large{\scshape Promotor:} \@supervisorPL\vspace{.2cm}\\
  \large{\scshape Promotor pomocniczy:} dr inż. Jacek Dajda


\vspace*{10mm}

\vfill{\Large Krak\'{o}w \@date}

\end{center}

\clearpage

% \titlepage \vspace*{15cm} \vfill

% \begin{flushright}
% \begin{minipage}[!h]{12cm}
% \mbox{\large{\scshape \textbf{O\'SWIADCZENIE AUTORA PRACY}}}\\[3mm] 
% {\scshape O\'swiadczam, \'swiadomy odpowiedzialno\'sci karnej za po\'swiadczenie nieprawdy, \.ze niniejsz\k{a} prac\k{e} dyplomow\k{a} wykona\l{}em osobi\'scie i samodzielnie, i nie korzysta\l{}em ze \'zr\'ode\l{} innych ni\.z wymienione w pracy.}\\
% \end{minipage}

% \vspace{2cm}

% \makebox[6cm][s]{\dotfill}\par
% \makebox[6cm][c]{\small PODPIS}

% \end{flushright}

%\clearpage \titlepage
%
%\begin{center}
%
%{\sffamily{\Large{\bfseries{\textsc AGH\\[2mm]
%University of Science and Technology in Krakow}}}
%
%\vspace*{1mm}\rule{\textwidth}{1mm}\vspace*{1mm}
%
%{\large \@facultyEN}\\\vspace*{2mm}
%{\large{\@departmentEN}}}\vspace*{1cm}
%
%\ifpdflatex\includegraphics[scale=0.3]{agh}
%\else\includegraphics[scale=0.7]{agh}
%\fi
%\vspace*{1cm}
%
%{\huge\scshape \@thesistypeEN}\\\vspace*{2cm}
%
%{\LARGE{\sffamily{\bfseries \@titleEN}}}\\\vspace*{2cm}
%
%{\LARGE {\sffamily\@author}}\\\vspace*{3cm}
%
%\begin{flushright}
%\begin{minipage}[!h]{6.2cm} 
%  \large{\scshape Supervisor:}\\ {\sffamily\@supervisorEN}
%\end{minipage}
%\end{flushright}
%
%\vfill{\Large {\sffamily Krakow \@date}}
%
%\end{center}

\clearpage \titlepage

 \vspace*{15cm} \vfill
 \pagebreak
\vspace*{\fill}
\begin{flushright} 
\begin{minipage}[!h]{11cm}
{\@acknowledgements}
\end{minipage}
\end{flushright}
\thispagestyle{empty}
\clearpage

\setcounter{page}{4}

}