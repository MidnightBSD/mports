# $MidnightBSD$

PORTNAME=	psiconv
PORTVERSION=	0.9.8
PORTREVISION=	3
CATEGORIES=	converters devel
MASTER_SITES=	http://software.frodo.looijaard.name/psiconv/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Conversion utility to convert Psion 5(MX) files into other formats

LICENSE=	gpl2

USES=		gmake libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-imagemagick=no
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
