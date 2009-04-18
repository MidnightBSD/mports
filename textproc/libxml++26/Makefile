# $MidnightBSD: mports/textproc/libxml++26/Makefile,v 1.1 2007/08/29 04:18:11 laffer1 Exp $

PORTNAME=	libxml++
PORTVERSION=	2.24.3
CATEGORIES=	textproc
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML API for C++
LICENSE=	lgpl

LIB_DEPENDS=	glibmm-2.4.3:${PORTSDIR}/devel/glibmm
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

LATEST_LINK=	libxml++26

USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget libxml2 pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

PLIST_SUB=	VERSION="2.6" API_VERSION="2.6" DOC_VERSION=${PORTVERSION:R}

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/examples//' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e '/^gentoo_ltmain_version=/s/`.*`/$$gentoo_lt_version/' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/^library_configdir =/s/libdir/includedir/' \
	    	${WRKSRC}/libxml++/Makefile.in
	@${REINPLACE_CMD} -e '/^Cflags:/s/libdir/includedir/' \
	    	${WRKSRC}/libxml++-2.6.pc.in
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -E '/^SUBDIRS = /s/(docs|examples)//g' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
