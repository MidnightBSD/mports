# New ports collection makefile for:    patch
# Date created:         24 Apr 2007
# Whom:                 laffer1
#
# $MidnightBSD: mports/devel/patch/Makefile,v 1.1 2007/04/28 03:21:49 laffer1 Exp $
#

PORTNAME=	patch
PORTVERSION=	2.5.4
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	patch

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU patch utility
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g

MAN1=		gpatch.1
PLIST_FILES=	bin/gpatch

post-patch:
	@${REINPLACE_CMD} -e 's!HAVE_SETMODE!HAVE_SETMODE_DISABLE!' \
		${WRKSRC}/config.hin

.include <bsd.port.mk>
