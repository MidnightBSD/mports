# $MidnightBSD: mports/security/dirmngr/Makefile,v 1.12 2013/07/16 02:47:18 laffer1 Exp $
#

PORTNAME=	dirmngr
PORTVERSION=	1.1.0
PORTREVISION=	4
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	dirmngr
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client for managing and downloading certificate revocation lists

LICENSE=	gpl2

LIB_DEPENDS=	assuan.0:${PORTSDIR}/security/libassuan \
		gcrypt:${PORTSDIR}/security/libgcrypt \
		gpg-error.0:${PORTSDIR}/security/libgpg-error \
		ksba.19:${PORTSDIR}/security/libksba \
		pth:${PORTSDIR}/devel/pth

USE_BZIP2=	yes
USES=		iconv
USE_OPENLDAP=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
INFO=		dirmngr
MAN1=		dirmngr-client.1 dirmngr.1

CONFIGURE_ARGS+=	--docdir=${DOCSDIR}
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	NLS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=	gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

verify: checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.sig

.include <bsd.port.mk>
