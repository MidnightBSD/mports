# $MidnightBSD: mports/comms/lirc/Makefile,v 1.10 2011/02/02 20:09:16 laffer1 Exp $

PORTNAME=	lirc
PORTVERSION=	0.9.0
PORTREVISION=	4
PORTEPOCH=	1
CATEGORIES=	comms
MASTER_SITES=	SF/${PORTNAME}/LIRC/${PORTVERSION}
DISTNAME=	${PORTNAME}-${PORTVERSION:S/p1/-pre1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux Infared Remote Control
LICENSE=	gpl2

BUILD_DEPENDS=	v4l_compat>=1.0.20110603:${PORTSDIR}/multimedia/v4l_compat

USE_AUTOTOOLS=	libtool automake autoheader aclocal autoconf
ACLOCAL_ARGS=	-I "${ACLOCAL_DIR}" -I ${LOCALBASE}/share/aclocal
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XORG=	sm x11
USE_PYTHON=	yes
USE_CSTD=	gnu89
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

CONFIGURE_ARGS=		--enable-sandboxed --with-devdir=/var/run/lirc \
			--sysconfdir=${PREFIX}/etc
CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib

OPTIONS_DEFINE=	MINIMAL DEBUG UARTLIRC

MINIMAL_DESC=	Build with minmal dependencies
UARTLIRC_DESC=	Install serial LIRC driver

USE_RC_SUBR=	lircd
#PORTDOCS=	irxevent.keys lirc.css lirc.hwdb
PORTEXAMPLES=	remotes
SUB_FILES=	pkg-message lircd.conf

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/lib/libvga.so.1)
LIB_DEPENDS+=	vga:${PORTSDIR}/graphics/svgalib
PLIST_SUB+=	SMODE2=
.else
PLIST_SUB+=	SMODE2="@comment "
.endif

.if defined(WITH_MINIMAL)
BUILD_DEPENDS+=		${LOCALBASE}/lib/libirman.a:${PORTSDIR}/comms/libirman
LIB_DEPENDS+=		ftdi:${PORTSDIR}/devel/libftdi
CONFIGURE_ARGS+=	--with-driver=userspace
.else
CONFIGURE_ARGS+=	--with-driver=dvico
.endif

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_UARTLIRC)
RUN_DEPENDS+=		uartlirc>=0.3:${PORTSDIR}/comms/uartlirc
.endif

MAN1=		ircat.1 irexec.1 irpty.1 irrecord.1 irsend.1 irw.1 \
		irxevent.1 lircrcd.1 mode2.1 smode2.1 xmode2.1
MAN8=		lircd.8 lircmd.8

post-install:
.if defined(WITH_DOCS)
	@(cd ${WRKSRC}/doc && ${COPYTREE_SHARE} html ${DOCSDIR}/)
	@(cd ${WRKSRC}/doc && ${COPYTREE_SHARE} images ${DOCSDIR}/)
	@(cd ${WRKSRC}/doc && ${INSTALL_DATA} irxevent.keys lirc.css lirc.hwdb ${DOCSDIR}/)
.endif
.if defined(WITH_EXAMPLES)
	@(cd ${WRKSRC} && ${COPYTREE_SHARE} remotes ${EXAMPLESDIR}/)
.endif
	@${INSTALL_DATA} ${WRKDIR}/lircd.conf ${PREFIX}/etc/lircd.conf.sample
	@if [ ! -f ${PREFIX}/etc/lircd.conf ]; then \
	    ${INSTALL_DATA} ${WRKDIR}/lircd.conf ${PREFIX}/etc; \
	fi
	@${MKDIR} /var/run/lirc
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
