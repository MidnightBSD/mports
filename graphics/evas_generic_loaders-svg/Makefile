# Created by: Grzegorz Blach <gblach@FreeBSD.org>


PORTNAME=	svg
PORTVERSION=	1.15.0
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://download.enlightenment.org/rel/libs/${PKGNAMEPREFIX:S/-//}/
PKGNAMEPREFIX=	evas_generic_loaders-
DISTNAME=	${PKGNAMEPREFIX}${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional loader for Evas (svg)

LICENSE=	gpl2

LIB_DEPENDS=	libefl.so:${PORTSDIR}/devel/efl

DIST_SUBDIR=	enlightenment
GNU_CONFIGURE=	yes
USES=		pkgconfig tar:xz
USE_GNOME=	librsvg2
USE_LDCONFIG=	yes

BINSRC=		${WRKSRC}/src/bin/${PORTNAME}

do-build:
	${MAKE} ${MAKE_ARGS} ${FAKE_MAKEARGS} -C ${BINSRC}

do-install:
	${MAKE} ${MAKE_ARGS} ${FAKE_MAKEARGS} -C ${BINSRC} install

.include <bsd.port.mk>
