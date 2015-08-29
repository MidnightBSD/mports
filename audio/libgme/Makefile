# $MidnightBSD$
# $FreeBSD: head/audio/libgme/Makefile 383870 2015-04-12 14:15:14Z danfe $

PORTNAME=	libgme
PORTVERSION=	0.6.0
CATEGORIES=	audio
MASTER_SITES=	GOOGLE_CODE
PROJECTHOST=	game-music-emu
DISTNAME=	${PROJECTHOST}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of video game music emulators

LICENSE=	lgpl2.1 lgpl3
LICENSE_COMB=	dual

USES=		tar:bzip2 cmake dos2unix ninja
USE_LDCONFIG=	yes

PORTDOCS=	changes.txt design.txt gme.txt readme.txt

OPTIONS_DEFINE=	DOCS

pre-patch: dos2unix

post-patch:
	@${REINPLACE_CMD} -e '/pkgconfig/s,lib/,libdata/,' \
		${WRKSRC}/gme/CMakeLists.txt

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
