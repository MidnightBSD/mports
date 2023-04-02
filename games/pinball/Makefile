PORTNAME=	pinball
PORTVERSION=	0.3.20230219
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Emilia Pinball is a free pinball game
WWW=		http://pinball.sourceforge.net/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libltdl.so:devel/libltdl

USE_GITHUB=	yes
GH_ACCOUNT=	adoptware

USES=		autoreconf compiler:c++11-lang gl gmake localbase:ldflags \
		libtool:keepla pkgconfig sdl xorg # .la needed for plugin loading
USE_XORG=	ice sm
USE_GL=		gl
USE_SDL=	image2 mixer2 sdl2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-debug

CPPFLAGS+=	-DRZR_LIBSTATIC
SCOREDIR=	/var/games
PLIST_SUB=	SCOREDIR=${SCOREDIR}
#MAKE_JOBS_UNSAFE=yes

OPTIONS_DEFINE=	DOCS

post-install:
	${STRIP_CMD} ${PREFIX}/lib/pinball/lib*.so*
.for table in professor tux
	(cd ${FAKE_DESTDIR}${SCOREDIR}/${PORTNAME}/${table} &&	\
	${MV} highscores highscores.sample)
.endfor

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
