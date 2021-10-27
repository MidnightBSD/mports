# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	libucl
PORTVERSION=	0.8.1
CATEGORIES=	textproc devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal configuration library parser

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf gmake libtool pathfix pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	vstakhov
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes

CONFLICTS_INSTALL=	ucl

INSTALL_TARGET=	install-strip
# magus test issues
#TEST_TARGET=	check
NO_TEST=	yes

OPTIONS_DEFINE=		LUA REGEX SIGNATURES URLS UTILS
OPTIONS_DEFAULT=	REGEX UTILS
OPTIONS_SUB=		yes

REGEX_DESC=		Enable regex checking for schema
SIGNATURES_DESC=	Enable signatures checking
URLS_DESC=		Enable fetching URLs
UTILS_DESC=		Enable tools: ucl_chargen, ucl_ucldump, ucl_tool

LUA_CONFIGURE_ENABLE=	lua
LUA_CONFIGURE_ENV=	LUA=${LOCALBASE}/bin/${LUA_CMD}
LUA_LDFLAGS=		-L${LUA_LIBDIR}
LUA_USES=		lua

REGEX_CONFIGURE_ENABLE=	regex

SIGNATURES_CONFIGURE_ENABLE=	signatures
SIGNATURES_CPPFLAGS=		-I${OPENSSLINC}
SIGNATURES_LDFLAGS=		-L${OPENSSLLIB}
SIGNATURES_USES=		ssl

URLS_CONFIGURE_ENABLE=	urls

UTILS_CONFIGURE_ENABLE=	utils

.include <bsd.mport.options.mk>

# https://github.com/vstakhov/libucl/issues/203
.if ${PORT_OPTIONS:MSIGNATURES} && (${SSL_DEFAULT} == base || ${SSL_DEFAULT} == openssl)
BROKEN=	Signatures checking support does not build with OpenSSL 1.1.1
.endif

.include <bsd.port.mk>
