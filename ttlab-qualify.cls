%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TTLAB-Qualifikations- und -Hausarbeiten
% Version 1.0 (6/6/16)
%
% Author:
% Andy Lücking
%
% License:
% CC BY-SA 4.0 http://creativecommons.org/licenses/by-sa/4.0/
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ttlab-qualify}[02/06/2016, v1.0 LaTeX-Vorlage für Qualifikations- und Hausarbeiten an der AG Texttechnologie]

\RequirePackage{etoolbox}
\newbool{minted}
\newbool{nomencl}
\newbool{algorithm}
\newbool{nolibertine}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}

\DeclareOption{minted}{
  \booltrue{minted}
}

\DeclareOption{nomencl}{
  \booltrue{nomencl}
}

\DeclareOption{algorithm}{
  \booltrue{algorithm}
}

\DeclareOption{nolibertine}{
  \booltrue{nolibertine}
}

\DeclareOption{ngerman}{
  \PassOptionsToPackage{\CurrentOption}{babel}
}

\DeclareOption{english}{
  \PassOptionsToPackage{\CurrentOption}{babel}
}

\DeclareOption*{%
  \PackageWarning{ttlab-qualify}{Unknown option '\CurrentOption'}%
}

\ExecuteOptions{ngerman}
\ProcessOptions*\relax

\LoadClass[pagesize=auto, paper=a4, titlepage=on, fontsize=12pt, bibliography=totoc, headings=small, captions=tableheading]{scrreprt}


\ifbool{nolibertine}{}{
  \RequirePackage{xltxtra}
  \setromanfont[Mapping=tex-text]{Linux Libertine O} % Serifenschrift
  \setsansfont[Mapping=tex-text]{Linux Biolinum O} % serifenlose Schrift
  \setmonofont[Scale=MatchLowercase]{DejaVu Sans Mono}%
}

\RequirePackage{babel}
\RequirePackage[autostyle=true]{csquotes}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{booktabs}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
%style=authoryear
\RequirePackage[style=numeric, maxnames=10, maxcitenames=2, backend=biber]{biblatex}


\ifbool{minted}{\RequirePackage{minted}}{}
\ifbool{nomencl}{\RequirePackage[intoc]{nomencl}\makenomenclature}{}
\ifbool{algorithm}{\RequirePackage[linesnumbered]{algorithm2e}}{}

% predefined "Erklärung" from Prüfungsamt
\dedication{\textbf{\sffamily Erklärung}\\\small{gemäß Bachelor-Ordnung Informatik 2011 §25 Abs. 11}\par\bigskip
\begin{minipage}{\linewidth}\large\par\vskip2cm
Hiermit erkläre ich Frau \par\vskip1cm
\rule{13cm}{0.6pt}\par
\vskip1cm
Die vorliegende Arbeit habe ich selbständig und ohne Benutzung anderer als der angegebenen Quellen und Hilfsmittel verfasst.\par\vskip3cm
Frankfurt am Main, den \rule{6cm}{0.6pt}\par
\vskip3cm
\rule{8cm}{0.6pt}\\
Unterschrift
\end{minipage}
}

% reduce fontsize in quotation environments:
\expandafter\def\expandafter\quote\expandafter{\quote\footnotesize}
\expandafter\def\expandafter\quotation\expandafter{\quote\footnotesize}

\endinput