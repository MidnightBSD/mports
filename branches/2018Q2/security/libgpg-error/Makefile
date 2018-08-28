# $MidnightBSD$

PORTNAME=	libgpg-error
PORTVERSION=	1.27
CATEGORIES=	security devel
MASTER_SITES=	GNUPG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common error values for all GnuPG components

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LIB

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

USES=		gmake libtool tar:bzip2
USE_LDCONFIG=		yes
GNU_CONFIGURE=		yes
MAKE_JOBS_UNSAFE=	yes
CPP+=			-P
CONFIGURE_ARGS=		--enable-static=yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext iconv
CONFIGURE_ARGS=	${ICONV_CONFIGURE_ARG} \
		--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.else
CONFIGURE_ARGS=	--disable-nls
PLIST_SUB=	NLS="@comment "
.endif

DOCS=		AUTHORS ChangeLog NEWS README
INFO=		gpgrt

post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}

.include <bsd.port.mk>
