# $MidnightBSD$

PORTNAME=	libuninameslist
PORTVERSION=	20091231
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}%20sources/Unicode_5.2-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of Unicode annotation data

LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		gmake tar:bzip2 libtool
GNU_CONFIGURE=	yes
ALL_TARGET=	both
USE_LDCONFIG=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/lib/*.so

.include <bsd.port.mk>
