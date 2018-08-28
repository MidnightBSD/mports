# $MidnightBSD$

PORTNAME=	fmake
PORTVERSION=	r250982
MASTER_SITES=	FREEBSD_LOCAL/crees/${PORTNAME}/ \
		http://www.bayofrum.net/dist/${PORTNAME}/
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Legacy FreeBSD pmake

LICENSE=	bsd3

PLIST_FILES=	bin/${PORTNAME} man/man1/fmake.1.gz

MAKE_ARGS+=	PROG=fmake NO_MAN=yes

do-install:
		${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
		${INSTALL_MAN} ${WRKSRC}/make.1 \
			${MAN1PREFIX}/man/man1/${PORTNAME}.1

.include <bsd.port.mk>
