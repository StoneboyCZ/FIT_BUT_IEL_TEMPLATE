%%% Nepovinná šablona pro projekty IEL %%%
%%% Verze: 2019/01 %%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fitiel}[2022/10/06 IEL project class]

\pdfminorversion=7

% základní třída, odvozujeme ze třídy article
\LoadClass[a4paper,11pt]{article}

% nastavení parametrů
\newif\ifczech \let\ifczech\iftrue
\newif\ifslovak \let\ifslovak\iffalse
\newif\ifenglish \let\ifenglish\iffalse

\DeclareOption{english}{\let\ifenglish\iftrue\let\ifczech\iffalse}
\DeclareOption{slovak}{\let\ifslovak\iftrue\let\ifczech\iffalse}
\DeclareOption*{}
\ProcessOptions\relax

% odstranění čísla částí (sections) z nadpisů
\renewcommand{\@seccntformat}[1]{}

%% základní balíčky - šablona
\RequirePackage{ifthen}

%% základní balíčky - dokument
\RequirePackage[left=2cm,text={17cm, 24cm},top=3cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{float}

% utf-8
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}

% matematika
\RequirePackage{amsmath}

% klikatelné odkazy (sekce v obsahu)
\RequirePackage[unicode]{hyperref}

% kreslení obvodů 
\usepackage[european,straightvoltages,betterproportions,EFvoltages]{circuitikz}

% jednotky
\usepackage{siunitx}
%%

%% logo a nastavení správného jazyka pro dokument
% čeština
\ifczech
    \usepackage[czech]{babel}
    \newcommand{\logo}{
        \includegraphics[scale=0.1,keepaspectratio]{fig/logo_cz.png}
    }
\else
\fi

% slovenština
\ifslovak
    \usepackage[slovak]{babel}
    \newcommand{\logo}{
        \includegraphics[scale=0.1,keepaspectratio]{fig/logo_cz.png}
    }
\else
\fi

% angličtina
\ifenglish
    \usepackage[english]{babel}
    \newcommand{\logo}{
        \includegraphics[scale=0.1,keepaspectratio]{fig/logo_en.png}
    }
\else
\fi

