PORTNAME=	mcron
PORTVERSION=	1.2.3
CATEGORIES=	sysutils
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	100% compatible replacement for Vixie cron
WWW=		https://www.gnu.org/software/mcron/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake guile:3.0 pkgconfig
GNU_CONFIGURE=	yes

CONFLICTS_INSTALL=	interchange isc-cron # bin/crontab

#TEST_TARGET=	check
NO_TEST=	yes

INFO=		mcron

PLIST_SUB=	GUILE_SITE=share/guile/site/3.0 \
		GUILE_SITE_CCACHE=lib/guile/3.0/site-ccache

.include <bsd.port.mk>
