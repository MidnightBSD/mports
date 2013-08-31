# $MidnightBSD$

PORTNAME=	asio
PORTVERSION=	1.4.8
CATEGORIES=	net devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}%20(Stable)/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform C++ library for network and low-level I/O programming

LICENSE=	other

LIB_DEPENDS=	boost_thread:${PORTSDIR}/devel/boost-libs

GNU_CONFIGURE=	yes
USE_GMAKE=	yes

CONFIGURE_ARGS=	--with-boost=${LOCALBASE}/include

.include <bsd.port.mk>
