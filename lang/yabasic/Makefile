PORTNAME=	yabasic
PORTVERSION=	2.90.4
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	lang

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another Basic for Unix and Windows
WWW=		http://www.yabasic.de/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libffi.so:devel/libffi

USES=		autoreconf cpe bison gmake libtool localbase ncurses xorg
USE_GITHUB=	yes
GH_ACCOUNT=	marcIhm

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
USE_XORG=	ice sm x11
#TEST_TARGET=	check
NO_TEST=	yes

WRKSRC_SUBDIR=	unix/lang

PORTDOCS=	ChangeLog README
PLIST_FILES=	bin/yabasic share/man/man1/yabasic.1.gz

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e \
		's|= -DUNIX|= @X_CFLAGS@ -DUNIX|g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's|-R$$x_libraries||' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		'/Intrinsic.h/d' ${WRKSRC}/yabasic.h

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
