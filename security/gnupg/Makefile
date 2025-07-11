PORTNAME=	gnupg
DISTVERSION=	2.4.8
CATEGORIES=	security
MASTER_SITES=	GNUPG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Complete and free PGP implementation
WWW=		https://www.gnupg.org/

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi
LICENSE_FILE_gpl3=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl3=	${WRKSRC}/COPYING.LGPL3

LIB_DEPENDS=	libassuan.so:security/libassuan \
		libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error \
		libksba.so:security/libksba \
		libnpth.so:devel/npth
RUN_DEPENDS=	pinentry:security/pinentry

USES=		compiler:c11 cpe gmake iconv makeinfo pkgconfig readline sqlite tar:bzip2

CONFLICTS=	dirmngr
CPE_VENDOR=	gnupg

CONFIGURE_ARGS=	--disable-ntbtls --enable-gpg-is-gpg2
GNU_CONFIGURE=	yes
INFO=		gnupg
TEST_TARGET=	check
TEST_ARGS=	TESTARGS=--parallel

OPTIONS_DEFINE=	DOCS GNUTLS LARGE_RSA LDAP NLS SCDAEMON SUID_GPG WKS_SERVER
OPTIONS_DEFAULT=GNUTLS SCDAEMON WKS_SERVER
OPTIONS_SUB=	yes

LARGE_RSA_DESC=	Enable support for 8192-bit RSA keys
LDAP_DESC=	LDAP keyserver interface
SCDAEMON_DESC=	Enable Smartcard daemon (with libusb)
SUID_GPG_DESC=	Install GPG as SUID root
WKS_SERVER_DESC=Install the Web Key Service server

GNUTLS_CONFIGURE_ENABLE=gnutls
GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls

LARGE_RSA_CONFIGURE_ENABLE=	large-secmem

LDAP_CONFIGURE_WITH=	ldap=${LOCALBASE}
LDAP_LIBS=		-L${LOCALBASE}/lib
LDAP_USE=		OPENLDAP=yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext

SCDAEMON_CONFIGURE_ENABLE=	scdaemon

WKS_SERVER_CONFIGURE_ENABLE=	wks-tools

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGNUTLS} && ${PORT_OPTIONS:MLDAP}
PLIST_SUB+=	DIRMNGRLDAP=""
.else
PLIST_SUB+=	DIRMNGRLDAP="@comment "
.endif

# Touch the texinfo files to force makeinfo to run.  This fixes Linuxisms in
# the paths in the man pages.
pre-build:
	${TOUCH} ${WRKSRC}/doc/*.texi

post-install:
	${MV} ${STAGEDIR}${PREFIX}/bin/gpgsplit ${STAGEDIR}${PREFIX}/bin/gpgsplit2
	${MV} ${STAGEDIR}${DATADIR}/help*.txt ${STAGEDIR}${DOCSDIR}

# Necessary because of --enable-gpg-is-gpg2
pre-test:
	${LN} -s gpg ${WRKSRC}/bin/gpg2

.include <bsd.port.mk>
