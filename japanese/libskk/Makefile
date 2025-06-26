PORTNAME=	libskk
DISTVERSION=	1.0.5
PORTREVISION=	1
CATEGORIES=	japanese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to deal with Japanese Kana-to-Kanji conversion method
WWW=		https://github.com/ueno/libskk

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	p5-XML-Parser>=0:textproc/p5-XML-Parser
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libjson-glib-1.0.so:devel/json-glib \
		libxkbcommon.so:x11/libxkbcommon

USES=		autoreconf gmake gnome libtool pathfix pkgconfig vala:build
USE_GITHUB=	yes
GH_ACCOUNT=	ueno
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
USE_GNOME=	introspection:build
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

PORTDOCS=	ChangeLog NEWS README

CFLAGS+=	-Wno-error=int-conversion

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext
NLS_USES_OFF=	gettext-tools

.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
