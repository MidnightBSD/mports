PORTNAME=	aircrack-ng
DISTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES=	net-mgmt security
MASTER_SITES=	http://download.aircrack-ng.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	802.11 WEP and WPA-PSK keys cracking program
WWW=		https://www.aircrack-ng.org/

LICENSE=	gpl2 bsd3 apache2
LICENSE_COMB=	dual

BROKEN_aarch64=		fails to configure: _AX_COMPILER_VERSION_GNU unknown gcc major
BROKEN_armv6=		fails to configure: _AX_COMPILER_VERSION_GNU unknown gcc major
BROKEN_armv7=		fails to configure: _AX_COMPILER_VERSION_GNU unknown gcc major
BROKEN_i386=		fails to configure: _AX_COMPILER_VERSION_GNU unknown gcc major

USES=		autoreconf cpe dos2unix gmake libtool ssl pkgconfig
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-experimental
CPE_VERSION=	${DISTVERSION:C/-.*//}
CPE_UPDATE=	${DISTVERSION:C/^[^-]*$//:C/.*-//}
DOS2UNIX_FILES=	src/aircrack-osdep/byteorder.h
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
# Don't call 'strip' target with WITH_DEBUG set
#INSTALL_TARGET=	${STRIP:S/-s/strip/} install

OPTIONS_DEFINE=	PCRE SQLITE
OPTIONS_DEFAULT=PCRE SQLITE
OPTIONS_SUB=	yes

PCRE_DESC=	Use Perl Compatible Regular Expressions for wesside
PCRE_MAKE_ARGS=	pcre=true
PCRE_LIB_DEPENDS=	libpcre.so:devel/pcre
PCRE_CONFIGURE_OFF=	--disable-pcre

SQLITE_DESC=	Use SQLite for storing pre-computed key tables
SQLITE_USES=	sqlite
SQLITE_MAKE_ARGS=	sqlite=true
SQLITE_CONFIGURE_OFF=	--without-sqlite3

post-patch:
	@${REINPLACE_CMD} \
		-e 's|%%ETCDIR%%|${ETCDIR}|' ${WRKSRC}/scripts/airodump-ng-oui-update

post-install:
	${MKDIR} ${STAGEDIR}${ETCDIR}

.include <bsd.port.mk>
