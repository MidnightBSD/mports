PORTNAME=	etc_os-release
PORTVERSION=	0.1
CATEGORIES=	sysutils gnome
MASTER_SITES=	#
DISTFILES=	#
EXTRACT_ONLY=	#

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Operating system identification file

NO_BUILD=	yes

PLIST_FILES=	etc/os-release

VERSION!=	midnightbsd-version -u
VERSION_ID=	${VERSION:C/^([0-9\.]+).*/\1/}

CONTENTS=	'NAME=MidnightBSD\0'$\
		'VERSION=${VERSION}\0'$\
		'VERSION_ID=${VERSION_ID}\0'$\
		'ID=midnightbsd\0'$\
		'ANSI_COLOR="0;31"\0'$\
		'PRETTY_NAME="MidnightBSD ${VERSION}"\0'$\
		'CPE_NAME=cpe:/o:midnightbsd:midnightbsd:${VERSION_ID}\0'$\
		'HOME_URL=https://midnightbsd.org/\0'$\
		'BUG_REPORT_URL=https://bugreport.midnightbsd.org'

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc
	${ECHO} -e ${CONTENTS} | ${XARGS} -0 -n 1 >> ${STAGEDIR}${PREFIX}/${PLIST_FILES}

.include <bsd.port.mk>
