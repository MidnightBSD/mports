# $MidnightBSD$

PORTNAME=	cvsup
PORTVERSION?=	16.1h
PORTREVISION?=	4
CATEGORIES=	net devel
MASTER_SITES=	${MASTER_SITE_FREEBSD_ORG}
MASTER_SITE_SUBDIR=development/CVSup/snapshots
DISTNAME=	cvsup-snap-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	General network file distribution system optimized for CVS (GUI version)

CONFLICTS?=	cvsup-without-gui-[0-9]*
USE_RC_SUBR=	cvsupd

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
TARGET=		FBSD_AMD64
AMD64_PATCHES=	p-amd64-aa p-amd64-zlib
.elif ${ARCH} == "i386"
TARGET=		FreeBSD4
.elif ${ARCH} == "sparc64"
TARGET=		FBSD_SPARC64
.endif

.if defined(WITHOUT_X11) || ${ARCH} == "amd64"
M3FLAGS+=	-DNOGUI
BUILD_DEPENDS=	${PREFIX}/lib/m3/pkg/tcp/${TARGET}/libm3tcp.a:${PORTSDIR}/lang/ezm3
PKGNAMESUFFIX=	-without-gui
COMMENT=	General network file distribution system optimized for CVS (non-GUI version)
DESCR=		${PKGDIR}/pkg-descr.nogui
.if !defined(WITHOUT_X11) && ${ARCH} == "amd64"
NO_LATEST_LINK=	yes
.endif
.else
USE_XORG+=	x11 oldx dmx pixman xaw
BUILD_DEPENDS=	${PREFIX}/lib/m3/pkg/formsvbt/${TARGET}/libm3formsvbt.a:${PORTSDIR}/lang/ezm3
.endif

MAKE_ARGS+=	PREFIX=${PREFIX} M3FLAGS="${M3FLAGS}"
FAKE_MAKEARGS+= PREFIX=${FAKE_DESTDIR}${PREFIX}
MAN1=		cvpasswd.1 cvsup.1
MAN8=		cvsupd.8

pre-everything::
.ifdef STATIC
	@${ECHO_MSG} " In future, please define WITH_STATIC instead of "
	@${ECHO_MSG} " STATIC.                                         "
.endif

.ifdef STATIC || WITH_STATIC
M3FLAGS+=	-DSTATIC
.endif

pre-fetch:
.ifndef WITHOUT_X11
.if ${ARCH} == "amd64"
	@${ECHO_MSG} "CVSup with X11 is not yet supported on amd64.    "
	@${ECHO_MSG} "I will build cvsup without X11 support now.      "
.else
	@${ECHO_MSG} "To build CVSup without X11 (and without the GUI) "
	@${ECHO_MSG} "use the \"net/cvsup-without-gui\" port.          "
.endif
.endif

pre-patch:
.if ${ARCH} == "amd64"
.for f in ${AMD64_PATCHES}
	@cd ${WRKSRC} && ${PATCH} ${PATCH_ARGS} < ${PATCHDIR}/${f}
.endfor
.endif

post-install:
	@${MKDIR} ${PREFIX}/share/cvsup
	@${INSTALL_DATA} ${WRKSRC}/License ${PREFIX}/share/cvsup/License

.include <bsd.port.post.mk>
