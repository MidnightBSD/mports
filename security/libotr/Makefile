# $MidnightBSD: mports/security/libotr/Makefile,v 1.8 2012/02/29 01:17:14 laffer1 Exp $

PORTNAME=	libotr
PORTVERSION=	4.0.0
CATEGORIES=	security
MASTER_SITES=	http://www.cypherpunks.ca/otr/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable OTR Messaging Library and toolkit
LICENSE=	gpl2

LIB_DEPENDS=	gpg-error.0:${PORTSDIR}/security/libgpg-error \
		gcrypt:${PORTSDIR}/security/libgcrypt

USE_GNOME=	pkgconfig
USE_AUTOTOOLS=	autoconf libtool
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

MAN1=		otr_toolkit.1
MLINKS=		otr_toolkit.1 otr_parse.1 \
		otr_toolkit.1 otr_sesskeys.1 \
		otr_toolkit.1 otr_mackey.1 \
		otr_toolkit.1 otr_readforge.1 \
		otr_toolkit.1 otr_modify.1 \
		otr_toolkit.1 otr_remac.1

verify: checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.asc

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's#^pkgconfigdir .*#pkgconfigdir = ${PREFIX}/libdata/pkgconfig#' \
	    ${WRKSRC}/Makefile.in ${WRKSRC}/Makefile.am

.if ${OSVERSION} >= 4016
	@${REINPLACE_CMD} -e 's#OTR_CHECK_CFLAGS(.*stack-protector.*#dnl &#' \
	    ${WRKSRC}/configure.ac
.endif

.include <bsd.port.post.mk>
