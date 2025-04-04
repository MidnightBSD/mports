PORTNAME=	fmake
PORTVERSION=	r250982
MASTER_SITES=	FREEBSD_LOCAL/crees/${PORTNAME}/ \
		http://www.bayofrum.net/dist/${PORTNAME}/
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Legacy FreeBSD pmake

LICENSE=	bsd3

PLIST_FILES=	bin/${PORTNAME} share/man/man1/fmake.1.gz

MAKE_ARGS+=	PROG=fmake MAN=

do-install:
		${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
		${INSTALL_MAN} ${WRKSRC}/make.1 \
			${PREFIX}/share/man/man1/${PORTNAME}.1

.include <bsd.port.mk>
