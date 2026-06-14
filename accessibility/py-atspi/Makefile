PORTNAME=	atspi
DISTVERSION=	2.58.2
CATEGORIES=	accessibility x11-toolkits python
MASTER_SITES=	GNOME
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyatspi-${DISTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python API for the D-BUS based SPI framework
WWW=		https://gitlab.gnome.org/GNOME/pyatspi2

LICENSE=	lgpl

USES=		gnome localbase meson pkgconfig python tar:xz
USE_PYTHON=	flavors py3kplist
USE_GNOME=	pygobject3
BINARY_ALIAS=	python3=${PYTHON_CMD}
NO_ARCH=	yes

RUN_DEPENDS=	${LOCALBASE}/libexec/at-spi2-registryd:accessibility/at-spi2-core

CONFLICTS=	at-spi-1.[0-9]*
PORTSCOUT=	limitw:1,even

.include <bsd.port.mk>
