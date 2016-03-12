# $MidnightBSD$

PORTNAME=	dgs
PORTVERSION=	0.5.9.1
PORTREVISION=	12
CATEGORIES=	x11
MASTER_SITES=	GNU/../old-gnu/dgs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display ghostscript system

LICENSE=	gpl2

LIB_DEPENDS=	libpng.so:${PORTSDIR}/graphics/png \
		libtiff.so:${PORTSDIR}/graphics/tiff

MAKE_JOBS_UNSAFE=	yes

USE_GHOSTSCRIPT_RUN=	yes
USE_XORG=	xt sm ice xext x11
USE_GNOME=	glib12
USES=		gmake jpeg libtool makeinfo
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-0.5.9

pre-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} \
		${REINPLACE_CMD} -e 's|manm|mann|g'

post-patch:
	${REINPLACE_CMD} -e 's|FreeBSD|MidnightBSD|g' \
		${WRKSRC}/config.guess
	${TOUCH} ${WRKSRC}/config.sub

post-install:
	${STRIP_CMD} ${PREFIX}/lib/*.so
	${INSTALL_SCRIPT} ${WRKSRC}/dgs-config ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/dpsnx.agent ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/dpsnx.agent.1 ${STAGEDIR}${PREFIX}/man/man1/

.include <bsd.port.mk>
