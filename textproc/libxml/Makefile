# $MidnightBSD: mports/textproc/libxml/Makefile,v 1.4 2011/02/02 21:23:47 laffer1 Exp $
# $FreeBSD: ports/textproc/libxml/Makefile,v 1.57 2007/01/28 09:07:45 kris Exp $

PORTNAME=	libxml
PORTVERSION=	1.8.17
PORTREVISION=	4
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML parser library for GNOME
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes

pre-patch:
	@${FIND} ${WRKSRC} -name "*.[ch]" | ${XARGS} ${REINPLACE_CMD} -e \
		's|malloc\.h|stdlib.h|g'

.include <bsd.port.mk>
