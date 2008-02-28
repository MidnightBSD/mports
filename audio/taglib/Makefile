# New ports collection makefile for:	taglib
# Date Created:				06 Nov 2003
# Whom:				 	Frank Laszlo <laszlof@vonostingroup.com>
#
# $FreeBSD: ports/audio/taglib/Makefile,v 1.13 2006/05/03 05:14:29 edwin Exp $
# $MidnightBSD: mports/audio/taglib/Makefile,v 1.1 2007/01/20 19:04:27 laffer1 Exp $
#

PORTNAME=	taglib
PORTVERSION=	1.4
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	http://ktown.kde.org/~wheeler/files/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating ID3 tags and Ogg comments

USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

CONFIGURE_TARGET=
CONFIGURE_ARGS+=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

post-patch:
	@${REINPLACE_CMD} -e \
	"s#\$$(libdir)/pkgconfig#${PREFIX}/libdata/pkgconfig#g" \
	${WRKSRC}/taglib/Makefile.in

.include <bsd.port.mk>
