PORTNAME=	untar
PORTVERSION=	1.4
PORTREVISION=	2
CATEGORIES=	archivers
MASTER_SITES=	ftp://ftp.cs.pdx.edu/pub/elvis/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.c
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists/Extracts files from a "*.tgz" or "*.gz" archive

LICENSE=        unknown

MAKEFILE=	/usr/share/mk/bsd.prog.mk
NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/untar

MAKE_ENV+=	PROG=untar NO_MAN=yes
MAKE_ARGS+=	CFLAGS="${CFLAGS} -D_POSIX_SOURCE" \
		LDFLAGS="${LDFLAGS} -static"

pre-patch:
	@${CP} ${DISTDIR}/untar.c ${WRKSRC}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
