/*-
Copyright (C) 2008, 2010, 2011, 2013, 2014 Lucas Holt All rights reserved.

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
*/

#include <iostream>
#include <pqxx/pqxx>
#include <cstring>

using namespace std;
using namespace pqxx;

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <err.h>

#include <sys/types.h>
#include <sha256.h>

#include "sqlite3.h"

const string DB_HOST = "70.91.226.203";
const string DB_DATABASE = "magus";

/* SQLITE3 */
sqlite3* open_indexdb(int);
void close_indexdb(sqlite3 *);
int exec_indexdb(sqlite3 *, const char *, ...);
void create_indexdb(sqlite3 *);
void load_depends(sqlite3 *, connection &, int, const char *, const char *);

int
main(int argc, char *argv[])
{
    char query_def[1000];
    int runid;
    sqlite3 *db = NULL;
    sqlite3_stmt *stmt;
    char *fileHash;
    char *filePath;

    if (argc != 5)
    {
        fprintf( stderr, "Usage: %s <run id> <pg_user> <pg_pass> <files>\n", argv[0] );
        exit(1);
    }

    runid = atoi(argv[1]);
    if (runid < 1)
    {
        fprintf( stderr, "Invalid run id %d\n", runid);
        exit(1);
    }

    string connect_string = "dbname=magus user=" + string(argv[2]) + " password=" + string(argv[3]) + " hostaddr=" + DB_HOST + " port=5432";
    connection C(connect_string);
    connection C2(connect_string);

    if (C.is_open()) {
		cout << "We are connected to " << C.dbname() << endl;
    } else {
		cout << "We are not connected! Check username and password." << endl;
		return -1;
    }

    sprintf(query_def,
      "select pkgname, name, license, description, CONCAT(CONCAT_WS( '-', pkgname, version),'.mport'), version, restricted from ports where run=%d AND status!='internal' AND status!='untested' AND status!='fail' ORDER BY pkgname;",
      runid);

    nontransaction N(C);

    result R(N.exec(string(query_def)));

    if (!R.empty()) 
    {
    
            db = open_indexdb(runid);
            create_indexdb(db);

	    for (result::const_iterator row = R.begin(); row != R.end(); ++row) 
            {
	   	   string ln = row[0].as(string()) + ": " + row[1].as(string()) + " " +  row[2].as(string()) + " " + row[3].as(string()) + " " + row[5].as(string()) + " " + row[4].as(string());
                   asprintf(&filePath, "%s/%s", argv[4], row[4].as(string()).c_str());
                   fileHash = SHA256_File(filePath, NULL);
                   if (fileHash == NULL)
                   {
                       fprintf(stderr, "Could not locate file %s\n", filePath);
                       free(filePath);
                       continue;
                   }

		   if (row[6].as(bool()))
		   {
			fprintf(stderr, "File %s is restricted and will be removed.\n", filePath);	
			unlink(filePath);
			continue;
		   }

                   if (ln.c_str()) 
                   {
                      if (sqlite3_prepare_v2(db, 
                       "INSERT INTO packages (pkg, version, license, comment, bundlefile, hash) VALUES(?,?,?,?,?,?)",
                       -1, &stmt, 0) != SQLITE_OK)
                       {
                          errx(1, "Could not prepare statement");
                       }
                       sqlite3_bind_text(stmt, 1, row[0].as(string()).c_str(), row[0].as(string()).length(), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 2, row[5].as(string()).c_str(), row[5].as(string()).length(), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 3, row[2].as(string()).c_str(), row[2].as(string()).length(), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 4, row[3].as(string()).c_str(), row[3].as(string()).length(), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 5, row[4].as(string()).c_str(), row[4].as(string()).length(), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 6, fileHash, strlen(fileHash), SQLITE_TRANSIENT);

                       if (sqlite3_step(stmt) != SQLITE_DONE)
                          errx(1,"Could not execute query");
                       sqlite3_reset(stmt);
                       sqlite3_finalize(stmt);
                       free(filePath);
                       free(fileHash);

                      if (sqlite3_prepare_v2(db,
                       "INSERT INTO aliases (alias, pkg) VALUES(?,?)",
                       -1, &stmt, 0) != SQLITE_OK)
                       {
                          errx(1, "Could not prepare statement");
                       }

                       sqlite3_bind_text(stmt, 1, row[1].as(string()).c_str(), row[1].as(string()).length(), SQLITE_TRANSIENT);
                       sqlite3_bind_text(stmt, 2, row[0].as(string()).c_str(), row[0].as(string()).length(), SQLITE_TRANSIENT); 

                       if (sqlite3_step(stmt) != SQLITE_DONE)
                          errx(1,"Could not execute query");
                       sqlite3_reset(stmt);
                       sqlite3_finalize(stmt);

                       puts(ln.c_str());

			load_depends(db, C2, runid, row[0].as(string()).c_str(), row[5].as(string()).c_str());
                   }
               }
               printf("\n"); 
            }

	    printf("Load the mirrors list\n");
	    result R2(N.exec("SELECT country, url FROM mirrors order by country"));
	    if (!R2.empty())
            {
		   for (result::const_iterator c = R2.begin(); c != R2.end(); ++c) 
                    {
                         if (sqlite3_prepare_v2(db,
                          "INSERT INTO mirrors (country, mirror) VALUES(?,?)",
                           -1, &stmt, 0) != SQLITE_OK)
                         {
                             errx(1, "Could not prepare statement");
                         }
			string country = c[0].as(string());
			cout << country << endl;
			string url = c[1].as(string());
			cout << url << endl;
                         sqlite3_bind_text(stmt, 1, country.c_str(), country.length(), SQLITE_TRANSIENT);
                         sqlite3_bind_text(stmt, 2, url.c_str(), url.length(), SQLITE_TRANSIENT);

                         if (sqlite3_step(stmt) != SQLITE_DONE)
                             errx(1,"Could not execute query");
                         sqlite3_reset(stmt);
                         sqlite3_finalize(stmt);
                    }
            }

            close_indexdb(db);
    
    return 0;
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
    unlink(filename);
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
	exec_indexdb(db, "CREATE TABLE IF NOT EXISTS packages (pkg text NOT NULL, version text NOT NULL, license text NOT NULL, comment text NOT NULL, bundlefile text NOT NULL, hash text NOT NULL)");
	exec_indexdb(db, "CREATE INDEX packages_pkg ON packages (pkg)"); /* should be unique */
	exec_indexdb(db, "CREATE TABLE IF NOT EXISTS aliases (alias text NOT NULL, pkg text NOT NULL)");
	exec_indexdb(db, "CREATE TABLE IF NOT EXISTS depends (pkg text NOT NULL, version text NOT NULL, d_pkg text NOT NULL, d_version text NOT NULL)");
}

