# $MidnightBSD$

PORTNAME=	google-earth
PORTVERSION=	6.0.3.2197
PORTREVISION=	1
PORTEPOCH=	3
CATEGORIES=	astro deskutils geography
#MASTER_SITES=	http://dl.google.com/earth/client/advanced/previous/:previous \
#		http://dl.google.com/earth/client/current/:current
#DISTFILES=	GoogleEarthLinux.bin:current
DIST_SUBDIR=	google-earth/${PORTVERSION}
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Explore, Search, and Discover

LICENSE=	unknown

EXTRACT_DEPENDS=	unmakeself:${PORTSDIR}/archivers/unmakeself

RESTRICTED=	Not really sure about the redistribution terms

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:C/\..*//g}/

#OPTIONS_DEFINE=	NVIDIA

USE_LINUX=	yes
USE_LINUX_APPS=	xorglibs curl
USES=		perl5 shared-mime-info desktop-file-utils
USE_PERL5=	patch build

.include <bsd.mport.options.mk>

UNMAKESELF=	${LOCALBASE}/bin/unmakeself

.if ${PORT_OPTIONS:MNVIDIA}
RUN_DEPENDS+=	${LINUXBASE}/usr/lib/libGL.so.1:${PORTSDIR}/x11/nvidia-driver
.else
USE_LINUX_APPS+=	dri libpciaccess
LIBGL_ALWAYS_SOFTWARE=LIBGL_ALWAYS_SOFTWARE=yes
.endif

.include <bsd.port.pre.mk>

do-extract:
	@${MKDIR} ${WRKSRC}
	@${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/mime/packages
	@${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/applications
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/${_DISTFILES} ${WRKSRC}
	@cd ${WRKSRC} && ${UNMAKESELF} ${_DISTFILES} && ${RM} -f ${_DISTFILES}
	@cd ${WRKSRC} && ${TAR} xf googleearth-data.tar && ${RM} -f googleearth-data.tar
	@cd ${WRKSRC} && ${TAR} xf googleearth-linux-x86.tar && ${RM} -f googleearth-linux-x86.tar

post-patch:
	@${REINPLACE_CMD} -e '/OS.*=/s|linux|FreeBSD|' ${WRKSRC}/drivers.ini
	@${REINPLACE_CMD} -e 's|^# Set the home.*|GOOGLEEARTH_DATA_PATH=${DATADIR}|; \
		s|%%LIBGL_ALWAYS_SOFTWARE%%|${LIBGL_ALWAYS_SOFTWARE}|' ${WRKSRC}/bin/googleearth
	@${REINPLACE_CMD} -i "" -e "s|^# Let's boogie.*|rm -f ${LINUXBASE}\$${HOME}/.googleearth/instance-running-lock|" ${WRKSRC}/bin/googleearth
	@${REINPLACE_CMD} -i "" -e 's/^TMPPATH.*/exit 0/' ${WRKSRC}/postinstall.sh
	@${REINPLACE_CMD} -i "" -e 's|\"\$$SETUP_INSTALLPATH/|\"${WRKSRC}/|' ${WRKSRC}/postinstall.sh
	@${REINPLACE_CMD} -i "" -e 's|\$$SETUP_INSTALLPATH/googleearth |${PREFIX}/bin/googleearth |' ${WRKSRC}/postinstall.sh
	${RM} ${WRKSRC}/libcurl.so.4
	${PERL} -i -pe 's|/lib/ld-lsb.so.3\0\0\0|/lib/ld-linux.so.2\0|' ${WRKSRC}/googleearth-bin

do-build:
	@${SETENV} SETUP_INSTALLPATH=${DATADIR} ${WRKSRC}/postinstall.sh
	@cd ${WRKSRC} && ${RM} -rf setup.* preuninstall.sh postinstall.sh \
		bin/googleearth.orig

do-install:
	${MKDIR} ${DATADIR}
	${MKDIR} ${PREFIX}/share/mime/packages
	${INSTALL_DATA} ${WRKSRC}/googleearth-mimetypes.xml \
		${PREFIX}/share/mime/packages/
	${INSTALL_DATA} ${WRKSRC}/Google-googleearth.desktop \
		${PREFIX}/share/applications/googleearth.desktop
	${CP} -rp ${WRKSRC}/* ${STAGEDIR}${DATADIR}
	${RM} -f ${DATADIR}/googleearth-mimetypes.xml \
		${DATADIR}/googleearth.desktop
	${INSTALL_SCRIPT} ${FILESDIR}/browserwrapper \
		${DATADIR}/bin/
	${LN} -sf ${DATADIR}/bin/googleearth \
		${PREFIX}/bin/

.include <bsd.port.post.mk>
