PORTNAME=	atkmm
DISTVERSION=	2.36.4
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	26

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for the ATK API, 2.36 series
WWW=		https://www.gtkmm.org/

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c++17-lang gnome localbase:ldflags meson pkgconfig \
		python:build tar:xz
USE_GNOME=	atk glibmm26
USE_LDCONFIG=	yes

MESON_ARGS=	-Dmaintainer-mode=false \
		-Dbuild-documentation=false

PORTSCOUT=	limitw:1,even

.include <bsd.port.mk>
