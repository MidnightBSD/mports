# $MidnightBSD: mports/security/libgpg-error/Makefile,v 1.11 2011/02/02 21:20:53 laffer1 Exp $

PORTNAME=	libgpg-error
PORTVERSION=	1.10
CATEGORIES=	security devel
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common error values for all GnuPG components
LICENSE=	gpl2

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	ltverhack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd7.0
MAKE_JOBS_UNSAFE=yes

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS=	--disable-nls
PLIST_SUB=	NLS="@comment "
.else
USE_ICONV=	yes
USE_GETTEXT=	yes
CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.endif

DOCS=		AUTHORS ChangeLog NEWS README

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
