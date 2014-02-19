# $MidnightBSD$

PORTNAME=	mawk
DISTVERSION=	1.3.4-20131226
CATEGORIES=	lang
MASTER_SITES=	ftp://invisible-island.net/${PORTNAME}/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of new/posix awk

LICENSE=	gpl2

GNU_CONFIGURE=	yes

MAN1=		mawk.1
PLIST_FILES=	bin/mawk

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mawk ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/mawk.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