\AtEndOfClass{
    % použité značky 
    \newcommand{\Vo}{\si \volt}
    \newcommand{\Am}{\si \ampere}
    \newcommand{\uF}{\si {\micro\farad}}
    \newcommand{\mH}{\si {\milli\henry}}
    \newcommand{\Hz}{\si \hertz}
    \newcommand{\F}{\si \farad}
    \newcommand{\s}{\si \second}
    \newcommand{\He}{\si \henry}
    
    % prvni priklad

    \newcommand{\prvniZadani}[1]{
        \def\prvniSkupina{#1}
        Stanovte napětí $U_{R7}$ a proud $I_{R7}$. Použijte metodu postupného zjednodušování obvodu. \\
        
        \begin{tabular}{|c|c|c|c|c|c|c|c|c|c|c|} \hline
sk. & $U_1$ [\Vo] & $U_2$ [\Vo]  & $R_1$ [$\Omega$] & $R_2$ [$\Omega$] & $R_3$ [$\Omega$] & $R_4$ [$\Omega$] & $R_5$ [$\Omega$] & $R_6$ [$\Omega$] & $R_7$ [$\Omega$] & $R_8$ [$\Omega$] \\ \hline
    \ifthenelse{\equal{#1}{A}}
    {A & 80 & 120 & 350 & 650 & 410 & 130 & 360 & 750 & 310 & 190}{}
    \ifthenelse{\equal{#1}{B}}
    {B & 95 & 115 & 650 & 730 & 340 & 330 & 410 & 830 & 340 & 220}{}
    \ifthenelse{\equal{#1}{C}}
    {C & 100 & 80 & 450 & 810 & 190 & 220 & 220 & 720 & 260 & 180}{}
    \ifthenelse{\equal{#1}{D}}
    {D & 105  & 85 & 420 & 980 & 330 & 280 & 310 & 710 & 240 & 200}{}
    \ifthenelse{\equal{#1}{E}}
    {E & 115 & 55 & 485 & 660 & 100 & 340 & 575 & 815 & 255 & 225}{}
    \ifthenelse{\equal{#1}{F}}
    {F & 125 & 65 & 510 & 500 & 550 & 250 & 300 & 800 & 330 & 250}{}
    \ifthenelse{\equal{#1}{G}}
    {G & 130 & 60 & 380 & 420 & 330 & 440 & 450 & 650 & 410 & 275}{}
    \ifthenelse{\equal{#1}{H}}
    {H & 135 & 80 & 680 & 600 & 260 & 310 & 575 & 870 & 355 & 265}{}
    \\ \hline \end{tabular} \\
    
    \includegraphics[scale=0.5,keepaspectratio]{fig/Pr1.pdf} \\ 
    }
        
    % druhy priklad
    \newcommand{\druhyZadani}[1]{
        \def\druhySkupina{#1}
        Stanovte napětí $U_{R6}$ a proud $I_{R6}$. Použijte metodu Théveninovy věty. \\
        
        \begin{tabular}{|c|c|c|c|c|c|c|c|} \hline
sk. & $U_1$ [\Vo] & $R_1$ [$\Omega$] & $R_2$ [$\Omega$] & $R_3$ [$\Omega$] & $R_4$ [$\Omega$] & $R_5$ [$\Omega$] & $R_6$ [$\Omega$]\\ \hline
    \ifthenelse{\equal{#1}{A}}
    {A & 50 & 525 & 620 & 210 & 530 & 50 & 100}{}
    \ifthenelse{\equal{#1}{B}}
    {B & 100 & 310 & 610 & 220 & 570 & 100 & 50}{}
    \ifthenelse{\equal{#1}{C}}
    {C & 200 & 220 & 630 & 240 & 450 & 200 & 70}{}
    \ifthenelse{\equal{#1}{D}}
    {D & 150 & 200 & 660 & 200 & 550 & 150 & 200}{}
    \ifthenelse{\equal{#1}{E}}
    {E & 250 & 335 & 625 & 245 & 600 & 300 & 150}{}
    \ifthenelse{\equal{#1}{F}}
    {F & 130 & 350 & 600 & 195 & 650 & 80 & 180}{}
    \ifthenelse{\equal{#1}{G}}
    {G & 180 & 315 & 615 & 180 & 460 & 120 & 250}{}
    \ifthenelse{\equal{#1}{H}}
    {H & 220 & 360 & 580 & 205 & 560 & 250 & 190}{}
    \\ \hline \end{tabular} \\
    
    \includegraphics[scale=0.5,keepaspectratio]{fig/Pr2.pdf} \\
    }

    % treti priklad
    \newcommand{\tretiZadani}[1]{
        \def\tretiSkupina{#1}
        Stanovte napětí $U_{R5}$ a proud $I_{R5}$. Použijte metodu uzlových napětí ($U_A$, $U_B$, $U_C$). 
        
        \begin{tabular}{|c|c|c|c|c|c|c|c|c|c|} \hline
sk. & $U$ [\Vo] & $I_1$ [\Am] & $I_2$ [\Am] & $R_1$ [$\Omega$] & $R_2$ [$\Omega$] & $R_3$ [$\Omega$] & $R_4$ [$\Omega$] & $R_5$ [$\Omega$] & $R_6$ [$\Omega$] \\ \hline
    \ifthenelse{\equal{#1}{A}}
    {A & 120 & 0.5  & 0.7  & 530 & 490 & 650 & 390 & 320 & 480}{}
    \ifthenelse{\equal{#1}{B}}
    {B & 150 & 0.7  & 0.8  & 490 & 450 & 610 & 340 & 340 & 550}{}
    \ifthenelse{\equal{#1}{C}}
    {C & 110 & 0.9  & 0.75 & 440 & 310 & 560 & 200 & 300 & 600}{}
    \ifthenelse{\equal{#1}{D}}
    {D & 115 & 0.6  & 0.9  & 500 & 380 & 480 & 370 & 280 & 450}{}
    \ifthenelse{\equal{#1}{E}}
    {E & 135 & 0.2  & 0.65 & 520 & 420 & 520 & 420 & 210 & 400}{}
    \ifthenelse{\equal{#1}{F}}
    {F & 145 & 0.4  & 0.85 & 480 & 440 & 530 & 360 & 250 & 700}{}
    \ifthenelse{\equal{#1}{G}}
    {G & 160 & 0.35 & 0.45 & 460 & 410 & 540 & 330 & 290 & 650}{}
    \ifthenelse{\equal{#1}{H}}
    {H & 130 & 0.95 & 0.5  & 470 & 390 & 580 & 280 & 250 & 350}{}
    \\ \hline \end{tabular} \\
    
    \includegraphics[scale=0.5,keepaspectratio]{fig/Pr3.pdf} \\
    }
    
    % ctvrty  priklad
    \newcommand{\ctvrtyZadani}[1]{
        \def\ctvrtySkupina{#1}
        Pro napájecí napětí platí: $u_1=U_1{\cdot}\sin(2{\pi}ft)$, $u_2=U_2{\cdot}\sin(2{\pi}ft)$.\\
Ve vztahu pro napětí $u_{C_{2}}=U_{C_2}{\cdot}\sin(2{\pi}ft+\varphi_{C_{2}})$
určete $|U_{C_{2}}|$ a $\varphi_{C_{2}}$. Použijte metodu smyčkových proudů.\\

Pozn: Pomocné směry šipek napájecích zdrojů platí pro speciální časový okamžik ($t=\frac{\pi}{2{\omega}}$).
        
        \begin{tabular}{|c|c|c|c|c|c|c|c|c|c|} \hline
sk. & $U_1$ [\Vo] & $U_2$ [\Vo] & $R_1$ [$\Omega$] & $R_2$ [$\Omega$] & $L_{1}$ [\mH] & $L_{2}$ [\mH] & $C_1$ [$\uF$] & $C_2$ [$\uF$] & $f$ [\Hz] \\ \hline
    \ifthenelse{\equal{#1}{A}}
    {A & 3 & 5 & 120 & 140 & 120 & 100 & 200 & 105 & 70}{}
    \ifthenelse{\equal{#1}{B}}
    {B & 2 & 4 & 110 & 150 & 100 &  85 & 220 &  95 & 80}{}
    \ifthenelse{\equal{#1}{C}}
    {C & 3 & 4 & 100 & 130 & 220 &  70 & 230 &  85 & 75}{}
    \ifthenelse{\equal{#1}{D}}
    {D & 4 & 5 & 130 & 150 & 180 &  90 & 210 &  75 & 85}{}
    \ifthenelse{\equal{#1}{E}}
    {E & 5 & 3 & 140 & 130 & 130 &  60 & 100 &  65 & 90}{}
    \ifthenelse{\equal{#1}{F}}
    {F & 2 & 3 & 120 & 100 & 170 &  80 & 150 &  90 & 65}{}
    \ifthenelse{\equal{#1}{G}}
    {G & 5 & 5 & 130 & 120 & 140 &  60 & 160 &  80 & 60}{}
    \ifthenelse{\equal{#1}{H}}
    {H & 5 & 6 & 100 & 100 & 160 &  75 & 155 &  70 & 95}{}
    \\ \hline \end{tabular} \\
    \includegraphics[scale=0.5,keepaspectratio]{fig/Pr4.pdf} \\
    }

    % paty priklad
    \newcommand{\patyZadani}[1]{
        \def\patySkupina{#1}
        V obvodu na obrázku níže v čase $t=0$ [\s] sepne spínač $S$. Sestavte diferenciální rovnici popisující chování obvodu na obrázku, dále ji upravte dosazením hodnot parametrů. Vypočítejte analytické řešení ${i_{L}=f(t)}$. Proveďte kontrolu výpočtu dosazením do sestavené diferenciální rovnice.\\
        
        \begin{tabular}{|c|c|c|c|c|} \hline
        sk. & $U$ [\Vo] & $L$ [\He] & $R$ [$\Omega$] & $i_L(0)$ [\Am] \\ \hline
    \ifthenelse{\equal{#1}{A}}
    {A & 30 & 5  & 150 & 1}{}
    \ifthenelse{\equal{#1}{B}}
    {B & 20 & 2  & 100 & 2}{}
    \ifthenelse{\equal{#1}{C}}
    {C & 10 & 4  & 200 & 5}{}
    \ifthenelse{\equal{#1}{D}}
    {D & 60 & 3  & 120 & 3}{}
    \ifthenelse{\equal{#1}{E}}
    {E & 50 & 5  & 500 & 4}{}
    \ifthenelse{\equal{#1}{F}}
    {F & 70 & 10 & 350 & 7}{}
    \ifthenelse{\equal{#1}{G}}
    {G & 40 & 8  & 160 & 6}{}
    \ifthenelse{\equal{#1}{H}}
    {H & 90 & 5  & 450 & 8}{}
    \\ \hline \end{tabular} \\
    \includegraphics[scale=0.5,keepaspectratio]{fig/Pr5.pdf} \\
    }
    
}