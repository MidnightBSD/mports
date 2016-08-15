# $MidnightBSD$

PORTNAME=	x2x
PORTVERSION=	1.27
PORTREVISION=	5
CATEGORIES=	x11-servers
MASTER_SITES=	GHC

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program to link multiple X servers together
LICENSE=	unknown

LICENSE=	mit

USE_GITHUB=	yes
GH_ACCOUNT=	dottedmag

WRKSRC=	${WRKDIR}/${DISTNAME}

USES=		imake
USE_XORG=	x11 xext xtst

PLIST_FILES=	bin/x2x man/man1/x2x.1.gz

post-extract:
	@${LN} -sf x2x.1 ${WRKSRC}/x2x.man

post-patch:
	@${REINPLACE_CMD} -e \
		'/CC =/s|^|XCOMM| ; \
		 /CDEBUGFLAGS =/s|^|XCOMM|' ${WRKSRC}/Imakefile

.include <bsd.port.mk>
