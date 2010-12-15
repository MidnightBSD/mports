# $MidnightBSD: mports/editors/abiword/Makefile,v 1.8 2010/05/30 22:32:46 laffer1 Exp $

PORTNAME=	abiword
PORTVERSION=	2.6.8
PORTREVISION=	2
CATEGORIES=	editors
MASTER_SITES=	http://www.abisource.com/downloads/%SUBDIR%/${PORTVERSION}/source/
MASTER_SITE_SUBDIR=	abiword
DIST_SUBDIR=	AbiWord

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source, cross-platform WYSIWYG word processor
LICENSE=	gpl2

# unzip is needed during the installation process
BUILD_DEPENDS=	${LOCALBASE}/bin/unzip:${PORTSDIR}/archivers/unzip
LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt \
		png.6:${PORTSDIR}/graphics/png \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		wv-1.2:${PORTSDIR}/textproc/wv \
		fribidi.3:${PORTSDIR}/converters/fribidi \
		goffice-0.4:${PORTSDIR}/devel/goffice04

USE_GMAKE=	yes
USE_ICONV=	yes
USE_GNOME=	gnomehack libglade2 libxml2 libgnomeprintui desktopfileutils
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-popt=${LOCALBASE} \
		--with-zlib=${LOCALBASE} \
		--with-libpng=${LOCALBASE} \
		--with-libiconv=${LOCALBASE} \
		--with-libjpeg-prefix=${LOCALBASE} \
		--disable-peer-config
MAKEFILE=	GNUmakefile
GNOME_MAKEFILEIN=GNUmakefile.in

ABIVERSION=	2.6
PLIST_SUB+=	ABIVERSION=${ABIVERSION}

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug \
			--enable-symbols
.endif

.ifndef(WITHOUT_GTKSPELL)
LIB_DEPENDS+=		enchant.1:${PORTSDIR}/textproc/enchant
CONFIGURE_ARGS+=	--enable-spellcheck
PLIST_SUB+=		DICT:=""
.else
CONFIGURE_ARGS+=	--disable-spellcheck
PLIST_SUB+=		DICT:="@comment "
.endif

.include <bsd.port.pre.mk>

#.if ${HAVE_GNOME:Mlibgnomeui}!=""
#USE_GNOME+=		libgnomeui
#CONFIGURE_ARGS+=	--enable-gnomeui
#PKGNAMESUFFIX:=		-gnome
#.else
#CONFIGURE_ARGS+=	--disable-gnomeui
#.endif

.if (defined(WITH_GUCHARMAP) || \
	exists(${LOCALBASE}/libdata/pkgconfig/gucharmap.pc)) && \
	!defined(WITHOUT_GUCHARMAP)
LIB_DEPENDS+=		gucharmap.6:${PORTSDIR}/deskutils/gucharmap
CONFIGURE_ARGS+=	--enable-gucharmap
.else
CONFIGURE_ARGS+=	--disable-gucharmap
.endif

pre-everything::
	@${ECHO_MSG} ""
	@${ECHO_MSG} "AbiWord2 has the following tunable option(s):"
	@${ECHO_MSG} "	WITH_DEBUG=yes		Enable debug."
	@${ECHO_MSG} "	WITH_GUCHARMAP=yes	Enable use of Gucharmap as the symbol insertion tool (default: auto)"
	@${ECHO_MSG} "	WITHOUT_GTKSPELL=yes	Don't use Enchant, but still enable spellchecking and install the dictionary."
	@${ECHO_MSG} ""

post-patch:
	@${REINPLACE_CMD} -e 's|-ansi||g ; s|-pedantic||g ; \
		s|/usr/X11R6|${LOCALBASE}|g' \
			${WRKSRC}/configure
	@${FIND} ${WRKSRC}/src/config/platforms -name "*.mk" | ${XARGS} \
		${REINPLACE_CMD} 's|-ansi||g ; s|-pedantic||g'
	@${FIND} ${WRKSRC} -name GNUmakefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]libdir[)]/@PACKAGE@|(datadir)/@PACKAGE@|g ; \
		s|[(]datadir[)]/icons|(datadir)/pixmaps|g'

post-install:
	@${MKDIR} ${PREFIX}/lib/${PORTNAME}-${ABIVERSION}/plugins
	@-update-desktop-database

.include <bsd.port.post.mk>
