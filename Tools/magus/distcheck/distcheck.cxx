/*-
Copyright (C) 2022 Lucas Holt All rights reserved.

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
#include <fstream>
#include <filesystem>
#include <pqxx/pqxx>
#include <cstring>

using namespace std;
using namespace pqxx;

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <err.h>

#include <sys/types.h>

const string DB_HOST = "70.91.226.203";
const string DB_DATABASE = "magus";

int main(int argc, char *argv[])
{
    char query_def[1000];
    int runid;

    if (argc != 6)
    {
        std::cerr << "Usage: " << argv[0] << " <runid> <db_user> <db_pass> <src> <dest>" << endl;
        exit(1);
    }

    runid = std::stoi(string(argv[1]));
    if (runid < 1)
    {
        std::cerr << "Invalid run id" << endl;
        exit (1);
    }

	try
	{
 
    string connect_string = "dbname=magus user=" + string(argv[2]) + " password=" + string(argv[3]) + " hostaddr=" + DB_HOST + " port=5432";
   
    connection C(connect_string);
    connection C2(connect_string);

    if (C.is_open())
    {
        cout << "We are connected to " << C.dbname() << endl;
    }
    else
    {
        cout << "We are not connected! Check username and password." << endl;
        return -1;
    }

    sprintf(query_def,
            "select p.name, p.version, p.license, p.restricted, d.filename, d.id from ports p inner join distfiles d on p.id = d.port where p.run=%d AND p.restricted = false and p.license not in ('restricted', 'other', 'unknown', 'agg') AND p.status!='internal' AND p.status!='untested' AND p.status!='fail' ORDER BY p.name, d.id;",
            runid);

    nontransaction N(C);

    result R(N.exec(string(query_def)));

    if (!R.empty())
    {
        for (result::const_iterator row = R.begin(); row != R.end(); ++row)
        {
            string name = row[0].as(string());
            string license = row[2].as(string());
            string filename = row[4].as(string());

            namespace fs = std::filesystem;
            fs::path src{string(argv[4]) + "/" + filename};
            if (!fs::exists(src))
            {
                cout << "File " << src << " does not exist" << endl;
                continue;
            }

            if (row[3].as(bool()))
            {
                cout << "File " << src << " is restricted; skipping file." << endl;
                continue;
            }

            fs::path dest{string(argv[5]) + "/" + filename};
		if (!fs::exists(dest)) {
            bool result = fs::copy_file(src, dest);
            if (!result)
            {
                cout << "Failed to copy source " << src << " to destination " << dest << endl;
            } else {
                cout << "Copied source " << src << " to destination " << dest << endl;
            }
		} else {
			cout << "File " << dest << " already exists." << endl;
		}
        }
    }

    sprintf(query_def,
            "select p.name, p.version, p.license, p.restricted, d.filename, d.id from ports p inner join distfiles d on p.id = d.port where (p.restricted = true or p.license in ('restricted', 'other', 'unknown', 'agg')) and p.run=%d AND p.status!='internal' AND p.status!='untested' AND p.status!='fail' ORDER BY p.name, d.id;",
            runid);

    printf("List restricted distinfo files\n");
    result R2(N.exec(string(query_def)));
    if (!R2.empty())
    {
        for (result::const_iterator c = R2.begin(); c != R2.end(); ++c)
        {
            string name = c[0].as(string());
            string license = c[2].as(string());
            string filename = c[4].as(string());

            namespace fs = std::filesystem;
            fs::path f{string(argv[5]) + "/" + filename};
            if (fs::exists(f))
            {
                cout << name << " license: " << license << "filename: " << filename << endl;
            }
        }
    }

    } catch(std::exception const &error) {
	std::cerr << error.what() << endl;
    }

    return 0;
}
