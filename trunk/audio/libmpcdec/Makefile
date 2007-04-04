# New ports collection makefile for:   libmpcdec
# Date created:        29 November 2004
# Whom:                Koop Mast <kwm@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/libmpcdec/Makefile,v 1.12 2007/02/25 20:03:34 ahze Exp $
#

PORTNAME=	libmpcdec
PORTVERSION=	1.2.5
CATEGORIES=	audio
MASTER_SITES=	http://files.musepack.net/source/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High quality audio compression format

USE_BZIP2=	yes
USE_GNOME=	gnometarget
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-O3\ -fomit-frame-pointer||g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
