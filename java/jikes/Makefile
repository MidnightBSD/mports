# $MidnightBSD: mports/java/jikes/Makefile,v 1.4 2008/12/27 01:46:45 laffer1 Exp $

PORTNAME=	jikes
PORTVERSION=	1.22
PORTREVISION=	1
CATEGORIES=	java
MASTER_SITES=	SF/${PORTNAME}/Jikes/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A very fast Java source to byte-code compiler made available by IBM
LICENSE=	other

MAN1=		jikes.1

PLIST_SUB=	PORTVERSION=${PORTVERSION}
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
USE_BZIP2=	yes

CONFIGURE_ARGS=	CPPFLAGS="-I${LOCALBASE}/include" LIBS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
