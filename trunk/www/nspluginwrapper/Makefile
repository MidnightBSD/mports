# New ports collection makefile for: nspluginwrapper
# Date created:         30 Oct 2007
# Whom:                 Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/www/nspluginwrapper/Makefile,v 1.7 2008/10/06 03:19:22 laffer1 Exp $
# $FreeBSD: ports/www/nspluginwrapper/Makefile,v 1.5 2007/09/01 23:15:12 pav Exp $
#

PORTNAME=	nspluginwrapper
PORTVERSION=	1.4.4
CATEGORIES=	www linux emulators
MASTER_SITES=	http://nspluginwrapper.org/download/ \
		FREEBSD_LOCAL/jkim \
		FREEBSD_LOCAL/jkim:binfile
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${BINFILE}:binfile

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A compatibility plugin for Netscape 4 (NPAPI) plugins
LICENSE=	gpl2

LIB_DEPENDS=	curl.6:${PORTSDIR}/ftp/curl

CONFLICTS=	nspluginwrapper-1.3.*

BINBUILD=	1
BINFILE=	${PORTNAME}-i386-${PORTVERSION}-${BINBUILD}${EXTRACT_SUFX}

ONLY_FOR_ARCHS=	i386 amd64

USE_LINUX=	yes
USE_LINUX_APPS=	gtk2
USE_XORG=	x11 xext xt
USE_GNOME=	glib20 gtk20 pkgconfig

CFLAGS+=	-std=c99

USE_LDCONFIG=	yes
USE_GMAKE=	yes
HAS_CONFIGURE=	yes

CONFIGURE_ARGS=	--enable-generic --enable-strip --prefix=${PREFIX} \
		--target-os=linux --target-cpu=i386 \
		--with-cc=${CC} --with-cxx=${CXX}

LIBDIR=		${PREFIX}/lib/${PORTNAME}

PLIST_SUB=	LIBDIR="${LIBDIR:C/^${PREFIX}\///}" HOST_ARCH="${HOST_ARCH}"

SUB_FILES=	npviewer
SUB_LIST+=	NSPLUGINWRAPPER="${LIBDIR}"

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
HOST_ARCH=	x86_64
.else
HOST_ARCH=	${ARCH}
.endif

post-patch:
	${REINPLACE_CMD} -e 's,%%LOCALBASE%%,${LOCALBASE},g' \
	    ${WRKSRC}/src/npw-config.c

post-install:
	${MKDIR} ${LIBDIR}/i386/linux
	${INSTALL_PROGRAM} ${WRKDIR}/usr/lib/nspluginwrapper/i386/linux/*.bin \
	    ${WRKDIR}/usr/lib/nspluginwrapper/i386/linux/*.so \
	    ${LIBDIR}/i386/linux/
	${INSTALL_SCRIPT} ${WRKDIR}/npviewer ${LIBDIR}/i386/linux/
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
