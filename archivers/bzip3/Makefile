PORTNAME=	bzip3
DISTVERSION=	1.4.0
PORTREVISION=	2
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/kspalaiologos/${PORTNAME}/releases/download/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Better and stronger spiritual successor to BZip2
WWW=		https://github.com/kspalaiologos/bzip3

LICENSE=	Apache-2.0 bsd2 lgpl3+
LICENSE_COMB=	multi
LICENSE_FILE_apache2=	${WRKSRC}/libsais-LICENSE
LICENSE_FILE_lgpl3+ =	${WRKSRC}/LICENSE

USES=		cmake pathfix tar:xz
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e "s|\(VERSION \)1\.3\.0|\1${DISTVERSION}|" \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
