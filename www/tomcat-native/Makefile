PORTNAME=	tomcat-native
PORTVERSION=	1.2.38
CATEGORIES=	www java
MASTER_SITES=	https://archive.apache.org/dist/tomcat/tomcat-connectors/native/${PORTVERSION}/source/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tomcat native library
WWW=		https://tomcat.apache.org/native-1.2-doc/

LICENSE=	apache2

LIB_DEPENDS=	libapr-1.so:devel/apr1

WRKSRC=		${WRKDIR}/${DISTNAME}/native

USES=		libtool ssl
USE_JAVA=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-apr=${LOCALBASE} \
		--with-java-home=${JAVA_HOME} \
		--with-ssl=${OPENSSLBASE}

PLIST_FILES=	lib/libtcnative-1.a \
		lib/libtcnative-1.so \
		lib/libtcnative-1.so.0 \
		lib/libtcnative-1.so.0.2.38

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libtcnative-1.so.0.2.38

.include <bsd.port.mk>
