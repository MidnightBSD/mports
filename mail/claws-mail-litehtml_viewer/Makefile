PORTNAME=	litehtml_viewer

COMMENT=	Viewer plugin for HTML emails, using the litehtml library
WWW=		https://www.claws-mail.org/plugins.php

USES+=		compiler:c++11-lang
USE_GNOME=	cairo glib20
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libgumbo.so:devel/gumbo \
		libcurl.so:ftp/curl

# The configure script does not set REAL_CXX if CXX contains an absolute path.
CONFIGURE_ENV=	REAL_CXX="${CXX}"
# devel/gumbo is 0.10.x; configure only auto-enables the plugin for >= 0.12.
CONFIGURE_ARGS+=	--enable-litehtml_viewer-plugin

CLAWS_PLUGINS_BUILD=	${PORTNAME}

post-configure:
	@${RM} ${WRKSRC}/version

.include "../claws-mail/Makefile.claws"
.include <bsd.port.mk>
