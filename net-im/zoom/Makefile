# $FreeBSD: head/net-im/zoom/Makefile 548898 2020-09-18 18:09:28Z yuri $
# based on yuri@freebsd.org's port

PORTNAME=	zoom
DISTVERSION=	5.3.465578.0920
CATEGORIES=	net-im net-p2p
MASTER_SITES=	https://zoom.us/client/${DISTVERSION}/
PKGNAMESUFFIX=	-video-conferencing-client
DISTNAME=	zoom_x86_64.pkg

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Zoom videoconferencing client (CAVEAT: Sound doesn't yet work)

LICENSE=	other

RUN_DEPENDS=	linux-c7-xcb-util-image>0:x11/linux-c7-xcb-util-image \
		linux-c7-xcb-util-keysyms>0:x11/linux-c7-xcb-util-keysyms \
		linux-c7-xcb-util>0:x11/linux-c7-xcb-util

USES=		desktop-file-utils linux tar:xz
USE_LINUX=	alsalib alsa-plugins-oss atk cairo-gobject dbuslibs fontconfig freetype gdkpixbuf2 gtk3 libdrm libglvnd pango xorglibs # pulseaudio-libs (asserts under the linux emulator)

NO_BUILD=	yes

PLIST_SUB=	LINUXBASE=${LINUXBASE}

do-install:
	${MKDIR} ${LINUXBASE}
	cd ${WRKDIR} && ${CP} -r opt ${LINUXBASE}
	(echo "#!/bin/sh"; \
	  echo ""; \
	  echo "LD_LIBRARY_PATH=${LINUXBASE_REL}/opt/zoom ${LINUXBASE_REL}/opt/zoom/zoom \"$$"@"\"" \
	) > ${PREFIX}/bin/${PORTNAME}
	${REINPLACE_CMD} -i '' -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/bin/${PORTNAME}
	${CHMOD} +x ${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${INSTALL_DATA} ${WRKDIR}/usr/share/applications/Zoom.desktop ${STAGEDIR}${PREFIX}/share/applications
	${REINPLACE_CMD} -i '' -e 's|/usr/bin/zoom|${LOCALBASE}/bin/zoom|' ${STAGEDIR}${PREFIX}/share/applications/Zoom.desktop
	${INSTALL_DATA} ${WRKDIR}/usr/share/pixmaps/Zoom.png ${STAGEDIR}${PREFIX}/share/pixmaps/Zoom.png

.include <bsd.port.mk>
