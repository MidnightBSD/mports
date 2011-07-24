# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/shared-desktop-ontologies/Makefile,v 1.4 2011/03/25 10:12:32 avilla Exp $

PORTNAME=	shared-desktop-ontologies
PORTVERSION=	0.6.0
CATEGORIES=	x11-toolkits
MASTER_SITES=	SF/oscaf/${PORTNAME}/${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interoperability between desktops and collaborative environments
LICENSE=	agg

USE_BZIP2=	yes
USE_CMAKE=	yes
USE_GNOME=	pkgconfig

post-patch:
	@${REINPLACE_CMD} -e 's|share/pkgconfig|libdata/pkgconfig|g' \
			-e 's|shared-desktop-ontologies NONE|shared-desktop-ontologies|g' \
			-e 's|share/cmake/SharedDesktopOntologies|lib/cmake/SharedDesktopOntologies|' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
