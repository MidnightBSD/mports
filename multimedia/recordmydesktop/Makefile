PORTNAME=	recordmydesktop
DISTVERSION=	0.3.8.1
PORTREVISION=	9
CATEGORIES=	multimedia
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Record desktop sessions to an Ogg-Theora-Vorbis file
WWW=		http://recordmydesktop.sourceforge.net/

LICENSE=	gpl2+

LIB_DEPENDS=	libtheora.so:multimedia/libtheora

USES=		xorg
USE_XORG=	ice sm x11 xdamage xext xfixes
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
CONFIGURE_ARGS=	--enable-oss=yes

PLIST_FILES=	bin/recordmydesktop share/man/man1/recordmydesktop.1.gz
PORTDOCS=	ChangeLog

OPTIONS_DEFINE=	DOCS JACK

JACK_LIB_DEPENDS=	libjack.so:audio/jack
JACK_CONFIGURE_OFF=	--enable-jack=no

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
