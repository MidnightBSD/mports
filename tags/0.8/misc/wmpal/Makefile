# $MidnightBSD$

PORTNAME=	wmpal
PORTVERSION=	0.6.1
PORTREVISION=	4
CATEGORIES=	misc windowmaker
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	One of the most useless dockapps in the world

LICENSE=        gpl2

LIB_DEPENDS=	dockapp.2:${PORTSDIR}/x11-wm/libdockapp

USE_XORG=	xpm
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lX11

PORTDOCS=	README
PLIST_FILES=	bin/wmpal

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|"dino"|"daemon"|g' ${WRKSRC}/wmpal.c

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
