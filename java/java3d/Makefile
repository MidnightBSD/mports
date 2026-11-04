PORTNAME=	java3d
PORTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES=	java graphics games devel
MASTER_SITES=	https://sites.google.com/site/daemonwizard/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides API for creating and manipulation of 3D geometry
WWW=		https://www.oracle.com/java/technologies/javase/java-3d.html \
		https://download.java.net/media/java3d/builds/release/1.5.2/README-download.html

LICENSE=	bsd2 gpl2
LICENSE_COMB=	multi

BROKEN_aarch64=		fails to compile: GVector.java:168: bad use of '>'
BROKEN_armv6=		fails to compile: build.xml: Compile failed; see the compiler error output for details
BROKEN_armv7=		fails to compile: build.xml: Compile failed; see the compiler error output for details

USES=		compiler:c11 gl java:ant,run tar:bzip2 xorg
JAVA_VERSION=	8
USE_GL=		gl
USE_XORG=	xt
JAVA_VENDOR=	openjdk
LLD_UNSAFE=	yes

PLIST_SUB+=	JAVA_HOME=${JAVA_HOME:S/^${PREFIX}\///} ARCH=${ARCH}

DOCSSRC=	${WRKSRC}/j3d-core/build/freebsd/javadocs/docs-public
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-patch:
	${REINPLACE_CMD} -e 's|gcc|${CC}|g' \
		${WRKSRC}/j3d-core/src/native/ogl/build-freebsd.xml

do-build:
	cd ${WRKSRC}/vecmath && ${SETENV} ${MAKE_ENV} ${FAKE_MAKEENV} ${ANT} dist
	cd ${WRKSRC}/j3d-core \
		&& ${SETENV} ${MAKE_ENV} ${FAKE_MAKEENV} ${ANT} -Dbuild.type=fcs \
						-Dis${OPSYS}=yes -DisFreeBSD=yes\
						-Dports.localbase=${LOCALBASE} \
						jar-opt

post-build-DOCS-on:
	cd ${WRKSRC}/j3d-core \
		&& ${SETENV} ${MAKE_ENV} ${FAKE_MAKEENV} ${ANT} -Dbuild.type=fcs \
						-Dis${OPSYS}=yes -DisFreeBSD=yes \
						docs-public

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${JAVA_HOME}/jre/lib/ext
	${INSTALL_DATA} \
		${WRKSRC}/vecmath/dist/lib/ext/vecmath.jar \
		${WRKSRC}/j3d-core/build/default/opt/lib/ext/j3dcore.jar \
		${WRKSRC}/j3d-core/build/default/opt/lib/ext/j3dutils.jar \
		${FAKE_DESTDIR}${JAVA_HOME}/jre/lib/ext
	@${MKDIR} ${FAKE_DESTDIR}${JAVA_HOME}/jre/lib/${ARCH}
	${INSTALL} \
		${WRKSRC}/j3d-core/build/default/opt/native/libj3dcore-ogl.so \
		${FAKE_DESTDIR}${JAVA_HOME}/jre/lib/${ARCH}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${DOCSSRC} && ${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
