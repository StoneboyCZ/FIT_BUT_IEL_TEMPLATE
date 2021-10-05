# Šablona pro projekt IEL, verze 2021/01

Tento dokument popisuje použití šablony pro projekt IEL.

## Použití
### Overleaf
Pro import do Overleafu odstraňte ze stažené šablony adresář `packages` a soubor `latexmkrc` a takto upravenou šablonu znovu zabalte jako zip. Poté stačí v přehledu projektů kliknout na tlačítko New project (Nový projekt) --> Upload --> přetáhnout zip. Šablona bude připravena k použití. Přejmenujte si nově vytvořený projekt svým loginem.

### Lokálně 
Stačí rozbalit zip archiv do libovolné složky. Lze překládat i z příkazové řádky. Pro tuto šablonu stačí:
```
pdflatex 00-projekt.tex xlogin00.pdf

pdflatex 00-projekt.tex xlogin00.pdf
```
Pokud chcete použít balík circuitikz s parametry v šabloně, použijte:

`latexmk -pdf 00-projekt.tex`

příkaz `latexmk` přeloží projekt s balíkem circuitikz, který je přiložený k šabloně.

### Merlin
Distribuce LaTeXu je nainstalována i na serveru merlin. Pro překlad šablony na merlinovi můžete použít stejné příkazy jako ty použité v sekci Lokálně.

# Struktura šablony
V této části souboru README je stručně představena struktura šablony.

* fig
  Adresář s obrázky. Obsahuje logo FIT VUT v české a anglické verzi obvody k jednotlivým příkladům
* packages
  Adresář s balíky, které nemusí být součástí instalace LaTeXu (např. na merlinovi). Aktuálně je přiložena nejnovější verze balíku circuitikz. Lze přidávat i další balíky podle potřeby.
* kořenový adresář
  V kořenovém adresáři se nachází následující soubory, které modifikují studenti :
  * 00-projekt.tex 
     Základní soubor šablony. Obsahuje základní nastavení, vkládá se v něm hlavička a dokumenty s příklady. Kromě hlavičky a případného nastavení jazyka není třeba tento soubor měnit.
  * 01-pr1.tex -- 05-pr5.tex
     Soubory, které obsahují jednotlivé příklady. Parametr příkazů prvniZadani, druhyZadani určuje, jaké zadání se vysazí do tabulky se zadáním a jaká skupina se doplní do odpovědní tabulky.
  * 06-tab.tex
     Soubor, který obsahuje odpovědní tabulku. Skupiny by se měly doplnit automaticky, doplňujete pouze výsledky a jednotky.
* Další soubory v kořenovém adresáři, které není třeba modifikovat:
  * fitiel.cls
     Definice stylu dokumentu. 
  * latexmkrc
     Nastavení pro utilitu latexmk (umístění balíků, podsložka packages). 
  * README.md
     Tento dokument.

# Další zdroje informací
Velmi doporučuji webovou knihu https://en.wikibooks.org/wiki/LaTeX, pokud s LaTeXem začínáte. Pokud řešíte problémy, google.

# Autor
Za šablonnu zodpovídá výhradně ing. Petr Veigend (iveigend@fit.vut.cz), dotazy směřujte prosím výhradně na něj. 
