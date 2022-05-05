PORTNAME=	libdevq
PORTVERSION=	0.0.4
CATEGORIES=	devel
MASTER_SITES=	https://github.com/freebsd/${PORTNAME}/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic Device Query and Monitor interface

LICENSE=	bsd2

GNU_CONFIGURE=	yes
USES=		autoreconf libtool pathfix tar:xz
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

PATHFIX_MAKEFILEIN=	Makefile.am

OPTIONS_DEFINE=	PROGRAMS
OPTIONS_SUB=	yes
PROGRAMS_DESC=	Build diagnostic programs
PROGRAMS_CONFIGURE_ENABLE=programs

.include <bsd.port.mk>
