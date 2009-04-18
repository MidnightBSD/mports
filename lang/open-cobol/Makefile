# $MidnightBSD: mports/lang/open-cobol/Makefile,v 1.2 2008/07/20 04:56:19 laffer1 Exp $

PORTNAME=	open-cobol
PORTVERSION=	1.0
CATEGORIES=	lang
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source COBOL compiler
LICENSE=	gpl2

LIB_DEPENDS=	gmp.7:${PORTSDIR}/math/libgmp4

USE_GNOME=	gnometarget
USE_BDB=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
USE_LDCONFIG=	yes

INFO=		open-cobol

CPPFLAGS=	-I${BDB_INCLUDE_DIR} -I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|__gmp_randinit|__gmpz_init|g ; \
		s|db-4.[0-9]|${BDB_LIB_NAME}|g' ${WRKSRC}/configure

.include <bsd.port.mk>
