# $MidnightBSD$

PORTNAME=	mawk
DISTVERSION=	1.3.4-20161120
CATEGORIES=	lang
MASTER_SITES=	ftp://invisible-island.net/${PORTNAME}/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of new/posix awk

LICENSE=	gpl2

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/mawk man/man1/mawk.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mawk ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/mawk.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
