# $MidnightBSD: mports/security/libgpg-error/Makefile,v 1.12 2012/02/11 00:07:31 laffer1 Exp $

PORTNAME=	libgpg-error
PORTVERSION=	1.12
CATEGORIES=	security devel
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common error values for all GnuPG components

LICENSE=	gpl2

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	ltverhack
USE_LDCONFIG=		yes
GNU_CONFIGURE=		yes
MAKE_JOBS_UNSAFE=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext iconv
CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.else
CONFIGURE_ARGS=	--disable-nls
PLIST_SUB=	NLS="@comment "
.endif

DOCS=		AUTHORS ChangeLog NEWS README

.if ${PORT_OPTIONS:MDOCS}
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
