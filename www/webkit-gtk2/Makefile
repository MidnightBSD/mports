# $MidnightBSD: mports/www/webkit-gtk2/Makefile,v 1.18 2011/07/03 16:44:26 laffer1 Exp $
# $FreeBSD: ports/www/webkit-gtk2/Makefile,v 1.40 2011/06/09 10:11:24 kwm Exp $

PORTNAME=	webkit
PORTVERSION=	1.4.2
CATEGORIES=	www
MASTER_SITES=	http://webkitgtk.org/
PKGNAMESUFFIX=	-gtk2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An opensource browser engine
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:${PORTSDIR}/textproc/flex \
		${LOCALBASE}/bin/gperf:${PORTSDIR}/devel/gperf \
		g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	enchant.1:${PORTSDIR}/textproc/enchant \
		curl.6:${PORTSDIR}/ftp/curl \
		sqlite3.8:${PORTSDIR}/databases/sqlite3 \
		soup-2.4.1:${PORTSDIR}/devel/libsoup \
		icutu.46:${PORTSDIR}/devel/icu

USE_GETTEXT=	yes
WANT_GSTREAMER=	yes
MAKE_JOBS_SAFE=	yes
USE_XORG=	xt
USE_BISON=	build
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gtk20 libxslt ltverhack
USE_PERL5=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		ac_cv_path_FLEX="${LOCALBASE}/bin/flex" \
		ac_cv_path_DOLT_BASH=""
CONFIGURE_ARGS=	--enable-icon-database \
		--enable-svg \
		--enable-svg-fonts \
		--with-gtk=2.0 \
		--enable-introspection
MAKEFILE=	GNUmakefile
GLIB_SCHEMAS=	org.webkitgtk-1.0.gschema.xml

BROWSER_PLUGINS_DIR?=	${LOCALBASE}/lib/browser_plugins/symlinks/webkit-gtk2
#_BROWSER_PLUGINS_DIR=	${BROWSER_PLUGINS_DIR:S|^/|"|:S|/|", "|g}",

OPTIONS=	VIDEO "Enable video support" on \
		DEBUG "Build with debug support" off

.include <bsd.port.pre.mk>

.if defined(WITH_VIDEO)
USE_GSTREAMER+=	yes
CONFIGURE_ARGS+=--enable-video
.else
CONFIGURE_ARGS+=--disable-video
.endif

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=--enable-debug
.else
CONFIGURE_ARGS+=--disable-debug
.endif

.if ${OSVERSION} < 3000
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-JavaScriptCore_yarr_RegexJIT.h \
		${FILESDIR}/extra-patch-JavaScriptCore_assembler_MacroAssemblerCodeRef.h
BROKEN=		does not compile on 0.3
.endif

.if ${PERL_LEVEL} >= 501400
BUILD_DEPENDS+=	p5-Switch>0:${PORTSDIR}/lang/p5-Switch
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%BROWSER_PLUGINS_DIR%%|${BROWSER_PLUGINS_DIR}|' \
		${WRKSRC}/Source/WebCore/plugins/PluginDatabase.cpp
	@${FIND} ${WRKSRC} -name GNUmakefile.* | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g'
# disable static library.
	@${REINPLACE_CMD} -e 's|^build_old_libs=yes|build_old_libs=no|' \
		${WRKDIR}/gnome-libtool
	@${REINPLACE_CMD} -e 's|/usr/bin/gcc|${CC}|' \
		${WRKSRC}/Source/WebCore/dom/make_names.pl \
		${WRKSRC}/Source/WebCore/css/make-css-file-arrays.pl \
		${WRKSRC}/Source/WebCore/bindings/scripts/IDLParser.pm
	@${REINPLACE_CMD} -e 's|"gperf|"${LOCALBASE}/bin/gperf|g' \
		${WRKSRC}/Source/WebCore/css/makevalues.pl \
		${WRKSRC}/Source/WebCore/css/makeprop.pl \
		${WRKSRC}/Source/WebCore/make-hash-tools.pl

.include <bsd.port.post.mk>
