# $MidnightBSD: mports/textproc/libuninameslist/Makefile,v 1.3 2009/06/12 19:39:15 laffer1 Exp $ 

PORTNAME=	libuninameslist
PORTVERSION=	20060907
CATEGORIES=	textproc
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}_src-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library of Unicode annotation data
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_GNOME=	gnometarget
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
ALL_TARGET=	both
USE_LDCONFIG=	yes

.include <bsd.port.mk>
