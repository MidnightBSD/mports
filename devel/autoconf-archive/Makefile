PORTNAME=	autoconf-archive
PORTVERSION=	0.${DISTDATE:C/-/./g}
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	GNU
DISTNAME=	${PORTNAME}-${DISTDATE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of useful GNU Autoconf macros

LICENSE=	gpl3

USES=		makeinfo tar:xz
DISTDATE=	2017.09.28
GNU_CONFIGURE=	yes
INFO=		${PORTNAME}

PLIST_SUB=	MACRODIR=share/aclocal

.include <bsd.port.mk>
