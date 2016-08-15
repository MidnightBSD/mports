/*-
Copyright (C) 2008  Lucas Holt All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

$MidnightBSD$
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "mysql.h"

int mysql_exec_sql(MYSQL *mysql,const char *create_definition)
{
   return mysql_real_query(mysql,create_definition,strlen(create_definition));
}

int main(int argc, char *argv[])
{

    MYSQL mysql;
    MYSQL_RES *result;
    MYSQL_ROW row;
    unsigned int num_fields;
    char query_def[1000];
    char *ln;
    int runid;

    if (argc != 2)
    {
        fprintf( stderr, "Usage: %s <run id>\n", argv[0] );
        exit(1);
    }

    runid = atoi(argv[1]);
    if (runid < 1)
    {
        fprintf( stderr, "Invalid run id %d\n", runid);
        exit(1);
    }

    if(mysql_init(&mysql)==NULL)
    {
         fprintf(stderr, "Failed to initate MySQL connection\n");
         exit(1);
    }

    if (!mysql_real_connect(&mysql,"db.midnightbsd.org","user","pass",NULL,0,NULL,0)) 
    {
        fprintf( stderr, "Failed to connect: Error: %s\n", mysql_error(&mysql));
        exit(1);
    }

    if(mysql_select_db(&mysql,"magus")!=0)
        fprintf( stderr, "Failed to connect to Database: Error: %s\n", mysql_error(&mysql));
    
    sprintf(query_def,"select CONCAT(pkgname,'.tbz'), CONCAT(CONCAT_WS( '-', pkgname, version),'.tbz')  from ports where run=%d AND status!='internal' AND status!='untested' AND status!='fail' ORDER BY pkgname;", runid);

    if(mysql_exec_sql(&mysql,query_def)==0)/*success*/
    {
        printf( "%ld Record Found\n",(long) mysql_affected_rows(&mysql));
        result = mysql_store_result(&mysql);
    
        if (result)  // there are rows
        {
            num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result))) 
            { 
	       //unsigned long *lengths = mysql_fetch_lengths(result);
               if (num_fields == 2 && row[0] && row[1])
               {
                   asprintf(&ln, "ln -s ../All/%s Latest/%s", row[1], row[0] );
                   if (ln) 
                   {
                       system(ln);
                       free(ln);
                   }
               }
               printf("\n"); 
            }
            mysql_free_result(result);
        }
        else
            if(mysql_field_count(&mysql) > 0)
                fprintf( stderr, "Error getting records: %s\n", mysql_error(&mysql));
    }
    else
        fprintf( stderr, "Failed to find any records and caused an error: %s\n", mysql_error(&mysql));
    
    mysql_close(&mysql);

    return 0;
}
