PORTNAME=	deb2targz
PORTVERSION=	20100710
CATEGORIES=	archivers
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line utility for converting a Debian .deb file to a .tar.gz

LICENSE=	unknown

NO_BUILD=	yes
NO_ARCH=	yes

PLIST_FILES=	bin/deb2targz

do-install:
	${INSTALL_SCRIPT} ${FILESDIR}/${PORTNAME}.sh ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
