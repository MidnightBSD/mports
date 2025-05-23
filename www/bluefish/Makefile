PORTNAME=	bluefish
PORTVERSION=	2.2.15
CATEGORIES=	www editors
MASTER_SITES=	http://www.bennewitz.com/bluefish/stable/source/ \
		http://bluefish.mrball.net/stable/source/ \
		SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTML editor designed for the experienced web designer
WWW=		http://bluefish.openoffice.nl/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpcre.so:devel/pcre \
		libenchant.so:textproc/enchant

USES=		desktop-file-utils gettext gmake gnome libtool localbase \
		pkgconfig python:3.0-3.9 shared-mime-info shebangfix tar:bzip2
SHEBANG_FILES=	data/css_decompressor \
		data/cssmin.py \
		data/jsbeautify \
		data/jsmin.py \
		data/lorem-ipsum-generator \
		src/plugin_zencoding/zencoding/actions/__init__.py \
		src/plugin_zencoding/zencoding/actions/basic.py \
		src/plugin_zencoding/zencoding/actions/token.py \
		src/plugin_zencoding/zencoding/filters/__init__.py \
		src/plugin_zencoding/zencoding/filters/comment.py \
		src/plugin_zencoding/zencoding/filters/css.py \
		src/plugin_zencoding/zencoding/filters/escape.py \
		src/plugin_zencoding/zencoding/filters/format-css.py \
		src/plugin_zencoding/zencoding/filters/format.py \
		src/plugin_zencoding/zencoding/filters/haml.py \
		src/plugin_zencoding/zencoding/filters/html.py \
		src/plugin_zencoding/zencoding/filters/single-line.py \
		src/plugin_zencoding/zencoding/filters/trim.py \
		src/plugin_zencoding/zencoding/filters/xsl.py \
		src/plugin_zencoding/zencoding/html_matcher.py \
		src/plugin_zencoding/zencoding/resources.py \
		src/plugin_zencoding/zencoding/utils.py
USE_GNOME=	cairo intltool libxml2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-freedesktop_org-menu=${PREFIX}/share/applications \
		--with-freedesktop_org-mime=${PREFIX}/share/mime \
		--with-icon-path=${PREFIX}/share/pixmaps \
		--disable-update-databases
INSTALL_TARGET=	install-strip
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DEBUG DOCS TIDY
OPTIONS_SINGLE=	TOOLKIT
OPTIONS_SINGLE_TOOLKIT=	GTK2 GTK3
OPTIONS_DEFAULT=GTK3
OPTIONS_SUB=	yes

TOOLKIT_DESC=		GTK+ toolkit

DEBUG_CONFIGURE_ENABLE=	debugging-output
GTK2_USE=		gnome=gtk20
GTK2_CONFIGURE_ON=	--with-gtk2=yes
GTK2_LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
			libfreetype.so:print/freetype2
GTK3_LIB_DEPENDS=	libgucharmap_2_90.so:deskutils/gucharmap
GTK3_USE=		gnome=gtk30
TIDY_RUN_DEPENDS=	tidy4:www/tidy

.include <bsd.port.mk>
