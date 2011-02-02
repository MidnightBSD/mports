# $MidnightBSD: mports/www/webkit-gtk2/Makefile,v 1.16 2010/05/31 20:29:41 laffer1 Exp $

PORTNAME=	webkit
PORTVERSION=	1.1.9
PORTREVISION=	0
CATEGORIES=	www
MASTER_SITES=	http://webkitgtk.org/
PKGNAMESUFFIX=	-gtk2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An opensource browser engine
LICENSE=	lgpl

BUILD_DEPENDS=	flex>=2.5.33:${PORTSDIR}/textproc/flex \
		g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
		
LIB_DEPENDS=	icutu.38:${PORTSDIR}/devel/icu \
		curl.6:${PORTSDIR}/ftp/curl \
		soup-2.4.1:${PORTSDIR}/devel/libsoup \
		enchant.1:${PORTSDIR}/textproc/enchant

USE_GETTEXT=	yes
USE_SQLITE=	yes
USE_BISON=	build
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 libxslt
USE_XORG=	xt
USE_PERL5=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	autoconf automake libtool autoreconf aclocal
USE_GSTREAMER=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		FLEX="${LOCALBASE}/bin/flex" 
		
CONFIGURE_ARGS=	--with-webkit-target=x11 \
		--enable-icon-database \
		--enable-svg \
		--enable-svg-fonts \
		--with-unicode-backend=icu \
		--enable-fast-malloc \
		--enable-wml \
		--enable-channel-messaging \
		--disable-video \
		--enable-jit \
		--enable-static \
		--disable-debug \
		--enable-introspection

DATADIR=	${PREFIX}/share/webkit-1.0
BROWSER_PLUGINS_DIR?= ${LOCALBASE}/lib/browser_plugins/symlinks/webkit-gtk2
		
MAKEFILE=	GNUmakefile

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|%%BROWSER_PLUGINS_DIR%%|${BROWSER_PLUGINS_DIR}|' \
		${WRKSRC}/WebCore/plugins/PluginDatabase.cpp
	@${FIND} ${WRKSRC} -name GNUmakefile.am | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g'
	@${REINPLACE_CMD} -e 's|/usr/bin/gcc|${CC}|' \
		${WRKSRC}/WebCore/dom/make_names.pl \
		${WRKSRC}/WebCore/css/make-css-file-arrays.pl \
		${WRKSRC}/WebCore/bindings/scripts/IDLParser.pm

post-install:
# Install compat pkg-config file so we don't have to patch ports
	${CP} ${PREFIX}/libdata/pkgconfig/webkit-1.0.pc \
		${PREFIX}/libdata/pkgconfig/WebKitGtk.pc

.include <bsd.port.post.mk>
