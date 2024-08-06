PORTNAME=	dirmngr
PORTVERSION=	1.1.1
CATEGORIES=	security
MASTER_SITES=	GNUPG
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client for managing and downloading certificate revocation lists
WWW=		https://www.gnupg.org/aegypten2

LICENSE=	gpl2

BROKEN=		does not build with security/libassuan >= 3.0.0 (GNU Pth support was dropped)

LIB_DEPENDS=	libassuan.so:security/libassuan \
		libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error \
		libksba.so:security/libksba \
		libpth.so:devel/pth

USES=		gmake iconv ldap tar:bzip2
USE_OPENLDAP=	yes
GNU_CONFIGURE=	yes
INFO=		dirmngr

CONFIGURE_ARGS+=	--docdir=${DOCSDIR}
LDFLAGS+=	-L${LOCALBASE}/lib
CFLAGS+=	-fcommon

CONFLICTS_INSTALL=	gnupg # bin/dirmngr bin/dirmngr-client

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext

verify: checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.sig

.include <bsd.port.mk>
