PORTNAME=	mate-user-guide
PORTVERSION=	1.24.0
PORTREVISION=	1
CATEGORIES=	misc mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MATE users guide

LICENSE=	gfdl
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool \
		intltool>=0.40.0:textproc/intltool
RUN_DEPENDS=	yelp:x11/yelp

PORTSCOUT=	limitw:1,even

USES=		gettext gmake tar:xz
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
