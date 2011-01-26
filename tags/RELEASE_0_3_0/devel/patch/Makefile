# New ports collection makefile for:    patch
# Date created:         24 Apr 2007
# Whom:                 laffer1
#
# $MidnightBSD: mports/devel/patch/Makefile,v 1.2 2008/08/26 19:29:53 laffer1 Exp $
#

PORTNAME=	patch
PORTVERSION=	2.6.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	patch

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU patch utility
LICENSE=	gpl3

USE_XZ=		yes
USE_AUTOTOOLS=	autoconf:262 aclocal:110
CONFIGURE_ARGS=	--program-prefix=g
USE_GMAKE=	yes

MAN1=		gpatch.1
PLIST_FILES=	bin/gpatch

post-patch:
	@${REINPLACE_CMD} -e 's!HAVE_SETMODE!HAVE_SETMODE_DISABLE!' \
		${WRKSRC}/config.hin

.include <bsd.port.mk>
