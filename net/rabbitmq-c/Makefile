PORTNAME=	rabbitmq-c
DISTVERSIONPREFIX=	v
DISTVERSION=	0.13.0
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RabbitMQ C AMQP client library
WWW=		https://www.rabbitmq.com/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libpopt.so:devel/popt

USES=		cmake localbase ssl
USE_GITHUB=	yes
GH_ACCOUNT=	alanxz
USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_TOOLS
CMAKE_OFF=	BUILD_EXAMPLES

NO_TEST=	yes

OPTIONS_DEFINE=		STATIC
OPTIONS_DEFAULT=	STATIC
OPTIONS_SUB=		yes

STATIC_CMAKE_BOOL=	BUILD_STATIC_LIBS

.include <bsd.port.mk>
