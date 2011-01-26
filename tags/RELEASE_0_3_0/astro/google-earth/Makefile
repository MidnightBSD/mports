# $MidnightBSD: mports/astro/google-earth/Makefile,v 1.11 2009/05/26 00:25:40 laffer1 Exp $

PORTNAME=	google-earth
PORTVERSION=	5.1.3535.3218
CATEGORIES=	astro deskutils geography
MASTER_SITES=	http://dl.google.com/earth/client/current/
DISTNAME=	GoogleEarthLinux
EXTRACT_SUFX=	.bin
DIST_SUBDIR=    ${PORTNAME}/${PORTVERSION}
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Explore, Search and Discover
LICENSE=	restricted

EXTRACT_DEPENDS=	unmakeself:${PORTSDIR}/archivers/unmakeself
BUILD_DEPENDS=	update-mime-database:${PORTSDIR}/misc/shared-mime-info
RUN_DEPENDS=	${BUILD_DEPENDS} \
		${LINUXBASE}/usr/lib/libgthread-2.0.so.0:${PORTSDIR}/devel/linux-glib2
      

RESTRICTED=	Not sure about redistribution rights

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:C/\..*//g}/

USE_LINUX=	yes
USE_GNOME=	desktopfileutils

.include <bsd.port.pre.mk>

UNMAKESELF=	${LOCALBASE}/bin/unmakeself

.if defined(WITH_NVIDIA_GL)
RUN_DEPENDS+=	${LINUXBASE}/usr/lib/libGL.so.1:${PORTSDIR}/x11/nvidia-driver
.else
RUN_DEPENDS+=	${LINUXBASE}/usr/X11R6/lib/libGL.so.1:${PORTSDIR}/graphics/linux_dri
.endif

do-extract:
	@${MKDIR} ${WRKSRC}
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/${DISTFILES} ${WRKSRC}
	@cd ${WRKSRC} && ${UNMAKESELF} ${DISTFILES} && ${RM} -f ${DISTFILES}
	@cd ${WRKSRC} && ${TAR} xf googleearth-data.tar && ${RM} -f googleearth-data.tar
	@cd ${WRKSRC} && ${TAR} xf googleearth-linux-x86.tar && ${RM} -f googleearth-linux-x86.tar

do-patch:
	@${REINPLACE_CMD} -i "" -e 's|^# Set the home.*|GOOGLEEARTH_DATA_PATH=${DATADIR}|' ${WRKSRC}/bin/googleearth
	@${REINPLACE_CMD} -i "" -e "s|^# Let's boogie.*|rm -f \$${HOME}/.googleearth/instance-running-lock|" ${WRKSRC}/bin/googleearth
	@${REINPLACE_CMD} -i "" -e 's/^TMPPATH.*/exit 0/' ${WRKSRC}/postinstall.sh
	@${REINPLACE_CMD} -i "" -e 's|\"\$$SETUP_INSTALLPATH/|\"${WRKSRC}/|' ${WRKSRC}/postinstall.sh
	@${REINPLACE_CMD} -i "" -e 's|\$$SETUP_INSTALLPATH/googleearth |${PREFIX}/bin/googleearth |' ${WRKSRC}/postinstall.sh

do-build:
	@${SETENV} SETUP_INSTALLPATH=${DATADIR} ${WRKSRC}/postinstall.sh
	@cd ${WRKSRC} && ${RM} -rf setup.* preuninstall.sh postinstall.sh
	@${CHOWN} -R ${SHAREDOWN}:${SHAREDGRP} ${WRKSRC}

do-install:
	${MKDIR} ${DATADIR}
	${MKDIR} ${PREFIX}/share/mime/packages/
	${MKDIR} ${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/googleearth-mimetypes.xml ${PREFIX}/share/mime/packages/
	${INSTALL_DATA} ${WRKSRC}/Google-googleearth.desktop ${PREFIX}/share/applications/googleearth.desktop
	${CP} -rp ${WRKSRC}/* ${DATADIR}
	${RM} -f ${DATADIR}/googleearth-mimetypes.xml ${DATADIR}/googleearth.desktop
	${LN} -sf ${DATADIR}/bin/googleearth ${PREFIX}/bin/
	-@update-mime-database ${PREFIX}/share/mime
	-@update-desktop-database

.include <bsd.port.post.mk>
