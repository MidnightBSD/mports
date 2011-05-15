#
# $MidnightBSD: mports/www/midori/Makefile,v 1.10 2010/01/23 21:57:20 laffer1 Exp $
#

PORTNAME=	midori
PORTVERSION=	0.1.7
PORTREVISION=	3
CATEGORIES=	www
MASTER_SITES=	http://goodies.xfce.org/releases/midori/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight web browser using WebKit browser engine
LICENSE=	lgpl

BUILD_DEPENDS=	intltool-merge:${PORTSDIR}/textproc/intltool
LIB_DEPENDS=	webkit-1.0.9:${PORTSDIR}/www/webkit-gtk2 \
		soup-2.4.1:${PORTSDIR}/devel/libsoup \
		idn.17:${PORTSDIR}/dns/libidn

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include/WebKit/webkit -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

CONFIGURE_ARGS=	--enable-sqlite \
		--enable-libidn

HAS_CONFIGURE=	yes
USE_GMAKE=	yes
USE_BZIP2=	yes
USE_PYTHON=	yes
USE_SQLITE=	yes

.include <bsd.port.mk>
