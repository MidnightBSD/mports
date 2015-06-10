# $MidnightBSD$

PORTNAME=	libotr
PORTVERSION=	4.1.0
CATEGORIES=	security net-im net
MASTER_SITES=	https://otr.cypherpunks.ca/ \
		http://www.c-s.li/ports/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable OTR Messaging Library and toolkit

LICENSE=	lgpl2.1

LIB_DEPENDS=	libgpg-error.so:${PORTSDIR}/security/libgpg-error \
		libgcrypt.so:${PORTSDIR}/security/libgcrypt

CONFLICTS=	libotr3-*

GNU_CONFIGURE=	yes
USES=		libtool pathfix cpe
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CPE_VENDOR=	cypherpunks

.include <bsd.mport.options.mk>

.if ${ARCH} == i386
LDFLAGS+=	-lssp_nonshared
.endif

verify: checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.asc

.include <bsd.port.mk>
