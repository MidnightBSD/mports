# New ports collection makefile for:	libxml
# Date created:				28 September 1998
# Whom:					Yukihiro Nakai <Nakai@technologist.com>
#
# $MidnightBSD: mports/textproc/libxml/Makefile,v 1.2 2008/08/25 19:12:08 laffer1 Exp $
# $FreeBSD: ports/textproc/libxml/Makefile,v 1.57 2007/01/28 09:07:45 kris Exp $
#

PORTNAME=	libxml
PORTVERSION=	1.8.17
PORTREVISION=	4
CATEGORIES=	textproc gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/libxml/1.8

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML parser library for GNOME
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

pre-patch:
	@${FIND} ${WRKSRC} -name "*.[ch]" | ${XARGS} ${REINPLACE_CMD} -e \
		's|malloc\.h|stdlib.h|g'

.include <bsd.port.mk>
