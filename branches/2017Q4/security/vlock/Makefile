# $MidnightBSD$
# $FreeBSD: ports/security/vlock/Makefile,v 1.9 2008/06/19 19:35:54 pav Exp $

PORTNAME=	vlock
PORTVERSION=	2.2.3
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://cthulhu.c3d2.de/~toidinamai/vlock/archive/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Locks a terminal

LICENSE=	gpl2

USE_GMAKE=	yes
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-plugins --enable-pam \
		--prefix=${PREFIX} \
		--mandir=${MANPREFIX}/man \
		--with-modules="${VLOCKMODULES}" \
		--with-scripts="${VLOCKSCRIPTS}" \
		VLOCK_GROUP="nobody" \
		EXTRA_CFLAGS="-I${LOCALBASE}/include" \
		EXTRA_LDFLAGS="-L${LOCALBASE}/lib"
USES=	gmake
USE_CSTD=	gnu99

OPTIONS_DEFINE=	ROOTPWD VLOCKSCRIPTS CACASAVER
OPTIONS_DEFAULT=	ROOTPWD
OPTIONS_SUB=	yes
ROOTPWD_DESC=	Enable unlock using root password
ROOTPWD_CONFIGURE_ENABLE=	root-password
VLOCKSCRIPTS_DESC=	Install sample hook scripts
CACASAVER_DESC=	Enable libcaca screensaver
CACASAVER_BUILD_DEPENDS=	${LOCALBASE}/lib/libcaca.a:${PORTSDIR}/graphics/libcaca

# Default scripts/modules
VLOCKSCRIPTS=
VLOCKMODULES=	all.so new.so

# Vlock special group
VLOCK_GRP=	vlock
GROUPS=	${VLOCK_GRP}
PLIST_SUB+=	VLOCK_GRP=${VLOCK_GRP}

PORTDOCS=	ChangeLog PLUGINS README README.X11 SECURITY TODO

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MVLOCKSCRIPTS}
VLOCKSCRIPTS+=	amarok.sh example_script.sh mplayer.sh
.endif

.if ${PORT_OPTIONS:MCACASAVER}
VLOCKMODULES+=	caca.so
.endif

pre-patch:
	${REINPLACE_CMD} -e 's/FreeBSD/MidnightBSD/g' ${WRKSRC}/configure

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
