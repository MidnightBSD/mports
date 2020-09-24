# Created by: Mike Muir <mmuir@es.co.nz>

PORTNAME=	consolehm
PORTVERSION=	1.31
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	FREEBSD_LOCAL/fenner

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Console based hardware monitor for FreeBSD

LICENSE=	bsd2

USES=		uidfix
GNU_CONFIGURE=	yes
WRKSRC=		${WRKDIR}/consolehm/consolehm
MAKE_ARGS+=	-e

PLIST_FILES=	bin/chm man/man8/chm.8.gz

.include <bsd.port.mk>
