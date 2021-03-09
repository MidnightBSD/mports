# Created by: Tom Judge <tj@FreeBSD.org>

PORTNAME=	sigar
PORTVERSION=	1.7.3
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sigar system information API

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/NOTICE

USE_GITHUB=	yes
GH_ACCOUNT=	amishHammer
GH_TAGNAME=	b5af695

GNU_CONFIGURE=	yes
USES=		autoreconf libtool pkgconfig
INSTALL_TARGET=	install-strip

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

.include <bsd.port.mk>
