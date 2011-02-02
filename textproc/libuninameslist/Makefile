# $MidnightBSD: mports/textproc/libuninameslist/Makefile,v 1.5 2009/10/03 03:45:52 laffer1 Exp $ 

PORTNAME=	libuninameslist
PORTVERSION=	20080409
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}%20sources/${PORTVERSION}/

USE_BZIP2=	yes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library of Unicode annotation data
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_GNOME=	gnometarget
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
ALL_TARGET=	both
USE_LDCONFIG=	yes

.include <bsd.port.mk>
