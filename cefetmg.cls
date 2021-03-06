% ------------------------------------------------------------------------------
% Centro Federal de Educação Tecnológica de Minas Gerais - CEFET-MG
%
% Modelo de trabalho acadêmico em conformidade com as normas da ABNT
% (Tese de Doutorado, Dissertação de Mestrado ou Projeto de Qualificação)
%
% Projeto hospedado em: https://github.com/cfgnunes/latex-cefetmg
%
% Autores: Cristiano Nunes <cfgnunes@gmail.com>
%          Henrique Borges <henrique@cefetmg.br>
% ------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cefetmg}[2020/12/02 v8.0]

% Repassa os parâmetros ao abntex2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}

\PassOptionsToClass{%
% Opções da classe memoir
    12pt,                  % Tamanho da fonte
    openright,             % Capítulos começam sempre em páginas ímpares
                           % (insere página vazia caso necessário)
    a4paper,               % Tamanho do papel
    sumario=tradicional,   % Seleciona o sumário tradicional
% Opções do pacote babel
    brazil,                % Idioma do documento
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

\RequirePackage[brazilian, hyperpageref]{backref} % Índice nas referências
\RequirePackage{chngcntr}
\RequirePackage{etoolbox}

% ------------------------------------------------------------------------------
% Configurações gerais
% ------------------------------------------------------------------------------

% Retira o espaço extra desnecessário nas frases
\frenchspacing

% Configurações do pacote backref usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}

% Texto padrão antes do número das páginas
\renewcommand{\backref}{}

% Define os textos da citação
\renewcommand*{\backrefalt}[4]{%
    \ifcase #1
        Nenhuma cita\c{c}\~ao no texto.
    \or
        Citado na p\'agina #2.
    \else
        Citado #1 vezes nas p\'aginas #2.
    \fi
}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% Adiciona espaço entre as equações
\AtEndEnvironment{equation}{%
    \vspace{8pt}
}

% Padroniza o tamanho dos captions das figuras
\captiontitlefont{\normalsize}
\captionnamefont{\normalsize}
\subcaptionsize{\normalsize}
\subcaptionlabelfont{\normalsize}
\subcaptionfont{\normalsize}

% Coloca quadros sempre no topo da página (em páginas vazias)
\setlength{\@fptop}{0pt}

% Coloca floats sempre acima do rodapé
\feetbelowfloat

% Coloca rodapés sempre no final da página
\renewcommand\footnoterule{%
    \vspace*{\fill}%
    \kern-3\p@%
    \hrule%
    \kern2.6\p@%
}

% Autoref para equações
\def\equationautorefname~#1\null{Equa\c c\~ao~(#1)\null}

% ------------------------------------------------------------------------------
% Comandos
% ------------------------------------------------------------------------------

