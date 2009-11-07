# $MidnightBSD: mports/security/nmap/Makefile,v 1.3 2009/09/20 02:11:06 laffer1 Exp $

PORTNAME?=	nmap
PORTVERSION=	${DISTVERSION:L:C/([a-z])[a-z]+/\1/g:C/[^a-z0-9+]+/./g}
PORTREVISION=	1
CATEGORIES=	security ipv6
MASTER_SITES=	http://nmap.org/dist/ \
                http://nmap.ucsd.edu/dist/ \
		http://www.mirrors.wiretapped.net/security/network-mapping/nmap/ \
		http://www.mirrorservice.org/sites/ftp.wiretapped.net/pub/security/network-mapping/nmap/ \
		http://mirror.sg.depaul.edu/pub/security/nmap/
DISTNAME=	nmap-${DISTVERSION}	# needed for security/nmapfe

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Port scanning utility for large networks
LICENSE=	gpl2

DISTVERSION=	4.20

USE_BZIP2=	yes
USE_GMAKE=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-localdirs

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

.ifndef BUILD_NMAPFE

MAN1=		nmap.1

LIB_DEPENDS=	pcre.0:${PORTSDIR}/devel/pcre

CONFIGURE_ARGS+=	--with-libpcre=${LOCALBASE}

.ifndef WITHOUT_SSL
USE_OPENSSL=	yes
CONFIGURE_ARGS+=	--with-openssl=${OPENSSLBASE}
.else
CONFIGURE_ARGS+=	--without-openssl
.endif

CONFIGURE_ARGS+=	--without-nmapfe

ALL_TARGET=	nmap
INSTALL_TARGET=	install-nmap

post-configure:
	@${REINPLACE_CMD} -e "s|^DESTDIR *=|& ${DESTDIR}|" ${WRKSRC}/Makefile

post-install:
.ifndef NOPORTDOCS
	@${MKDIR} ${DESTDIR}${DOCSDIR}
	@for doc in CHANGELOG HACKING docs/nmap.dtd; do \
		${INSTALL_DATA} ${WRKSRC}/$${doc} ${DESTDIR}${DOCSDIR}; \
	done
.endif

.else

RUN_DEPENDS=	nmap:${PORTSDIR}/security/nmap

DESCR=		${PKGDIR}/pkg-descr.fe
PLIST=		${PKGDIR}/pkg-plist.fe
PLIST_SUB=	REALPREFIX=${PREFIX}

MAN1=		nmapfe.1
MLINKS=		nmapfe.1 xnmap.1

USE_GNOME=	gtk20

CONFIGURE_ARGS+=--without-openssl

CONFIGURE_ARGS+=--with-nmapfe

ALL_TARGET=	nbase/libnbase.a nmapfe/nmapfe
INSTALL_TARGET=	install-nmapfe

.endif

.include <bsd.port.mk>
