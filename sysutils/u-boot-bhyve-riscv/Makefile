MASTERDIR=	${.CURDIR}/../u-boot-master

MODEL=		bhyve-riscv
BOARD_CONFIG=	bhyve-riscv64_smode_defconfig
FAMILY=		bhyve
UBOOT_ARCH=	riscv64
UBOOT_VERSION=	2024.10

UBOOT_PLIST=	u-boot.bin

# The master's USB workaround predates 2024.10's bootm changes.
PATCHDIR=	${.CURDIR}/files

.include "${MASTERDIR}/Makefile"
