# $MidnightBSD$
# $FreeBSD: head/devel/hwloc/Makefile 343246 2014-02-07 14:03:38Z decke $

PORTNAME=	hwloc
PORTVERSION=	1.11.7
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://www.open-mpi.org/software/hwloc/v${PORTVERSION:R}/downloads/ \
		http://icl.cs.utk.edu/open-mpi/software/hwloc/v${PORTVERSION:R}/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable Hardware Locality software package

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpciaccess.so:devel/libpciaccess

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static \
		--disable-opencl \
		--disable-cuda \
		--disable-nvml \
		--disable-gl
INSTALL_TARGET=	install-strip
USES=		iconv libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
USE_GNOME=	libxml2

PORTDOCS=	*

OPTIONS_DEFINE=	CAIRO DOCS
OPTIONS_SUB=	yes

CAIRO_CONFIGURE_OFF=	--disable-cairo --without-x
CAIRO_CONFIGURE_ON=	--enable-cairo --with-x
CAIRO_LIB_DEPENDS=	libcairo.so:graphics/cairo
CAIRO_USE=		XORG=x11

post-install:
	@${MKDIR} ${DOCSDIR}/html
	${INSTALL_DATA} ${WRKSRC}/doc/doxygen-doc/html/* ${DOCSDIR}/html/.

.include <bsd.port.mk>
