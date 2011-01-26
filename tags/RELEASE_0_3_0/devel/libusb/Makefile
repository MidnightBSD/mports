# New ports collection makefile for:	libusb
# Date created:				27 January 2001
# Whom:					John Reynolds <johnjen@reynoldsnet.org>
#
# $FreeBSD: ports/devel/libusb/Makefile,v 1.21 2006/08/26 17:27:35 garga Exp $
# $MidnightBSD: mports/devel/libusb/Makefile,v 1.2 2008/05/17 09:45:29 crash Exp $
#

PORTNAME=	libusb
PORTVERSION=	0.1.12
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-0.1%20%28LEGACY%29/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library giving userland programs access to USB devices
LICENSE=        lgpl

OPTIONS=	SGML "Install developer guide from SGML" off

.include <bsd.port.pre.mk>

.if defined(WITH_SGML)
BUILD_DEPENDS+=	${LOCALBASE}/share/sgml/jade/catalog:${PORTSDIR}/textproc/jade \
		${LOCALBASE}/share/sgml/docbook/dsssl/modular/catalog:${PORTSDIR}/textproc/dsssl-docbook-modular \
		${LOCALBASE}/share/sgml/docbook/catalog:${PORTSDIR}/textproc/docbook \
		${LOCALBASE}/share/sgml/docbook/4.2/catalog:${PORTSDIR}/textproc/docbook-420
MAKE_ENV+=	SGML_CATALOG_FILES=${LOCALBASE}/share/sgml/iso8879/catalog:${LOCALBASE}/share/sgml/docbook/4.2/catalog:${LOCALBASE}/share/sgml/docbook/dsssl/modular/catalog:${LOCALBASE}/share/sgml/jade/catalog
PLIST_SUB=	SGML=""
.else
CONFIGURE_ARGS=	--disable-build-docs
PLIST_SUB=	SGML="@comment "
.endif

USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22

post-patch:
	@${REINPLACE_CMD} -e 's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|<stdint.h>|<inttypes.h>|' ${WRKSRC}/descriptors.c

post-install:
.if defined(WITH_SGML)
	@${MKDIR} ${DOCSDIR}/html
	@${INSTALL_DATA} ${WRKSRC}/doc/html/* ${DOCSDIR}/html
.endif

.include <bsd.port.post.mk>
