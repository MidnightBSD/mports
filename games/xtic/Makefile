PORTNAME=	xtic
PORTVERSION=	1.12
CATEGORIES=	games
MASTER_SITES=	XCONTRIB/games
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSd.org
COMMENT=	X version of a simple but tricky board game

LICENSE=	other

USES=		imake xorg
USE_XORG=	ice sm x11 xaw xext xmu xpm xt
CFLAGS+=	-fcommon

PLIST_FILES=	bin/xtic share/man/man1/xtic.1.gz

post-patch:
	@${REINPLACE_CMD} -e "s|%%LOCALBASE%%|${LOCALBASE}|g" ${WRKSRC}/configure.h

.include <bsd.port.mk>
