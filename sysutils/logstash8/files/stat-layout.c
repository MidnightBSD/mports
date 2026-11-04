#include <sys/types.h>
#include <sys/stat.h>
#include <stddef.h>
#include <stdio.h>
int main(void) {
  printf("size=%zu dev=%zu ino=%zu nlink=%zu mode=%zu rdev=%zu sizeoff=%zu blocks=%zu spare=%zu dev_t=%zu nlink_t=%zu\n",sizeof(struct stat),offsetof(struct stat,st_dev),offsetof(struct stat,st_ino),offsetof(struct stat,st_nlink),offsetof(struct stat,st_mode),offsetof(struct stat,st_rdev),offsetof(struct stat,st_size),offsetof(struct stat,st_blocks),offsetof(struct stat,st_spare),sizeof(dev_t),sizeof(nlink_t));
  return 0;
}
