# $MidnightBSD$
# $FreeBSD: ports/graphics/gwenview/Makefile,v 1.40 2011/07/05 02:51:12 tabthorpe Exp $

PORTNAME=	gwenview
PORTVERSION=	1.4.2
CATEGORIES=	graphics kde
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An image viewer and browser for the KDE environment
LICENSE=	gpl2

LIB_DEPENDS=	kipi.2:${PORTSDIR}/graphics/libkipi \
		exiv2.10:${PORTSDIR}/graphics/exiv2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_KDELIBS_VER=3
USE_AUTOTOOLS=	libtool

CONFIGURE_ARGS+=--enable-kipi

MAN1=	gwenview.1

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
