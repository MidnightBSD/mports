PORTNAME=	pgmodeler
PORTVERSION=	0.9.4
PORTREVISION=	2
DISTVERSIONPREFIX=	v
#DISTVERSIONSUFFIX=	-beta
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PostgreSQL Database Modeler
WWW=		http://pgmodeler.com.br/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c++11-lib gl gmake gnome pgsql pkgconfig qmake qt:5 \
		xorg
USE_GITHUB=	yes
USE_GNOME=	libxml2
USE_GL=		gl
USE_QT=		core gui network printsupport sql svg widgets testlib uitools \
		buildtools:build 
USE_XORG=	x11 xext

USE_LDCONFIG=	yes

LDFLAGS+=	-lexecinfo

QMAKE_SOURCE_PATH=	${WRKSRC}/${PORTNAME}.pro

post-patch:
	@${REINPLACE_CMD} -e 's|linux|unix|g' ${WRKSRC}/${PORTNAME}.pri

.include <bsd.port.mk>
