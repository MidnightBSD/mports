# $MidnightBSD: mports/www/webkit-gtk2/Makefile,v 1.5 2009/04/08 18:30:00 ctriv Exp $

PORTNAME=	webkit
PORTVERSION=	0.0.42260
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
		curl.5:${PORTSDIR}/ftp/curl \
		soup-2.4.1:{PORTSDIR}/devel/libsoup

USE_SQLITE=	yes
USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 libxslt
USE_PERL5=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	autoconf:262 automake:110 libtool:15
USE_GSTREAMER=	gnomevfs theora
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		FLEX="${LOCALBASE}/bin/flex" 
		
CONFIGURE_ARGS=	--with-webkit-target=x11 \
		--enable-icon-database \
		--enable-svg \
		--enable-video \
		--disable-jit

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
