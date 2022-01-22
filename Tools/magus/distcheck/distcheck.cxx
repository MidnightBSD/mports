/*-
Copyright (C) 2008, 2010, 2011, 2013, 2014, 2022 Lucas Holt All rights reserved.

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

const string DB_HOST = "db.midnightbsd.org";
const string DB_DATABASE = "magus";

int
main(int argc, char *argv[])
{
    char query_def[1000];
    int runid;
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
                if (sqlite3_prepare_v2(db,"INSERT INTO mirrors (country, mirror) VALUES(?,?)",  -1, &stmt, 0) != SQLITE_OK)
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

	printf("Mark run blessed\n");
	N.exec0(
		"UPDATE runs "
		"SET blessed = true, status = 'complete' "
		"WHERE id = " + pqxx::to_string(runid));

	return 0;
}

