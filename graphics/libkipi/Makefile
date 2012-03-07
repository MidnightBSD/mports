# $MidnightBSD$
# $FreeBSD: ports/graphics/libkipi/Makefile,v 1.21 2011/07/29 20:10:34 kwm Exp $

PORTNAME=	libkipi
PORTVERSION=	0.1.6
CATEGORIES=	graphics kde devel
MASTER_SITES=	SF/kipi/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE Image Plugin Interface
LICENSE=	gpl2

USE_BZIP2=	yes
USE_KDELIBS_VER=3
USE_GNOME=	gnomehack pkgconfig
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GETTEXT=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g;s|-fno-schedule-insns -fno-inline||g' \
		${WRKSRC}/${CONFIGURE_SCRIPT}
	@${REINPLACE_CMD} 's/install-data-local: install-apidox/install-data-local:/' \
		${WRKSRC}/libkipi/Makefile.in
	@${TOUCH} ${WRKSRC}/libkipi/libkipi/*

.include <bsd.port.mk>
