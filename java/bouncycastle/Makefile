PORTNAME=	bouncycastle
PORTVERSION=	1.71
CATEGORIES=	java security
MASTER_SITES=	http://www.bouncycastle.org/download/ \
		http://polydistortion.net/bc/download/
DISTNAME=	crypto-${DVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cleanroom build of Java Cryptography Extensions
WWW=		https://www.bouncycastle.org/

# APACHE20 is used by pg/src/main/java/org/bouncycastle/apache/bzip2/*.
LICENSE=	Apache-2.0 mit
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.html

BUILD_DEPENDS=	${JAVALIBDIR}/junit.jar:java/junit \
		${JAVALIBDIR}/mail.jar:java/javamail
RUN_DEPENDS=	${JAVALIBDIR}/mail.jar:java/javamail

USES=		cpe java:ant,run
CPE_VENDOR=	${PORTNAME}
CPE_PRODUCT=	legion-of-the-bouncy-castle-java-crytography-api

MAKE_ARGS=	-f \
		ant/jdk${JDKNVERSION}+.xml
MAKE_ENV=	ANT_INCLUDE_SHARED_JARS=YES
ALL_TARGET=	build-provider build

CONFLICTS_INSTALL=	bouncycastle-1.4*

NO_ARCH=	yes

OPTIONS_DEFINE=		DOCS ZIPSRC
OPTIONS_DEFAULT=	ZIPSRC
OPTIONS_SUB=		yes

ZIPSRC_DESC=		Install bundled ZIP source files
ZIPSRC_ALL_TARGET=	zip-src

ARTIFACTSDIR=	${WRKSRC}/build/artifacts/jdk${JDKMVERSION}
DVERSION=	${PORTVERSION:S/.//}
JDKMVERSION=	1.5
JDKNVERSION=	15
JARSUFFIX=	-jdk${JDKNVERSION}to18-${DVERSION}.jar

.include <bsd.mport.options.mk>

# PR 220612: remove fork="true" in javac and fork="yes" in junit tasks
.if ${ARCH} == armv6 || ${ARCH} == armv7
EXTRA_PATCHES+=	${FILESDIR}/armv6-patch-bc+-build.xml
.endif

do-install:
	for src in $$(${FIND} ${ARTIFACTSDIR}/jars -name "*${JARSUFFIX}"); do \
		dst="$${src##*/}"; \
		dst="$${dst%%-jdk*}.jar"; \
		${INSTALL_DATA} "$$src" "${JAVAJARDIR}/$${dst}"; \
	done
# Install the bundlded version of bcprov.jar because we need a signed JAR.
# See bfca5d2c6e01d757f1f37c141c22645c2835104b for details.
	${INSTALL_DATA} ${WRKSRC}/jars/bcprov${JARSUFFIX} \
		${JAVAJARDIR}/bcprov.jar

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.html ${FAKE_DESTDIR}${DOCSDIR}
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/docs
	(cd ${WRKSRC} && ${COPYTREE_SHARE} docs "${FAKE_DESTDIR}${DOCSDIR}")
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/tls/docs
	(cd ${WRKSRC} && ${COPYTREE_SHARE} tls/docs "${FAKE_DESTDIR}${DOCSDIR}")
# Skip the lcrypto documentation since that JAR is not installed.
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	for src in $$(${FIND} ${ARTIFACTSDIR} -type d -name "docs"); do \
		dst="$${src%%-jdk*}"; \
		dst="$${dst##*/}"; \
		case $${dst} in lcrypto) continue;; esac; \
		(cd $${src} && ${COPYTREE_SHARE} . "${FAKE_DESTDIR}${DOCSDIR}/$${dst}"); \
	done

do-install-ZIPSRC-on:
	@${MKDIR} ${FAKE_DESTDIR}${DATADIR}
	for src in $$(${FIND} ${ARTIFACTSDIR} -name "src.zip"); do \
		dst="$${src%%-jdk*}"; \
		dst="$${dst##*/}-src.zip"; \
		${INSTALL_DATA} "$$src" "${FAKE_DESTDIR}/${DATADIR}/$${dst}"; \
	done

.include <bsd.port.mk>
