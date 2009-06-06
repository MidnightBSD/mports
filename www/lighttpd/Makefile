# $MidnightBSD: mports/www/lighttpd/Makefile,v 1.11 2008/10/30 16:34:33 ctriv Exp $

PORTNAME=	lighttpd
PORTVERSION=	1.4.22
CATEGORIES=	www
MASTER_SITES=	http://www.lighttpd.net/download/ \
		http://mirrors.cat.pdx.edu/lighttpd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A secure, fast, compliant, and very flexible Web Server
LICENSE=	bsd3

LIB_DEPENDS=	pcre.0:${PORTSDIR}/devel/pcre

USE_AUTOTOOLS=	autoconf:262 libtool:15
GNU_CONFIGURE=	yes
USE_GNOME=	lthack
USE_RC_SUBR=	lighttpd.sh
CONFIGURE_ARGS=	--libdir=${PREFIX}/lib/lighttpd
CONFIGURE_ENV+=	CFLAGS="${CFLAGS}"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		lighttpd.1 spawn-fcgi.1

OPTIONS=	BZIP2		"Enable Bzip2 support"	on \
		CML		"Enable Cache Meta Language support" off \
		FAM		"Enable FAM support"    off \
		GDBM		"Enable GDBM support"   off \
		IPV6		"Enable IPV6 support"   on  \
		MYSQL		"Enable MYSQL support"  off \
		OPENSSL		"Enable SSL support"	on  \
		OPENLDAP	"Enable LDAP support"	off

.include <bsd.mport.options.mk>

# Default REQUIRE to rc.d script
_REQUIRE=	DAEMON

.if !defined(WITHOUT_OPENSSL)
EXTENSIONS+=		openssl
USE_OPENSSL_BASE=	yes
CONFIGURE_ARGS+=	--with-openssl \
			--with-openssl-includes=${OPENSSLINC} \
			--with-openssl-libs=${OPENSSLLIB}
.endif

.if defined(WITH_BZIP2)
CONFIGURE_ARGS+=	--with-bzip2
.else
CONFIGURE_ARGS+=	--disable-bzip2
.endif

.if defined(WITH_FAM)
LIB_DEPENDS+=		fam:${PORTSDIR}/devel/fam
CONFIGURE_ARGS+=	--with-fam
CONFIGURE_ENV+=		FAM_CFLAGS="-I${LOCALBASE}/include" FAM_LIBS="-L${LOCALBASE}/lib"
.endif

.if defined(WITH_GDBM)
LIB_DEPENDS+=		gdbm:${PORTSDIR}/databases/gdbm
CONFIGURE_ARGS+=	--with-gdbm
.endif

.if defined(WITH_OPENLDAP)
USE_OPENLDAP=		yes
CONFIGURE_ARGS+=	--with-ldap
_REQUIRE+=		slapd
.else
CONFIGURE_ARGS+=	--disable-ldap
.endif

.if defined(WITH_MYSQL)
USE_MYSQL=		yes
CONFIGURE_ARGS+=	--with-mysql
_REQUIRE+=		mysql
.else
CONFIGURE_ARGS+=	--disable-mysql
.endif

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if defined(WITH_CML)
USE_LUA=	5.0
CONFIGURE_ARGS+=	--with-lua
CONFIGURE_ENV+=		CPPFLAGS="-I${LUA_INCDIR}" LDFLAGS="-L${LUA_LIBDIR}"
.endif

SUB_LIST+=		REQUIRE="${_REQUIRE}"

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -E -e 's|-D_XOPEN_SOURCE=600||' ${WRKSRC}/configure.in

post-install:
	@${INSTALL_DATA} ${FILESDIR}/lighttpd.conf.sample ${PREFIX}/etc
.if !exists(${PREFIX}/etc/lighttpd.conf)
	@${INSTALL_DATA} ${FILESDIR}/lighttpd.conf.sample ${PREFIX}/etc/lighttpd.conf
.endif
	@${LIBTOOL} --finish ${PREFIX}/lib

.include <bsd.port.post.mk>
