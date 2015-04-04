# $MidnightBSD$

PORTNAME=	procps
PORTVERSION=	3.2.7
CATEGORIES=	sysutils linux
PKGNAMEPREFIX=	linux-f10-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux psproc binaries (Linux Fedora 10)

LICENSE=	gpl2

CONFLICTS=	linux-procps-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes
RPMVERSION=	21.fc10
USE_LDCONFIG=	yes
BRANDELF_DIRS=	bin sbin usr/bin
PLIST_SUB+=	PORTVERSION="${PORTVERSION}"

PROCFS=	/compat/linux/proc

post-install:
	@df ${PROCFS} 2>&1 | ${EGREP} '^linprocfs ' > /dev/null 2>&1 || (echo ">>>" ; echo ">>> You still need to mount ${PROCFS}; see linprocfs(5)" ; echo ">>> for more information" ; echo ">>>")

.include <bsd.port.mk>
