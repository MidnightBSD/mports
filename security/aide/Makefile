PORTNAME=	aide
PORTVERSION=	0.19.5
CATEGORIES=	security
MASTER_SITES=	https://github.com/aide/aide/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File and directory integrity checker
WWW=		https://aide.github.io/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpcre2-8.so:devel/pcre2 \
		libe2p.so:filesystems/e2fsprogs-core

USES=		bison cpe gmake localbase pkgconfig:build
CPE_VENDOR=	advanced_intrusion_detection_environment_project
CPE_PRODUCT=	advanced_intrusion_detection_environment

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
CONFIGURE_ARGS+=--with-zlib \
		--with-posix-acl \
		--with-e2fsattrs \
		--with-config_file=${PREFIX}/etc/aide.conf
CONFIGURE_ENV=	YACC="bison -y" \
		POSIX_ACL_CFLAGS="-I/usr/include" \
		POSIX_ACL_LIBS="-L/usr/lib"

LDFLAGS+=	-lpthread

OPTIONS_RADIO=		CRYPT
OPTIONS_RADIO_CRYPT=	GCRYPT NETTLE
OPTIONS_DEFAULT=	GCRYPT

GCRYPT_DESC=	Use GNU crypto library (libgcrypt) for hashsums
NETTLE_DESC=	Use Nettle crypto library for hashsums

GCRYPT_CONFIGURE_WITH=	gcrypt
GCRYPT_LIB_DEPENDS=	libgcrypt.so:security/libgcrypt
NETTLE_CONFIGURE_WITH=	nettle
NETTLE_LIB_DEPENDS=	libnettle.so:security/nettle

SUB_FILES=	pkg-message

post-install:
	${INSTALL_DATA} ${FILESDIR}/aide.conf.freebsd ${PREFIX}/etc/aide.conf.sample
	${MKDIR} ${FAKE_DESTDIR}/var/db/aide/databases
	${CHMOD} 0700 ${FAKE_DESTDIR}/var/db/aide ${FAKE_DESTDIR}/var/db/aide/databases

.include <bsd.port.mk>
