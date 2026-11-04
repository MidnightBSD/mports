PORTNAME=	electric
DISTVERSION=	9.08.1
PORTREVISION=	1
CATEGORIES=	cad java
MASTER_SITES=	GNU \
		https://www.staticfreesoft.com/:1 \
		https://www.staticfreesoft.com/jmanual/:2
PKGNAMESUFFIX=	-ng
EXTRACT_SUFX=
DISTFILES=	${APP_JARFILE} ${SFS_JARFILE}:1 ${MANUAL_FILE}:2
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sophisticated VLSI design system
WWW=		https://www.staticfreesoft.com/

LICENSE=	gpl3

USES=		java

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}
DESKTOP_ENTRIES="Electric-NG" "${COMMENT}" "${PORTNAME}${PKGNAMESUFFIX}" \
			"${PORTNAME}${PKGNAMESUFFIX}" "Development;Electronics;Engineering;" false
NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	electric-ng
SUB_LIST=	JARFILE="${APP_JARFILE}" \
		LIBFILES="${LIBFILES}"

PLIST_SUB=	VERSION=${DISTVERSION:R}

OPTIONS_DEFINE=		3D BSH DOCS PLUGINS
OPTIONS_DEFAULT=	3D
OPTIONS_SUB=		yes

3D_DESC=	Enable 3D visualization via Java3D
BSH_DESC=	Enable embedded Java interpreter via BSH
PLUGINS_DESC=	Install IRSIM and 3D animation plugins

3D_RUN_DEPENDS=		${LOCALBASE}/openjdk8/jre/lib/ext/j3dcore.jar:java/java3d
BSH_RUN_DEPENDS=	${JAVALIBDIR}/bsh.jar:lang/bsh
BSH_VARS=		LIBFILES+=${JAVALIBDIR}/bsh.jar
PLUGINS_RUN_DEPENDS=	${JAVALIBDIR}/jmf.jar:java/jmf
PLUGINS_VARS=		LIBFILES+=${PREFIX}/libexec/${PORTNAME}${PKGNAMESUFFIX}/${SFS_JARFILE}

APP_JARFILE=	electricBinary-${DISTVERSION}.jar
ICON_FILENAME=	"com/sun/electric/tool/user/help/helphtml/iconplug.png"
MANUAL_FILE=	ElectricManual-${DISTVERSION:R}.pdf
PLUGINDIR=	${PREFIX}/libexec/${PORTNAME}${PKGNAMESUFFIX}
SFS_JARFILE=	electricSFS-${DISTVERSION:R}.jar

post-extract:
	cd ${DISTDIR}/${DIST_SUBDIR} && \
		${UNZIP_NATIVE_CMD} -d ${WRKDIR} ${APP_JARFILE} ${ICON_FILENAME}

do-install:
	${MKDIR} ${JAVAJARDIR}
	${INSTALL_DATA} ${DISTDIR}/${APP_JARFILE} ${JAVAJARDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/electric-ng ${PREFIX}/bin

	${INSTALL_DATA} ${WRKDIR}/${ICON_FILENAME} \
		${PREFIX}/share/pixmaps/electric-ng.png

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DISTDIR}/${MANUAL_FILE} ${FAKE_DESTDIR}${DOCSDIR}

post-install-PLUGINS-on:
	${MKDIR} ${FAKE_DESTDIR}${PLUGINDIR}
	${INSTALL_DATA} ${DISTDIR}/${SFS_JARFILE} ${FAKE_DESTDIR}${PLUGINDIR}

.include <bsd.port.mk>
