#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main(int argc, char **argv)
{
	struct stat before, after;
	long long size;
	int fd, result;

	if (argc != 3)
		return (1);
	size = strtoll(argv[2], NULL, 10);
	fd = open(argv[1], O_WRONLY);
	if (fd == -1 || fstat(fd, &before) != 0)
		return (1);
	result = posix_fallocate(fd, before.st_size, size - before.st_size);
	if (fstat(fd, &after) != 0 || close(fd) != 0)
		return (1);
	printf("%d %lld\n", result, (long long)after.st_size);
	return (0);
}
