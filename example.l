%x MULTI_COMMENT



%{
int line_count = 1;
}%

	
"/*" {BEGIN(MULTI_COMMENT);}
<MULTI_COMMENT>"*/" {BEGIN(INITIAL);}
<MULTI_COMMENT>\n {line_count++;}
<MULTI_COMMENT>. { }


"//".*"\n" {line_count++;}			
"\n" {line_count++;}



{IDENTIFIER} {printf("IDENTIFIER %s\n",yytext);}
"."{IDENTIFIER} {printf("SWIZZLE %s\n",yytext);}


" "* { }