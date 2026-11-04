# created by:	Chris Hutchinson <midnightbsd@BSDforge.com>

PORTNAME=	scrot
DISTVERSION=	1.10
PORTREVISION=	1
CATEGORIES=	graphics

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	SCReenshOT - command line screen capture utility
WWW=		https://github.com/resurrecting-open-source-projects/scrot

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	autoconf-archive>=0:devel/autoconf-archive
LIB_DEPENDS=	libImlib2.so:graphics/imlib2

USES=		autoreconf pkgconfig xorg
USE_GITHUB=	yes
GH_ACCOUNT=	resurrecting-open-source-projects
GNU_CONFIGURE=	yes
USE_XORG=	x11 xext xfixes xcomposite xinerama

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
