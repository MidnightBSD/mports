PORTNAME=	eclipse
DISTVERSION=	4.39
CATEGORIES=	java devel
ECLIPSE_TAG=	R${DISTVERSION:S|.|_|g}

DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Eclipse IDE
WWW=		https://www.eclipse.org/

LICENSE=	epl

ONLY_FOR_ARCHS=	amd64

BUILD_DEPENDS=	git:devel/git@lite \
		mvn:java/maven39 \
		zip:archivers/zip
LIB_DEPENDS=	libsecret-1.so:security/libsecret
RUN_DEPENDS=	webkit2-gtk_41>=0:www/webkit2-gtk@41

USES=		compiler:c++17-lang gl gmake gnome java pkgconfig
# The github repositories.  The repository under NorbertXYZ is for a predefined
# maven download, so the build does not need to download while do-build is running
USE_GITHUB=	yes
GH_TUPLE=	chirontt:eclipse.platform.releng.aggregator:${ECLIPSE_TAG}_maintenance \
		eclipse-jdt:eclipse.jdt:${ECLIPSE_TAG}:a/eclipse.jdt \
		eclipse-jdt:eclipse.jdt.core:${ECLIPSE_TAG}:b/eclipse.jdt.core \
		eclipse-jdt:eclipse.jdt.core.binaries:${ECLIPSE_TAG}:c/eclipse.jdt.core.binaries \
		eclipse-jdt:eclipse.jdt.debug:${ECLIPSE_TAG}:d/eclipse.jdt.debug \
		eclipse-jdt:eclipse.jdt.ui:${ECLIPSE_TAG}:e/eclipse.jdt.ui \
		chirontt:eclipse.pde:${ECLIPSE_TAG}_maintenance:f/eclipse.pde \
		chirontt:eclipse.platform:${ECLIPSE_TAG}_maintenance:g/eclipse.platform \
		chirontt:eclipse.platform.swt:${ECLIPSE_TAG}_maintenance:i/eclipse.platform.swt \
		chirontt:eclipse.platform.ui:${ECLIPSE_TAG}_maintenance:j/eclipse.platform.ui \
		chirontt:equinox:${ECLIPSE_TAG}_maintenance:k/equinox \
		chirontt:equinox.binaries:${ECLIPSE_TAG}_maintenance:l/equinox.binaries \
		chirontt:p2:${ECLIPSE_TAG}_maintenance:m/equinox.p2 \
		NorbertXYZ:eclipse-maven:${DISTVERSION}:n
USE_GL=		gl glu
USE_GNOME=	gtk30 gtk40
JAVA_VERSION=	21+

DESKTOP_ENTRIES=	"Eclipse" \
			"${COMMENT}" \
			"${PORTNAME}" \
			"${PORTNAME}" \
			"Development;IDE;Java;" \
			"false"
PORTSCOUT=	ignore:1
SUB_FILES=	${PORTNAME}

.include <bsd.port.pre.mk>

# -Dos.name=FreeBSD: the JVM reports os.name="MidnightBSD", so the embedded
# Equinox frameworks Tycho launches (e.g. doc-bundle schema-to-html) compute
# osgi.native.osname=midnightbsd and fail to resolve com.sun.jna's freebsd
# native capability, cascading to pde.core et al.  Masquerade as FreeBSD.
MAVEN_ENV=	MAVEN_OPTS="-Xmx2048m -Dos.name=FreeBSD" CC=${CC} CFLAGS="${CFLAGS}" JAVA_HOME=${JAVA_HOME}

# To make the build working, set the (maven) architecture to x86_64 instead of amd64
MAVEN_ARCH=	${ARCH:S|amd64|x86_64|}

# MidnightBSD's uname -s is "MidnightBSD", which the SWT/equinox native build
# scripts don't recognise (they only special-case FreeBSD), so they fall back to
# BSD make on GNU makefiles and fail.  Override OS so they take the FreeBSD path
# and use the freebsd.gtk.${MAVEN_ARCH} natives shipped by the chirontt repos.
MAVEN_ENV+=	OS=FreeBSD

MAVEN_PARAMS=	--offline \
		-Dmaven.repo.local=${WRKDIR}/eclipse-maven-${DISTVERSION} \
		-Dnative=gtk.freebsd.${MAVEN_ARCH} \
		-DskipTests clean verify

ECLIPSE_RESULT=	products/eclipse-sdk/target/products/org.eclipse.sdk.ide-freebsd.gtk.${MAVEN_ARCH}.tar.gz

.if ${COMPILER_TYPE} == clang
CFLAGS+=	-Wno-deprecated-non-prototype
.endif

_ICONS_PNG=	16 22 24 32 48 64 128 256 512 1024
_ICONS_SVG=	16 32 48
_ICONS_PATH=	${DATADIR}/plugins/org.eclipse.platform_${DISTVERSION}.0.v*

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAVEN_ENV} mvn ${MAVEN_PARAMS}

do-install:
	${MKDIR} ${DATADIR}
	${TAR} -x --directory ${DATADIR}/.. --file ${WRKSRC}/${ECLIPSE_RESULT}
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${PREFIX}/bin

	${MKDIR} ${_ICONS_PNG:C|([0-9]*)|${PREFIX}/share/icons/hicolor/\1x\1/apps|}
.for _ICON in ${_ICONS_PNG}
	${INSTALL_DATA} \
		${_ICONS_PATH}/${PORTNAME}${_ICON}.png \
		${PREFIX}/share/icons/hicolor/${_ICON}x${_ICON}/apps/${PORTNAME}.png
.endfor
.for _ICON in ${_ICONS_SVG}
	${INSTALL_DATA} \
		${_ICONS_PATH}/${PORTNAME}${_ICON}.svg \
		${PREFIX}/share/icons/hicolor/${_ICON}x${_ICON}/apps/${PORTNAME}.svg
.endfor

# Generate dynamic plist, to cater for different ARCHS.  The eclipse icons live
# under the shared share/icons/hicolor tree, so enumerate them explicitly rather
# than ${FIND}-ing that directory (which would also capture other ports' icons,
# as mports installs straight into PREFIX without a per-port stage dir).
post-install:
	cd ${PREFIX} && ${FIND} -s bin/${PORTNAME} share/${PORTNAME} -not -type d >> ${TMPPLIST}
	cd ${PREFIX} && ${FIND} -ds share/${PORTNAME} -type d | ${SED} -e 's,^,@dir ,' >> ${TMPPLIST}
.for _ICON in ${_ICONS_PNG}
	${ECHO_CMD} share/icons/hicolor/${_ICON}x${_ICON}/apps/${PORTNAME}.png >> ${TMPPLIST}
.endfor
.for _ICON in ${_ICONS_SVG}
	${ECHO_CMD} share/icons/hicolor/${_ICON}x${_ICON}/apps/${PORTNAME}.svg >> ${TMPPLIST}
.endfor

.include <bsd.port.post.mk>
