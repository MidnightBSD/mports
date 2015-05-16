# $MidnightBSD$
# $FreeBSD: head/devel/hwloc/Makefile 343246 2014-02-07 14:03:38Z decke $

PORTNAME=	hwloc
PORTVERSION=	1.9
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://www.open-mpi.org/software/hwloc/v${PORTVERSION}/downloads/ \
		http://icl.cs.utk.edu/open-mpi/software/hwloc/v${PORTVERSION}/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable Hardware Locality software package

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpciaccess.so:${PORTSDIR}/devel/libpciaccess

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-static \
			--enable-libxml2 \
			--disable-gl
USES=		pkgconfig pathfix iconv libtool tar:bzip2
USE_LDCONFIG=	yes
USE_GNOME=	libxml2

PORTDOCS=	*

OPTIONS_DEFINE=	CAIRO DOCS

CAIRO_CONFIGURE_OFF=	--disable-cairo --without-x
CAIRO_CONFIGURE_ON=	--enable-cairo --with-x
CAIRO_LIB_DEPENDS=		libcairo.so:${PORTSDIR}/graphics/cairo
CAIRO_USE=	XORG=x11

post-install:
	@${MKDIR} ${DOCSDIR}/html
	${INSTALL_DATA} ${WRKSRC}/doc/doxygen-doc/html/* ${DOCSDIR}/html/.

.include <bsd.port.mk>
