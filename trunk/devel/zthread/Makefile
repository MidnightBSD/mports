# $MidnightBSD$

PORTNAME=	zthread
PORTVERSION=	2.3.2
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/ZThread/${PORTVERSION}
DISTNAME=	ZThread-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Platform-independent object-oriented C++ threading library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-ftime --disable-static
MAKE_ARGS+=	INSTALL_PROGRAM="${INSTALL_SCRIPT}"
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

PORTDOCS=	AUTHORS ChangeLog NEWS README TODO

post-extract:
	@${FIND} ${WRKSRC} -name CVS -type d -delete

post-patch:
	@${FIND} ${WRKSRC} \( -name '*.orig' -or -name '*.swp' \) -delete

post-install:
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR})
	${STRIP_CMD} ${PREFIX}/lib/libZThread.so

.include <bsd.port.mk>
