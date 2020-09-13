PORTNAME=	jna
PORTVERSION=	4.5.2
CATEGORIES=	devel java

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java access to native shared libraries

LICENSE=	apache2 lgpl2.1
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_armv6=		fails to compile: build.xml: compilation failed
BROKEN_armv7=		fails to compile: build.xml: compilation failed

USES=		autoreconf:build gmake libtool xorg
USE_ANT=	yes
USE_JAVA=       yes
JAVA_VERSION=   8+
USE_XORG=	x11 xt
MAKE_ARGS=	-DCC="${CC}" -DLD="${LD}"
MAKE_ENV=	ANT_OPTS=-Drelease -DARCH=${ANT_ARCH} JAVACMD=${JAVA}

USE_GITHUB=	yes
GH_ACCOUNT=	java-native-access

PORTDOCS=	javadoc platform-${PORTVERSION}-javadoc.jar
PLIST_FILES=	%%JAVAJARDIR%%/jna-platform.jar \
		%%JAVAJARDIR%%/jna.jar

ALL_TARGET=	native jar
.if defined(MAGUS)
NO_TEST=	yes
.else
TEST_TARGET=	test
.endif

OPTIONS_DEFINE=	DOCS

ANT_ARCH=	${ARCH:S/amd64/x86-64/:S/i386/x86/:S/powerpc64/ppc64/}

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/native/Makefile

post-build-DOCS-on:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${ANT} javadoc

do-install:
	${INSTALL_DATA} ${WRKSRC}/build/midnightbsd-${ANT_ARCH}.jar \
		${STAGEDIR}${JAVAJARDIR}/jna-platform.jar
	${INSTALL_DATA} ${WRKSRC}/build/jna.jar \
		${STAGEDIR}${JAVAJARDIR}/jna.jar

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@cd ${WRKSRC}/doc && ${COPYTREE_SHARE} javadoc ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/dist/platform-${PORTVERSION}-javadoc.jar \
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
