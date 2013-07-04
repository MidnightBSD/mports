# $MidnightBSD: mports/devel/patch/Makefile,v 1.4 2011/02/02 20:17:33 laffer1 Exp $

PORTNAME=	patch
PORTVERSION=	2.7
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	patch

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU patch utility
LICENSE=	gpl3

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--program-prefix=g
USE_GMAKE=	yes
USE_XZ=		yes

MAN1=		gpatch.1
PLIST_FILES=	bin/gpatch

.include <bsd.port.mk>
