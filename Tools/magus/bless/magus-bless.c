/*-
Copyright (C) 2008, 2010, 2011  Lucas Holt All rights reserved.

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

$MidnightBSD: mports/Tools/magus/bless/magus-bless.c,v 1.1 2011/02/26 00:35:59 laffer1 Exp $
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <err.h>

#include "mysql.h"
#include "sqlite3.h"

#define DB_HOST "db.midnightbsd.org"
#define DB_DATABASE "magus"

/* MYSQL */
int mysql_exec_sql(MYSQL *, const char *);

/* SQLITE3 */
sqlite3* open_indexdb(int runid);
void close_indexdb(sqlite3 *db);
int exec_indexdb(sqlite3 *db, const char *fmt, ...);
void create_indexdb(sqlite3 *db);

int
main(int argc, char *argv[])
{
    MYSQL mysql;
    MYSQL_RES *result;
    MYSQL_ROW row;
    unsigned int num_fields;
    char query_def[1000];
    char *ln;
    int runid;
    sqlite3 *db;

    if (argc != 4)
    {
        fprintf( stderr, "Usage: %s <run id> <mysql_user> <mysql_pass>\n", argv[0] );
        exit(1);
    }

    runid = atoi(argv[1]);
    if (runid < 1)
    {
        fprintf( stderr, "Invalid run id %d\n", runid);
        exit(1);
    }

    if (mysql_init(&mysql) == NULL)
    {
         fprintf(stderr, "Failed to initate MySQL connection\n");
         exit(1);
    }

    if (!mysql_real_connect(&mysql, DB_HOST, argv[2], argv[3], NULL, 0, NULL, 0)) 
    {
        fprintf( stderr, "Failed to connect: Error: %s\n", mysql_error(&mysql));
        exit(1);
    }

    if (mysql_select_db(&mysql, DB_DATABASE) != 0)
        fprintf(stderr, "Failed to connect to Database: Error: %s\n", mysql_error(&mysql));
    
    sprintf(query_def,
      "select pkgname, name, license, description, CONCAT(CONCAT_WS( '-', pkgname, version),'.tbz'), version  from ports where run=%d AND status!='internal' AND status!='untested' AND status!='fail' ORDER BY pkgname;",
      runid);

    if (mysql_exec_sql(&mysql, query_def)==0)/*success*/
    {
        printf( "%ld Record Found\n",(long) mysql_affected_rows(&mysql));
        result = mysql_store_result(&mysql);
    
        if (result)
        {
            db = open_indexdb(runid);
            create_indexdb(db);

            num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result))) 
            { 
               if (row[2] == NULL)
			printf("license missing for %s\n", row[0]);
               if (num_fields == 6 && row[0] && row[1] && row[2] && row[3] && row[4])
               {
                   asprintf(&ln, "%s: %s %s %s %s %s", row[0], row[1], row[2], row[3], row[5], row[4]);
                   if (ln) 
                   {
                      sqlite3_stmt *stmt;
                      if (sqlite3_prepare_v2(db, 
                       "INSERT INTO packages (pkg, version, license, comment, www, bundlefile) VALUES(?,?,?,?,?,?)",
                       -1, &stmt, 0) != SQLITE_OK)
                       {
                          errx(1, "Could not prepare statement");
                       }
                       sqlite3_bind_text(stmt, 1, row[0], strlen(row[0]), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 2, row[5], strlen(row[5]), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 3, row[2], strlen(row[2]), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 4, row[3], strlen(row[3]), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 5, "", 1, SQLITE_STATIC);
                       sqlite3_bind_text(stmt, 6, row[4], strlen(row[4]), SQLITE_TRANSIENT);

                       if (sqlite3_step(stmt) != SQLITE_DONE)
                          errx(1,"Could not execute query");
                       sqlite3_reset(stmt);
                       sqlite3_finalize(stmt);

                      if (sqlite3_prepare_v2(db,
                       "INSERT INTO aliases (alias, pkg) VALUES(?,?)",
                       -1, &stmt, 0) != SQLITE_OK)
                       {
                          errx(1, "Could not prepare statement");
                       }

                       sqlite3_bind_text(stmt, 1, row[1], strlen(row[1]), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 2, row[0], strlen(row[0]), SQLITE_TRANSIENT); 

                       if (sqlite3_step(stmt) != SQLITE_DONE)
                          errx(1,"Could not execute query");
                       sqlite3_reset(stmt);
                       sqlite3_finalize(stmt);

                       puts(ln);
                       free(ln);
                   }
               }
               printf("\n"); 
            }
            mysql_free_result(result);

            close_indexdb(db);
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

int
mysql_exec_sql(MYSQL *mysql, const char *create_definition)
{
   return mysql_real_query(mysql, create_definition, strlen(create_definition));
}

sqlite3*
open_indexdb(int runid)
{
    sqlite3 *db = NULL;
    char *filename = NULL;

    asprintf(&filename, "magus-%d.db", runid);
    if (filename == NULL)
    {
         errx(1, "Could not malloc filename");
    }
    sqlite3_open(filename, &db);
    free(filename);
    return db;
}

void
close_indexdb(sqlite3 *db)
{
    sqlite3_close(db);
}


int
exec_indexdb(sqlite3 *db, const char *fmt, ...)
{
  va_list args;
  char *sql;
  int sqlcode;

  va_start(args, fmt);

  sql = sqlite3_vmprintf(fmt, args);

  va_end(args);

  if (sql == NULL)
    errx(1,"Couldn't allocate memory for sql statement");

  sqlcode = sqlite3_exec(db, sql, 0, 0, 0);
  /* if we get an error code, we want to run it again in some cases */
  if (sqlcode == SQLITE_BUSY || sqlcode == SQLITE_LOCKED) {
    if (sqlite3_exec(db, sql, 0, 0, 0) != SQLITE_OK) {
      sqlite3_free(sql);
      errx(1, sqlite3_errmsg(db));
    }
  } else if (sqlcode != SQLITE_OK) {
    sqlite3_free(sql);
    errx(1, sqlite3_errmsg(db));
  }

  sqlite3_free(sql);

  return 0;
}

void
create_indexdb(sqlite3 *db)
{
    exec_indexdb(db, "CREATE TABLE IF NOT EXISTS mirrors (country text NOT NULL, mirror text NOT NULL)");
    exec_indexdb(db, "CREATE INDEX mirrors_country on mirrors(country)");
    exec_indexdb(db, "INSERT INTO mirrors (country, mirror) VALUES('us', 'http://www.midnightbsd.org/ftp/MidnightBSD/mports/packages/i386/0.3-release/All/')");
    exec_indexdb(db, "CREATE TABLE IF NOT EXISTS packages (pkg text NOT NULL, version text NOT NULL, license text NOT NULL, comment text NOT NULL, www text NOT NULL, bundlefile text NOT NULL)");
    exec_indexdb(db, "CREATE INDEX packages_pkg ON packages (pkg)"); /* should be unique */
    exec_indexdb(db, "CREATE TABLE IF NOT EXISTS aliases (alias text NOT NULL, pkg text NOT NULL)");
}
