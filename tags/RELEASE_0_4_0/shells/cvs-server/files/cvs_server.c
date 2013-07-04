#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char** argv)
{
    if (getenv("CVSROOT") == NULL)
	setenv("CVSROOT", "/home/cvs", 0);

    execl("/usr/bin/cvs", "cvs", "server", NULL);

    printf("No Permission.\n"); 
}
