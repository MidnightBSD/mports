PORTNAME=	nawk
PORTVERSION=	20121220
PORTREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	https://BSDforge.com/projects/source/lang/nawk/
DISTNAME=	awk
DIST_SUBDIR=	nawk-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Brian Kernighan's pattern scanning and processing language
WWW=		http://cm.bell-labs.com/cm/cs/awkbook/index.html

LICENSE=	mit

NO_WRKSUBDIR=	yes
MAKEFILE=	makefile
ALL_TARGET=	a.out
CFLAGS+=	-DHAS_ISBLANK
PLIST_FILES=	bin/nawk  share/man/man1/nawk.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/a.out ${PREFIX}/bin/nawk
	${SED} -e 's|awk|nawk|g' ${WRKSRC}/awk.1 > ${WRKSRC}/nawk.1
	${INSTALL_MAN} ${WRKSRC}/nawk.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
