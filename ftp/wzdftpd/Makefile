PORTNAME=	wzdftpd
PORTVERSION=	0.8.3
PORTREVISION=	2
CATEGORIES=	ftp
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-sources/${PORTNAME}-${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modular FTP server configurable online using SITE commands
WWW=		https://sourceforge.net/projects/wzdftpd/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf:2.69 cpe gettext-tools libtool localbase pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--sysconfdir=${ETCDIR} --without-pam --disable-bonjour --disable-static
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

USE_RC_SUBR=	wzdftpd

OPTIONS_DEFINE=	AVAHI ICONV IPV6 MYSQL PAM PERL PGSQL SQLITE TCL DOCS
OPTIONS_RADIO=	TLS
OPTIONS_RADIO_TLS=	GNUTLS OPENSSL
OPTIONS_DEFAULT=	AVAHI GNUTLS
OPTIONS_SUB=	yes

ICONV_CONFIGURE_ON=	${ICONV_CONFIGURE_ARG}
ICONV_CONFIGURE_OFF=	--disable-utf8
ICONV_USES=		iconv

TCL_CONFIGURE_ON=	--with-tcl=${TCL_LIBDIR}
TCL_CONFIGURE_OFF=	--without-tcl
TCL_USES=		tcl

OPENSSL_CONFIGURE_ENABLE=	openssl
OPENSSL_USES=		ssl

GNUTLS_CONFIGURE_ENABLE=	gnutls
GNUTLS_LIB_DEPENDS=		libgnutls.so:security/gnutls

IPV6_CONFIGURE_ENABLE=	ipv6

PERL_CONFIGURE_ENABLE=	perl
PERL_USES=		perl5

PAM_CONFIGURE_WITH=	pam

MYSQL_CONFIGURE_ENABLE=	mysql
MYSQL_USES=		mysql

PGSQL_CONFIGURE_ON=	--with-pgsql=${LOCALBASE}
PGSQL_CONFIGURE_OFF=	--disable-pgsql
PGSQL_USES=		pgsql

SQLITE_CONFIGURE_ENABLE=	sqlite3
SQLITE_USES=			sqlite:3

AVAHI_CONFIGURE_ON=	--with-zeroconf --enable-avahi
AVAHI_LIB_DEPENDS=	libdbus-1.so:devel/dbus \
			libavahi-core.so:net/avahi-app

.include <bsd.mport.options.mk>

post-patch:
	@${TOUCH} ${WRKSRC}/config.rpath
	@${ECHO_CMD} "ACLOCAL_AMFLAGS= -I ac-helpers" >> ${WRKSRC}/Makefile.am
	@${REINPLACE_CMD} -e \
		'/LDFLAGS/s|@PTHREAD_CFLAGS@|@LTLIBICONV@|' \
		${WRKSRC}/libwzd-core/Makefile.am
	@${REINPLACE_CMD} -e \
		's|INSTALLDIRS=vendor|INSTALLPRIVLIB=$${prefix}/lib| ; \
		 /MAKE/s| install| pure_install|' \
		${WRKSRC}/libwzd-perl/Makefile.am
.for i in backends modules
	@${FIND} ${WRKSRC}/${i} -name "Makefile.am" | ${XARGS} \
		${REINPLACE_CMD} -e \
		'/^libdir/s|$${pkgdatadir}|$${prefix}/lib/wzdftpd|'
.endfor
	@${FIND} ${WRKSRC} -name "*_tls.c" | ${XARGS} ${REINPLACE_CMD} -e \
		'/<gcrypt.h>/d ; \
		 /gcry_control/d' \

post-install:
	${INSTALL_DATA} ${WRKSRC}/*.pc ${PREFIX}/libdata/pkgconfig

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in AUTHORS ChangeLog NEWS Permissions.ReadMeFirst README \
	TLS.ReadMeFirst UPGRADING wzd_tls.cnf
	${INSTALL_DATA} ${WRKSRC}/${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
