PORTNAME=	yandex-ddns
DISTVERSION=	g20200613
PORTREVISION=	37
CATEGORIES=	dns

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Use Yandex DNS as a dynamic DNS provider
WWW=		https://github.com/thekvs/yandex-ddns

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go

USE_GITHUB=	yes
GH_ACCOUNT=	thekvs
GH_TAGNAME=	1fd0d00

PLIST_FILES=	bin/yandex-ddns \
		share/examples/${PORTNAME}/yandex-ddns.example.toml

post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/yandex-ddns.example.toml \
	${EXAMPLESDIR}

.include <bsd.port.mk>