void
load_depends(sqlite3 *db, connection & C, int runid, const char *pkg_name, const char *version)
{
	char query_def[1000];
	sqlite3_stmt *stmt;

	printf("---->\tProcessing dependencies for %s - %s\n", pkg_name, version);

	sprintf(query_def, "SELECT distinct p2.pkgname, p2.version from ports as p1 left join depends d on p1.id = d.port left join ports p2 on d.dependency = p2.id where p2.run = %d and p1.run = %d and ((p1.status = 'pass' or p1.status = 'warn') and (p2.status = 'pass' or p2.status = 'warn')) and p1.pkgname = '%s' and p1.version = '%s' and d.type in ('run','lib', 'pkg')",
		runid, runid, pkg_name, version); 

if (C.is_open()) {

	nontransaction N(C);
	result R(N.exec(string(query_def)));

		if (!R.empty()) 
		{
			for (result::const_iterator row = R.begin(); row != R.end(); ++row) 
			{
					if (sqlite3_prepare_v2(db,
						"INSERT INTO depends (pkg, version, d_pkg, d_version) VALUES(?,?,?,?)",
						-1, &stmt, 0) != SQLITE_OK)
					{
						errx(1, "Could not prepare statement");
					}
					sqlite3_bind_text(stmt, 1, pkg_name, strlen(pkg_name), SQLITE_TRANSIENT);
					sqlite3_bind_text(stmt, 2, version, strlen(version), SQLITE_TRANSIENT);
					sqlite3_bind_text(stmt, 3, row[0].as(string()).c_str(), row[0].as(string()).length(), SQLITE_TRANSIENT);
					sqlite3_bind_text(stmt, 4, row[1].as(string()).c_str(), row[1].as(string()).length(), SQLITE_TRANSIENT);

					if (sqlite3_step(stmt) != SQLITE_DONE)
						errx(1,"Could not execute query");
					sqlite3_reset(stmt);
					sqlite3_finalize(stmt);
			}
		}
	}
}
