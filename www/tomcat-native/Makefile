PORTNAME=	tomcat-native
DISTVERSION=	1.3.0
PORTREVISION=	1
CATEGORIES=	www java
MASTER_SITES=	https://archive.apache.org/dist/tomcat/tomcat-connectors/native/${PORTVERSION}/source/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tomcat native library
WWW=		https://tomcat.apache.org/native-${PORTVERSION:R}-doc/

LICENSE=	Apache-2.0

LIB_DEPENDS=	libapr-1.so:devel/apr1

USES=		java libtool ssl
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-apr=${LOCALBASE} \
		--with-java-home=${JAVA_HOME} \
		--with-ssl=${OPENSSLBASE}

WRKSRC=	${WRKDIR}/${DISTNAME}/native

SOVERSION=	${PORTVERSION:S/^1.//1}
PLIST_FILES=	lib/libtcnative-1.a \
		lib/libtcnative-1.so \
		lib/libtcnative-1.so.0 \
		lib/libtcnative-1.so.0.${SOVERSION}

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libtcnative-1.so.0.${SOVERSION}

.include <bsd.port.mk>
