# $MidnightBSD$
# $FreeBSD: ports/astro/luna/Makefile,v 1.15 2006/05/03 05:14:05 edwin Exp $

PORTNAME=	luna
PORTVERSION=	1.9
PORTREVISION=	1
CATEGORIES=	astro games
MASTER_SITES=	http://ftp.vector.co.jp/00/48/300/
DISTNAME=	luna19s
EXTRACT_SUFX=	.lzh

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display the moon's phase

LICENSE=	unknown

EXTRACT_DEPENDS=	lha:${PORTSDIR}/archivers/lha

EXTRACT_CMD=	lha
EXTRACT_BEFORE_ARGS=	xtfqw=${WRKDIR}
EXTRACT_AFTER_ARGS=	# empty

FAKE_OPTS=	trueprefix
WRKSRC=	${WRKDIR}

PLIST_FILES=	bin/luna
MAKEFILE=	makefile

post-patch:
	@${REINPLACE_CMD} -e 's|varargs.h|stdarg.h|' ${WRKSRC}/iprintf/idoprnt.c

.include <bsd.port.mk>
