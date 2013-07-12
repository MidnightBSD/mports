# $MidnightBSD: mports/java/jikes/Makefile,v 1.5 2011/12/24 02:34:40 laffer1 Exp $

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
USES=		iconv
USE_BZIP2=	yes

CONFIGURE_ARGS=	CPPFLAGS="-I${LOCALBASE}/include" LIBS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
