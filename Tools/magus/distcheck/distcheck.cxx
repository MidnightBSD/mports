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
#include <getopt.h>

#include <sys/types.h>

const string DB_DATABASE = "magus";

int main(int argc, char *argv[])
{
    char query_def[1000];
    int runid;

	// Default values
    string db_name = "magus";
    string db_host = "127.0.0.1";
    string db_user;
    string db_pass;

	int opt;
	while ((opt = getopt(argc, argv, "d:h:U:P:")) != -1)
	{
		switch (opt)
		{
		case 'd':
			db_name = optarg;
			break;
		case 'h':
			db_host = optarg;
			break;
		case 'U':
			db_user = optarg;
			break;
		case 'P':
			db_pass = optarg;
			break;
		default:
			std::cerr << "Usage: " << argv[0] << " -d <db_name> -h <db_host> -U <db_user> -P <db_pass> <runid> <src> <dest>" << endl;
			exit(1);
		}
	}

	if (argc - optind != 3)
	{
		std::cerr << "Usage: " << argv[0] << " -d <db_name> -h <db_host> -U <db_user> -P <db_pass> <runid> <src> <dest>" << endl;
		exit(1);
	}

	try
	{
		runid = std::stoi(string(argv[optind]));
		if (runid < 1)
		{
			std::cerr << "Invalid run id" << endl;
			exit(1);
		}
	}
	catch (const std::exception &e)
	{
		std::cerr << "Invalid run id: " << argv[optind] << endl;
		exit(1);
	}

	const string dsrc = argv[optind + 1];
	string ddest = argv[optind + 2];

	if (db_user.empty() || db_pass.empty())
	{
		std::cerr << "Database user and password are required." << endl;
		exit(1);
	}

	int copied_count = 0;
    int exists_count = 0;
    int missing_count = 0;
    int restricted_count = 0;
    int failed_count = 0;

    try
    {
        string connect_string = "dbname=" + db_name +
                               " user=" + db_user +
                               " password=" + db_pass +
                               " hostaddr=" + db_host +
                               " port=5432";

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
				"select p.name, p.version, p.license, p.restricted, d.filename, d.id from ports p inner join distfiles d on p.id = d.port where p.run=%d AND p.restricted = false and p.license not in ('restricted', 'other', 'unknown', 'agg', 'NONE') AND p.status!='internal' AND p.status!='untested' AND p.status!='fail' ORDER BY p.name, d.id;",
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
				fs::path src{string(dsrc) + "/" + filename};
				if (!fs::exists(src))
				{
					cout << "File " << src << " does not exist" << endl;
					missing_count++;
					continue;
				}

				if (row[3].as(bool()))
				{
					cout << "File " << src << " is restricted; skipping file." << endl;
					restricted_count++;
					continue;
				}

				fs::path dest{string(ddest) + "/" + filename};
				if (!fs::exists(dest))
				{
					bool result = fs::copy_file(src, dest);
					if (!result)
					{
						cout << "Failed to copy source " << src << " to destination " << dest << endl;
						failed_count++;
					}
					else
					{
						cout << "Copied source " << src << " to destination " << dest << endl;
						copied_count++;
					}
				}
				else
				{
					cout << "File " << dest << " already exists." << endl;
					exists_count++;
				}
			}
		}

		sprintf(query_def,
				"select p.name, p.version, p.license, p.restricted, d.filename, d.id from ports p inner join distfiles d on p.id = d.port where (p.restricted = true or p.license in ('restricted', 'other', 'unknown', 'agg', 'NONE')) and p.run=%d AND p.status!='internal' AND p.status!='untested' AND p.status!='fail' ORDER BY p.name, d.id;",
				runid);

		cout << "List restricted distinfo files" << endl;
		result R2(N.exec(string(query_def)));
		if (!R2.empty())
		{
			for (result::const_iterator c = R2.begin(); c != R2.end(); ++c)
			{
				string name = c[0].as(string());
				string license = c[2].as(string());
				string filename = c[4].as(string());

				namespace fs = std::filesystem;
				fs::path f{string(ddest) + "/" + filename};
				if (fs::exists(f))
				{
					cout << name << " , license: " << license << " , filename: " << filename << endl;
				}
			}
		}
	}
	catch (std::exception const &error)
	{
		std::cerr << error.what() << endl;
	}

	cout << "\nSummary:" << endl;
    cout << "Copied files: " << copied_count << endl;
    cout << "Already existed: " << exists_count << endl;
    cout << "Missing source: " << missing_count << endl;
    cout << "Restricted: " << restricted_count << endl;
    cout << "Failed to copy: " << failed_count << endl;

	return 0;
}
