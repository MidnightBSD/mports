PORTNAME=	Xbae
PORTVERSION=	4.60.4
CATEGORIES=	x11-toolkits math
MASTER_SITES=	SF
DISTNAME=	xbae-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Motif-based widget which displays a grid of cells as a spreadsheet
WWW=		http://xbae.sourceforge.net/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN_aarch64=	Fails to link: missing sbrk

USES=		libtool motif
USE_LDCONFIG=	yes
USE_XORG=	ice sm x11 xext xt
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-production
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
