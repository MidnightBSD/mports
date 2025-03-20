PORTNAME=	mlmmj-archiver
DISTVERSION=	0.4
CATEGORIES=	mail www
MASTER_SITES=	https://fossil.nours.eu/${PORTNAME}/tarball/?r=${DISTVERSION}&name=./

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple mailing archiver designed for mlmmj
WWW=		https://fossil.nours.eu/mlmmj-archiver

LICENSE=	bsd2
BUILD_DEPENDS=	${LOCALBASE}/lib/libneo_cs.a:www/clearsilver

USES=		sqlite:3 uidfix pkgconfig

MAKE_ARGS=	MAN= LOCALBASE=${LOCALBASE}

PLIST_FILES=	bin/${PORTNAME}

do-install:
	${INSTALL_PROGRAM}  ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
