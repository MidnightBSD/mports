This is the MidnightBSD Ports Collection.

	https://www.MidnightBSD.org/mports
	
Downloaad or submit patches via github:
	https://github.com/MidnightBSD/mports

For documentation, consult:

	The ports(7) manual page (man ports).

	MidnightBSD website https://www.midnightbsd.org/

If you would like to search for a port, you can do so easily by
saying (in /usr/mports):


	make search name="<name>"
	or:
	make search key="<keyword>"

which will generate a list of all ports matching <name> or <keyword>.
make search also supports wildcards, such as:

	make search name="gtk*"

To use packages instead, use the mport command to install. You can find
out what pacakges are available on the midnightbsd app store
http://app.midnightbsd.org/

You can also learn about package builds and their progress
https://www.midnightbsd.org/magus/

To create packages, one must use the magus software, which is included
in Tools/magus Tools/lib and so on.  

NOTE:  This tree will GROW significantly in size during normal usage!
The distribution tar files can and do accumulate in /usr/mports/Distfiles,
and the individual mports will also use up lots of space in their work
subdirectories unless you remember to "make clean" after you're done
building a given port.  /usr/mports/Distfiles can also be periodically
cleaned without ill-effect.

## Contributing ##

If you wish to contribute to mports, submit via github on
https://github.com/MidnightBSD/mports

Feel free to create a pull request to update any mports in this repository.  
All contributions must be provided under the same BSD 2-clause license we use.

If you're looking for ways to contribute, try fixing problems listed in repology:
https://repology.org/repository/mports/problems

You can also submit bug reports about mports at https://bugreport.midnightbsd.org/

[![Repository status](https://repology.org/badge/repository-big/mports.svg)](https://repology.org/repository/mports)
