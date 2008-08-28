# New ports collection makefile for:	twolame
# Date created:		2005-05-02
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/audio/twolame/Makefile,v 1.2 2008/02/28 00:21:35 laffer1 Exp $
# $FreeBSD: ports/audio/twolame/Makefile,v 1.10 2007/01/03 00:19:35 mezz Exp $
#

PORTNAME=	twolame
PORTVERSION=	0.3.10
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://www.ecs.soton.ac.uk/~njh/twolame/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG Audio Layer 2 encoder
LICENSE=	gpl2

LIB_DEPENDS=	sndfile.1:${PORTSDIR}/audio/libsndfile

USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--mandir=${PREFIX}/man

MAN1=		twolame.1

post-patch:
	@${REINPLACE_CMD} -e 's| -O3||g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
