%{
    #include <stdio.h>
    %}
    
    %%
    [0-9]+  { printf("%s\n", yytext); }  // Print numbers found
    .       ;  // Ignore other characters
    %%
    
    int main() {
        yylex();  // Start lexical analysis

        return 0;
    }
    
    int yywrap() {
        return 1;  // Indicate end of input
    }
    