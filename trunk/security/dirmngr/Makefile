# $MidnightBSD$
#

PORTNAME=	dirmngr
PORTVERSION=	1.1.0
PORTREVISION=	6
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	dirmngr
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client for managing and downloading certificate revocation lists

LICENSE=	gpl2

LIB_DEPENDS=	assuan:${PORTSDIR}/security/libassuan \
		gcrypt:${PORTSDIR}/security/libgcrypt \
		gpg-error:${PORTSDIR}/security/libgpg-error \
		ksba:${PORTSDIR}/security/libksba \
		pth:${PORTSDIR}/devel/pth

USES=		gmake iconv tar:bzip2
USE_OPENLDAP=	yes
GNU_CONFIGURE=	yes
INFO=		dirmngr

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
