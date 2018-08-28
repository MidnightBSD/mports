# $MidnightBSD$

PORTNAME=	findutils
PORTVERSION=	4.6.0
PORTREVISION=	0
CATEGORIES=	misc
MASTER_SITES=	GNU
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU find utilities

LICENSE=	gpl3

USES+=		charsetfix cpe gmake
SIG_FILES=	${DISTNAME}${EXTRACT_SUFX}.sig
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CPE_VENDOR=	gnu

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

CONFIGURE_ARGS+=	--program-prefix=g --localstatedir=${LOCALSTATEDIR} \
			--mandir=${PREFIX}/man --infodir=${PREFIX}/info
MAKE_ARGS=	INSTALL_SCRIPT="${INSTALL_SCRIPT}"

LOCALSTATEDIR?=	/var/db

.include <bsd.port.mk>
