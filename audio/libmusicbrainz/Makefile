# New ports collection makefile for:	musicbrainz
# Date Created:				26 Oct 2000
# Whom:					Roman Shterenzon <roman@xpert.com>
#
# $MidnightBSD: mports/audio/libmusicbrainz/Makefile,v 1.3 2010/02/27 19:20:58 laffer1 Exp $
# $FreeBSD: ports/audio/libmusicbrainz/Makefile,v 1.32 2007/06/06 05:59:18 miwi Exp $
#

PORTNAME=	libmusicbrainz
PORTVERSION=	2.1.5
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.musicbrainz.org/pub/musicbrainz/ \
    		http://uk.musicbrainz.org/pub/musicbrainz/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	2nd generation incarnation of the CD Index - audio metadata
LICENSE=	gpl2

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2

CONFLICTS=	musicbrainz-1.*

USE_GMAKE=	yes
USE_GNOME=	gnomehack  pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g'	${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
