# $MidnightBSD$

PORTNAME=	kexchange
PORTVERSION=	1.0
PORTREVISION=	6
CATEGORIES=	finance kde
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE currency converter
LICENSE=	gpl2

USE_KDELIBS_VER=3
USE_AUTOTOOLS=	libtool

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