% Comando: Programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Comando: Subtítulo do trabalho
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Comando: Instituição do orientador
\providecommand{\imprimirinstOrientador}{}
\newcommand{\instOrientador}[1]{\renewcommand{\imprimirinstOrientador}{#1}}

% Comando: Instituição do coorientador
\providecommand{\imprimirinstCoorientador}{}
\newcommand{\instCoorientador}[1]{\renewcommand{\imprimirinstCoorientador}{#1}}

% Comando: Tipo de trabalho acadêmico
% (tese, dissertação ou projeto de qualificação)
\providecommand{\imprimirprojeto}{}
\newcommand{\projeto}[1]{\renewcommand{\imprimirprojeto}{#1}}

% Comando: Título acadêmico a ser alcançado (Doutor ou Mestre)
\providecommand{\imprimirtituloAcademico}{}
\newcommand{\tituloAcademico}[1]{\renewcommand{\imprimirtituloAcademico}{#1}}

% Comando: Área de concentração do Programa
\newcommand{\imprimirareaconcentracaoRotulo}{\'Area de concentra\c{c}\~ao: }
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\renewcommand{\imprimirareaconcentracao}{#1}}

% Comando: Linha de pesquisa do Programa
\newcommand{\imprimirlinhapesquisaRotulo}{Linha de pesquisa: }
\providecommand{\imprimirlinhapesquisa}{}
\newcommand{\linhapesquisa}[1]{\renewcommand{\imprimirlinhapesquisa}{#1}}

% Comando: Texto da folha de aprovação
\providecommand{\imprimirtextopadraofolhadeaprovacao}{}
\newcommand{\textopadraofolhadeaprovacao}[1]%
    {\renewcommand{\imprimirtextopadraofolhadeaprovacao}{#1}}

% Comando: Logomarca da instituição
\providecommand{\imprimirlogoinstituicao}{}
\newcommand{\logoinstituicao}[2]{\renewcommand{\imprimirlogoinstituicao}%
    {\includegraphics[width={#1}\textwidth]{#2}}}

% Comando: Imprimir lista de figuras
\newcommand{\imprimirlistafiguras}{%
    \pdfbookmark[0]{\listfigurename}{lof}
    \listoffigures*
    \cleardoublepage
}

% Comando: Imprimir lista de tabelas
\newcommand{\imprimirlistatabelas}{%
    \pdfbookmark[0]{\listtablename}{lot}
    \listoftables*
    \cleardoublepage
}

% Comando: Imprimir lista de quadros
\newcommand{\imprimirlistaquadros}{%
    \pdfbookmark[0]{\listofquadrosname}{loq}
    \listofquadros*
    \cleardoublepage
}

% Comando: Imprimir sumário
\newcommand{\imprimirsumario}{%
    \pdfbookmark[0]{\contentsname}{toc}
    \tableofcontents*
    \cleardoublepage
}

% Comando: Imprimir lista de quadros
\newcommand{\imprimirlistaalgoritmos}{%
    \newcommand{\algoritmoname}{Algoritmo}
    \renewcommand{\listalgorithmcfname}{Lista de Algoritmos}

    \floatname{algocf}{\algoritmoname}
    \newlistof{listofalgoritmos}{loa}{\listalgoritmoname}
    \newlistentry{algocf}{loa}{0}

    \counterwithout{algocf}{chapter}
    \renewcommand{\cftalgocfname}{\algoritmoname\space}
    \renewcommand*{\cftalgocfaftersnum}{\hfill--\hfill}

    \pdfbookmark[0]{\listalgorithmcfname}{loa}
    \listofalgorithms
    \cleardoublepage
}

% Comando: Imprimir referências
\newcommand{\imprimirreferencias}{%
    % Carrega o arquivo "referencias.bib" com as referências do trabalho
    \bibliography{referencias}{}
    % Define o estilo ABNT para formatar a lista de referências
    \bibliographystyle{abntex2-alf}
}

% Comando: Imprimir índice remissivo
\newcommand{\imprimirindiceremissivo}{%
    \printindex
}

% ------------------------------------------------------------------------------
% Estilo de elementos
% ------------------------------------------------------------------------------

% Elementos pré-textuais
\renewcommand{\pretextual}{%
    \pagenumbering{roman} % Algarismos romanos
    \aliaspagestyle{chapter}{plain}
    \pagestyle{plain}
    \aliaspagestyle{cleared}{empty}
    \aliaspagestyle{part}{empty}
}

% Configura layout para elementos textuais
\renewcommand{\textual}{%
    \pagenumbering{arabic} % Numeração das páginas em algarismos
                           % arábicos, inciando em 1
    \pagestyle{abntheadings}
    \aliaspagestyle{chapter}{abntchapfirst}
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

% Configura layout para elementos pós-textuais
\renewcommand{\postextual}{%
    \chapterstyle{abnt}
    \phantompart
}

% ------------------------------------------------------------------------------
% Objetos flutuantes
% ------------------------------------------------------------------------------

% Comando que trata a fonte nos objetos flutuantes
\renewcommand{\fonte}[1]{%
    \vspace{4pt}\break%
    \centering\footnotesize{Fonte: #1}
}

% Comando que trata as notas nos objetos flutuantes
\renewcommand{\nota}[1]{%
    \vspace{4pt}\break%
    \begin{tabular}{l p{.85\textwidth}}%
        Nota: & #1
    \end{tabular}
}

% ------------------------------------------------------------------------------
% Parágrafos
% ------------------------------------------------------------------------------

% Tamanho do recuo do parágrafo
\setlength{\parindent}{1.25cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{0.0cm}

% Define espaçamento entre listas
\setlist{noitemsep, topsep=0pt, parsep=0pt, partopsep=0pt}

% ------------------------------------------------------------------------------
% Fontes
% ------------------------------------------------------------------------------

% Redefinição de fontes
\renewcommand{\ABNTEXchapterfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\HUGE}

\renewcommand{\ABNTEXpartfont}{\normalfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\Large}

\renewcommand{\ABNTEXsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\large}

\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% ------------------------------------------------------------------------------
% Sumário
% ------------------------------------------------------------------------------

% Travessão no sumário para apêndices e anexos
\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}

% ------------------------------------------------------------------------------
% Listas
% ------------------------------------------------------------------------------

% Define os títulos das listas
\addto\captionsbrazil{%
% Ajusta nomes padrões do babel
    \renewcommand{\listadesiglasname}{Lista de Abreviaturas e Siglas}
    \renewcommand{\listadesimbolosname}{Lista de S\'{i}mbolos}
    \renewcommand{\listfigurename}{Lista de Figuras}
    \renewcommand{\listtablename}{Lista de Tabelas}
    \renewcommand{\indexname}{\'{I}ndice Remissivo}
% Ajusta nomes usados com a macro \autoref
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{Se\c{c}\~ao}
    \renewcommand{\subsectionautorefname}{Subse\c{c}\~ao}
    \renewcommand{\subsubsectionautorefname}{Subsubse\c{c}\~ao}
    \renewcommand{\paragraphautorefname}{Subse\c{c}\~ao}
}

% Cria a lista de quadros
\newcommand{\listofquadrosname}{Lista de Quadros}
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}

% ------------------------------------------------------------------------------
% Capa
% ------------------------------------------------------------------------------
\makeatletter
\renewcommand{\imprimircapa}{%
    \begin{capa}
        \begin{center}
            \imprimirlogoinstituicao{} \\
            \normalfont\scshape{\imprimirinstituicao} \\
            \normalfont\scshape{\imprimirprograma} \\
        \end{center}

        \vspace*{\fill}

        \begin{center}
            \ABNTEXchapterfont\HUGE\scshape\imprimirtitulo
            \abntex@ifnotempty{\imprimirsubtitulo}{%
                {\ABNTEXchapterfont\HUGE\scshape: }%
                    {\ABNTEXchapterfont\Huge\scshape\imprimirsubtitulo}
            }
        \end{center}

        \vspace*{80pt}

        \begin{center}
            \large\normalfont\scshape\textbf\imprimirautor
        \end{center}

        \vspace*{10pt}

        \begin{center}
            \abntex@ifnotempty{\imprimirorientador}{%
                \small\imprimirorientadorRotulo{} \imprimirorientador \\
                \small\imprimirinstOrientador \\
            }
            \abntex@ifnotempty{\imprimircoorientador}{%
                \begin{SingleSpacing}\par\end{SingleSpacing}
                \small\imprimircoorientadorRotulo{} \imprimircoorientador \\
                \small\imprimirinstCoorientador
            }
        \end{center}

        \vspace*{\fill}

        \begin{center}
            \normalfont\scshape{\imprimirlocal}\\
            \normalfont\scshape{\imprimirdata}
        \end{center}

    \end{capa}
}
\makeatother

% ------------------------------------------------------------------------------
% Folha de rosto
% ------------------------------------------------------------------------------
\makeatletter
\renewcommand{\folhaderostocontent}{%

    \begin{center}
        {\large\normalfont\scshape\textbf\imprimirautor}
    \end{center}

    \vspace*{80pt}

    \begin{center}
        \ABNTEXchapterfont\LARGE\scshape\imprimirtitulo
        \abntex@ifnotempty{\imprimirsubtitulo}{%
            {\ABNTEXchapterfont\LARGE\scshape: }%
                {\ABNTEXchapterfont\Large\scshape\imprimirsubtitulo}
        }
    \end{center}

    \vspace*{90pt}

    \abntex@ifnotempty{\imprimirpreambulo}{%
        \SingleSpacing
        \begin{tabular}{p{.24\textwidth}p{.16\textwidth}p{.4\textwidth}}
            & \multicolumn{2}{p{.6\textwidth}}%
                {\hyphenpenalty=10000\hbadness=10000%
                    {\imprimirpreambulo}%
                } \\ & & \\
            \abntex@ifnotempty{\imprimirareaconcentracao}{%
                & \multicolumn{2}{p{.6\textwidth}}%
                    {\hyphenpenalty=10000\hbadness=10000%
                    {\imprimirareaconcentracaoRotulo\imprimirareaconcentracao}%
                    } \\ & & \\
            }
            \abntex@ifnotempty{\imprimirlinhapesquisa}{%
                & \multicolumn{2}{p{.6\textwidth}}%
                    {\hyphenpenalty=10000\hbadness=10000%
                        {\imprimirlinhapesquisaRotulo\imprimirlinhapesquisa}%
                    } \\ & & \\
            }
            \abntex@ifnotempty{\imprimirorientador}{%
                & \imprimirorientadorRotulo & \imprimirorientador \\
                & & \imprimirinstOrientador \\ & & \\
            }
            \abntex@ifnotempty{\imprimircoorientador}{%
                & \imprimircoorientadorRotulo & \imprimircoorientador \\
                & & \imprimirinstCoorientador
            }
        \end{tabular}
    }

    \vspace*{\fill}

    \begin{center}
        \normalfont\scshape{\imprimirinstituicao}\\
        \normalfont\scshape{\imprimirprograma}\\
        \normalfont\scshape{\imprimirlocal}\\
        \normalfont\scshape{\imprimirdata}
    \end{center}
    \PRIVATEclearpageifneeded
}
\makeatother

% ------------------------------------------------------------------------------
% Folha de aprovação
% ------------------------------------------------------------------------------
\makeatletter
\newcommand{\imprimirfolhadeaprovacao}{%
    \begin{folhadeaprovacao}
        \vspace*{\fill}

        \begin{tabular}{p{.4\textwidth}p{.45\textwidth}}
            & \imprimirtextopadraofolhadeaprovacao \\
        \end{tabular}

        \vspace*{\fill}
    \end{folhadeaprovacao}
    \PRIVATEclearpageifneeded
}
\makeatother

% ------------------------------------------------------------------------------
% Dedicatória
% ------------------------------------------------------------------------------
\renewenvironment{dedicatoria}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
    \PRIVATEclearpageifneeded
}

% ------------------------------------------------------------------------------
% Epígrafe
% ------------------------------------------------------------------------------
\renewenvironment{epigrafe}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
    \PRIVATEclearpageifneeded
}
