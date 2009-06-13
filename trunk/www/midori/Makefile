#
# $MidnightBSD: mports/www/midori/Makefile,v 1.4 2009/04/08 18:46:03 ctriv Exp $
#

PORTNAME=	midori
PORTVERSION=	0.1.6
CATEGORIES=	www
MASTER_SITES=	http://goodies.xfce.org/releases/midori/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight web browser using WebKit browser engine
LICENSE=	lgpl

LIB_DEPENDS=	webkit-1.0.4:${PORTSDIR}/www/webkit-gtk2 \
		soup-2.4.1:${PORTSDIR}/devel/libsoup

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include/WebKit/webkit -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

CONFIGURE_ARGS=	--enable-sqlite

HAS_CONFIGURE=	yes
USE_GMAKE=	yes
USE_BZIP2=	yes
USE_PYTHON=	yes
USE_SQLITE=	yes

.include <bsd.port.mk>
