PORTNAME=	psftools
PORTVERSION=	1.0.13
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.seasip.info/Unix/PSF/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converters for simple fixed-width bitmap fonts

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-static
INSTALL_TARGET=	install-strip

PORTSCOUT=	ignore:1

.include <bsd.port.mk>
