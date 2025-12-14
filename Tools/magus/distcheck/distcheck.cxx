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
#include <stdexcept>
#include <cstring>
#include <string>
#include <vector>

using namespace std;
using namespace pqxx;

#include <cstdio>
#include <cstdlib>
#include <unistd.h>
#include <err.h>
#include <getopt.h>
#include <sys/types.h>

const std::string DB_DATABASE = "magus";

int main(int argc, char *argv[])
{
    char query_def[1000];
    int runid;

	// Default values
    std::string db_name = "magus";
    std::string db_host = "127.0.0.1";
    std::string db_user;
    std::string db_pass;

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
			return 1;
		}
	}

	if (argc - optind != 3)
	{
		std::cerr << "Usage: " << argv[0] << " -d <db_name> -h <db_host> -U <db_user> -P <db_pass> <runid> <src> <dest>" << endl;
		return 1;
	}

	try
	{
		runid = std::stoi(std::string(argv[optind]));
		if (runid < 1)
		{
			throw std::invalid_argument("Invalid run id");
		}
	}
	catch (const std::exception &e)
	{
		std::cerr << "Invalid run id: " << argv[optind] << endl;
		return 1;
	}

	const std::string dsrc = argv[optind + 1];
	std::string ddest = argv[optind + 2];

	if (db_user.empty() || db_pass.empty())
	{
		std::cerr << "Database user and password are required." << endl;
		return 1;
	}

	int copied_count = 0;
    int exists_count = 0;
    int missing_count = 0;
    int restricted_count = 0;
    int failed_count = 0;

    try
    {
        std::string connect_string = "dbname=" + db_name +
                               " user=" + db_user +
                               " password=" + db_pass +
                               " hostaddr=" + db_host +
                               " port=5432";

        pqxx::connection C(connect_string);

        if (C.is_open())
        {
            std::cout << "We are connected to " << C.dbname() << endl;
        }
        else
        {
            std::cerr << "We are not connected! Check username and password." << endl;
            return -1;
        }

    	const std::string query1 =
				 "select p.name, p.version, p.license, p.restricted, d.filename, d.id from ports p inner join distfiles d on p.id = d.port left join restricted_distfiles rd on p.id = rd.port where p.run=$1 AND p.restricted = false and p.license not in ('restricted', 'other', 'unknown', 'agg', 'NONE') AND p.status!='internal' AND p.status!='untested' AND p.status!='fail' AND (rd.filename is NULL or d.filename != rd.filename) ORDER BY p.name, d.id;";

    	C.prepare("distcheck_query1", query1);

    	pqxx::work W(C);
    	pqxx::result R(W.exec_prepared("distcheck_query1", runid));
    	W.commit();

		if (!R.empty())
		{
			for (const auto& row: R)
			{
				std::string name = row[0].as<std::string>();
				std::string license = row[2].as<std::string>();
				std::string filename = row[4].as<std::string>();

				namespace fs = std::filesystem;
				fs::path src{string(dsrc) + "/" + filename};
				if (!fs::exists(src))
				{
					std::cout << "File " << src << " does not exist" << std::endl;
					missing_count++;
					continue;
				}

				if (row[3].as<bool>())
				{
					std::cout << "File " << src << " is restricted; skipping file." << std::endl;
					restricted_count++;
					continue;
				}

				fs::path dest{string(ddest) + "/" + filename};
				if (!fs::exists(dest))
				{
					try {
						fs::copy_file(src, dest);
						std::cout << "Copied source " << src << " to destination " << dest << std::endl;
						copied_count++;
					} catch (const fs::filesystem_error& e) {
						std::cerr << "Failed to copy source " << src << " to destination " << dest << ": " << e.what() << std::endl;
						failed_count++;
					}
				}
				else
				{
					std::cout << "File " << dest << " already exists." << std::endl;
					exists_count++;
				}
			}
		}

    	const std::string query2 =
						"select p.name, p.version, p.license, p.restricted, d.filename, d.id from ports p inner join distfiles d on p.id = d.port left join restricted_distfiles rd on p.id = rd.port where (p.restricted = true or p.license in ('restricted', 'other', 'unknown', 'agg', 'NONE') or d.filename = rd.filename) and p.run=$1 AND p.status!='internal' AND p.status!='untested' AND p.status!='fail' ORDER BY p.name, d.id;";

    	C.prepare("distcheck_query2", query2);

    	std::cout << "List restricted distinfo files" << std::endl;
    	pqxx::work W2(C);
    	pqxx::result R2(W2.exec_prepared("distcheck_query2", runid));
    	W2.commit();

		if (!R2.empty())
		{
			for (const auto& c: R2)
			{
				std::string name = c[0].as<std::string>();
				std::string license = c[2].as<std::string>();
				std::string filename = c[4].as<std::string>();

				namespace fs = std::filesystem;
				fs::path f{string(ddest) + "/" + filename};
				if (fs::exists(f))
				{
					std::cout << name << " , license: " << license << " , filename: " << filename << std::endl;
				}
			}
		}
	}
	catch (std::exception const &error)
	{
		std::cerr << error.what() << std::endl;
        return 1;
	}

	std::cout << "\nSummary:" << std::endl;
    std::cout << "Copied files: " << copied_count << std::endl;
    std::cout << "Already existed: " << exists_count << std::endl;
    std::cout << "Missing source: " << missing_count << std::endl;
    std::cout << "Restricted: " << restricted_count << std::endl;
    std::cout << "Failed to copy: " << failed_count << std::endl;

	return 0;
}
