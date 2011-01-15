# $MidnightBSD: mports/astro/boinc-setiathome-enhanced/Makefile,v 1.5 2010/12/18 07:41:34 laffer1 Exp $

PORTNAME=	boinc-setiathome-enhanced
PORTVERSION=	6.08
PORTREVISION=	2
CATEGORIES=	astro
MASTER_SITES=	ftp://rene-ladan.nl/pub/distfiles/
DISTNAME=	setiathome-svn-412

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Setiathome Enhanced for BOINC
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/include/fftw3.h:${PORTSDIR}/math/fftw3 \
		${LOCALBASE}/include/boinc/std_fixes.h:${PORTSDIR}/net/boinc-client \
		${LOCALBASE}/bin/bash:${PORTSDIR}/shells/bash
RUN_DEPENDS=	boinc_client:${PORTSDIR}/net/boinc-client
LIB_DEPENDS=	fftw3f:${PORTSDIR}/math/fftw3-float

USE_BZIP2=	yes
USE_AUTOTOOLS=	autoconf:262:env automake:19:env
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	pkgconfig

CFLAGS+=	-O2 -I${LOCALBASE}/include/boinc -I${LOCALBASE}/include -L${LOCALBASE}/lib
.if defined(CPUTYPE)
CFLAGS+=	-march=${CPUTYPE}
.endif

# these must match settings in ${PORTSDIR}/net/boinc-client/Makefile
BOINC_USER?=	boinc
BOINC_GROUP?=	nobody
BOINC_HOME?=	/var/db/boinc

OPTIONS=	X11		"Build screensaver" off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_X11)
.if !exists(${LOCALBASE}/lib/libboinc_graphics2.a)
BROKEN=Reinstall net/boinc-client with X11 enabled for screensavers
.endif
LIB_DEPENDS+=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		xcb.2:${PORTSDIR}/x11/libxcb
USE_GL=		gl glu glut
USE_XORG=	ice sm x11 xau xext xi xdamage xdmcp xfixes xmu xt xxf86vm
PLIST_SUB+=	X11=""
.else
CONFIGURE_ARGS+=	--disable-graphics
PLIST_SUB+=	X11="@comment "
.endif

.if ${OSVERSION} >= 3000 && (${ARCH} == i386 || ${ARCH} == amd64)
CFLAGS+=	-mtune=native
.endif

CXXFLAGS+=	${CFLAGS}

CONFIGURE_ENV+=	BOINCDIR="${LOCALBASE}"

CONFIGURE_ARGS+=	--disable-static-client --with-boinc-platform=${ARCH}-portbld-freebsd --disable-server

SETI_SITE=	setiathome.berkeley.edu
SETI_BINARY=	setiathome-${PORTVERSION:S/.0/./}.${ARCH}-portbld-freebsd

SUB_FILES=	app_info.xml pkg-message
SUB_LIST=	SETI_BINARY=${SETI_BINARY} \
		SETI_SITE=${SETI_SITE} \
		SETI_VERSION=${PORTVERSION:S/.//}
PLIST_SUB+=	SETI_BINARY=${SETI_BINARY} \
		SETI_SITE=${SETI_SITE} \
		BOINC_HOME=${BOINC_HOME}

pre-configure:
	(cd ${WRKSRC}; ./_autosetup ; ${REINPLACE_CMD} -E -e "s|/bin/sh|${LOCALBASE}/bin/bash|" ./configure)

do-install:
	${INSTALL} -d -o ${BOINC_USER} -g ${BOINC_GROUP} ${FAKE_DESTDIR}${BOINC_HOME}/projects
	${INSTALL} -d -o ${BOINC_USER} -g ${BOINC_GROUP} ${FAKE_DESTDIR}${BOINC_HOME}/projects/${SETI_SITE}
	${INSTALL_PROGRAM} -o ${BOINC_USER} -g ${BOINC_GROUP} ${WRKSRC}/client/${SETI_BINARY} ${FAKE_DESTDIR}${BOINC_HOME}/projects/${SETI_SITE}/
.if !defined(WITHOUT_X11)
	${INSTALL_PROGRAM} -o ${BOINC_USER} -g ${BOINC_GROUP} ${WRKSRC}/client/seti_graphics ${FAKE_DESTDIR}${BOINC_HOME}/projects/${SETI_SITE}/
.endif
	${INSTALL_DATA} -o ${BOINC_USER} -g ${BOINC_GROUP} ${WRKDIR}/app_info.xml ${FAKE_DESTDIR}${BOINC_HOME}/projects/${SETI_SITE}/

.include <bsd.port.post.mk>
