# $MidnightBSD: mports/www/webkit-gtk2/Makefile,v 1.15 2009/10/13 02:32:53 laffer1 Exp $

PORTNAME=	webkit
PORTVERSION=	0.0.45180
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	http://nightly.webkit.org/files/trunk/src/
PKGNAMESUFFIX=	-gtk2
DISTNAME=	WebKit-r${PORTVERSION:S/0.0.//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An opensource browser engine
LICENSE=	lgpl

BUILD_DEPENDS=	flex>=2.5.33:${PORTSDIR}/textproc/flex \
		gtkdocize:${PORTSDIR}/textproc/gtk-doc
		
LIB_DEPENDS=	icutu.38:${PORTSDIR}/devel/icu \
		curl.6:${PORTSDIR}/ftp/curl \
		soup-2.4.1:${PORTSDIR}/devel/libsoup \
		enchant.1:${PORTSDIR}/textproc/enchant

USE_SQLITE=	yes
USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 libxslt
USE_XORG=	xt
USE_PERL5=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	autoconf:262 automake:110 libtool:22
#USE_GSTREAMER=	theora
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		FLEX="${LOCALBASE}/bin/flex" 
		
CONFIGURE_ARGS=	--with-webkit-target=x11 \
		--enable-icon-database \
		--enable-svg \
		--with-unicode-backend=icu \
		--enable-fast-malloc \
		--enable-wml \
		--enable-channel-messaging \
		--disable-video \
		--enable-jit 

DATADIR=	${PREFIX}/share/webkit-1.0
		
MAKEFILE=	GNUmakefile

.include <bsd.port.pre.mk>

post-patch:
	${REINPLACE_CMD} -E 's|autoconf|${AUTOCONF}|g ; \
		s|([^-])automake|\1${AUTOMAKE}|g ; s|aclocal|${ACLOCAL}|g ; \
		s|autoheader|${AUTOHEADER}|g ; \
		s|LIBTOOLIZE=libtoolize|LIBTOOLIZE=${LIBTOOLIZE}|g ; \
		s|\$$srcdir/configure|#\$$srcdir/configure|g' \
			${WRKSRC}/autogen.sh
	@${FIND} ${WRKSRC} -name GNUmakefile.am | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g'

pre-configure:
	@(cd ${WRKSRC} && ${SH} autogen.sh)

post-install:
# Install compat pkg-config file so we don't have to patch ports
	${CP} ${PREFIX}/libdata/pkgconfig/webkit-1.0.pc \
		${PREFIX}/libdata/pkgconfig/WebKitGtk.pc

.include <bsd.port.post.mk>
