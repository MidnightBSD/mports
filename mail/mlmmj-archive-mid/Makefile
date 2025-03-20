PORTNAME=	mlmmj-archive-mid
DISTVERSION=	0.2
CATEGORIES=	mail www
MASTER_SITES=	https://fossil.nours.eu/${PORTNAME}/tarball/?r=${DISTVERSION}&name=./

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CGI helping mapping a message id to an archived mail
WWW=		https://fossil.nours.eu/mlmmj-archive-mid

LICENSE=	bsd2

LIB_DEPENDS=	libkcgi.so:www/kcgi

USES=		sqlite:3 uidfix pkgconfig

MAKE_ARGS=	MAN= LOCALBASE=${LOCALBASE}

PLIST_FILES=	bin/${PORTNAME}

do-install:
	${INSTALL_PROGRAM}  ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
