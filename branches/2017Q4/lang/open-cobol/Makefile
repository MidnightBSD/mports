# $MidnightBSD$

PORTNAME=	open-cobol
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source COBOL compiler

LICENSE=	gpl2

LIB_DEPENDS=	libgmp.so:${PORTSDIR}/math/gmp

GNU_CONFIGURE=	yes
USES=		gmake libtool
USE_BDB=	yes
USE_LDCONFIG=	yes

INFO=		open-cobol

CPPFLAGS+=	-I${BDB_INCLUDE_DIR} -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

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
