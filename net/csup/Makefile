# ex:ts=8
# $MidnightBSD$

PORTNAME=	csup
PORTVERSION=	20060318
CATEGORIES=	net devel
MASTER_SITES=	http://www.mu.org/~mux/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	mux
DISTNAME=	${PORTNAME}-snap-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A rewrite of the CVSup file updating client in C
LICENSE=	bsd2

WRKSRC=		${WRKDIR}/${PORTNAME}
PLIST_FILES=	bin/csup \
		man/man1/csup.1.gz

.include <bsd.port.mk>
