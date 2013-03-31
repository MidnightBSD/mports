# $MidnightBSD: mports/textproc/libuninameslist/Makefile,v 1.7 2011/12/15 00:39:54 laffer1 Exp $

PORTNAME=	libuninameslist
PORTVERSION=	20091231
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}%20sources/Unicode_5.2-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library of Unicode annotation data
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
ALL_TARGET=	both
USE_LDCONFIG=	yes

.include <bsd.port.mk>
