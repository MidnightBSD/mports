# $MidnightBSD$

PORTNAME=	asio
PORTVERSION=	1.10.4
CATEGORIES=	net devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}%20(Stable)/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform C++ library for network and low-level I/O programming

LICENSE=	other

RUN_DEPENDS=	${LOCALBASE}/include/boost/chrono/system_clocks.hpp:${PORTSDIR}/devel/boost-libs

GNU_CONFIGURE=	yes
USES=		gmake tar:bzip2
NO_BUILD=	yes
INSTALL_TARGET=	install-data

.include <bsd.port.mk>
