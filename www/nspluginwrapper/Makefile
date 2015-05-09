# $MidnightBSD$

PORTNAME=	nspluginwrapper
PORTVERSION=	1.4.4
PORTREVISION=	4
CATEGORIES=	www linux emulators
MASTER_SITES=	http://nspluginwrapper.org/download/ \
		FREEBSD_LOCAL/jkim \
		FREEBSD_LOCAL/jkim:binfile
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${BINFILE}:binfile

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compatibility plugin for Mozilla NPAPI plugins

LICENSE=	gpl2

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl

CONFLICTS=	nspluginwrapper-1.3.*

BINBUILD=	1
BINFILE=	${PORTNAME}-i386-${PORTVERSION}-${BINBUILD}${EXTRACT_SUFX}

HAS_CONFIGURE=	yes
USE_GNOME=	glib20 gtk20
USE_LDCONFIG=	yes
USE_LINUX=	f10
USE_LINUX_APPS=	gtk2
USE_XORG=	x11 xext xt
USES=		gmake pkgconfig

CFLAGS+=	-std=c99

CONFIGURE_ARGS=	--enable-generic --enable-strip --prefix=${PREFIX} \
		--target-os=linux --target-cpu=i386 \
		--with-cc=${CC} --with-cxx=${CXX}

LIBDIR=		${PREFIX}/lib/${PORTNAME}
LINUX_BINDIR=	usr/lib/nspluginwrapper/i386/linux

PLIST_SUB=	LIBDIR="${LIBDIR:C/^${PREFIX}\///}" HOST_ARCH="${HOST_ARCH}"

SUB_FILES=	npviewer
SUB_LIST+=	NSPLUGINWRAPPER="${LIBDIR}"

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
HOST_ARCH=	x86_64
PLIST_SUB+=	HOST_AMD64=""
.else
HOST_ARCH=	${ARCH}
PLIST_SUB+=	HOST_AMD64="@comment "
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
	${REINPLACE_CMD} -e 's|freebsd|midnightbsd|g' \
		${LIBDIR}/noarch/npviewer.sh

.include <bsd.port.post.mk>
