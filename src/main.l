
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[\"][0-9a-zA-Z[:space:]]+[\"] {return nome;}

[0-9]+[\.]*[0-9]* {return numero;}

[\{] {return ch1;}
[\}] {return ch2;}

[\[] {return c1;}
[\]] {return c2;}

[,] {return v;}
[\:] {return dp;}

[\n]+ {return barran;}

[[:space:]]+ ;

.

%%

int yywrap() {
  return 1;
}
